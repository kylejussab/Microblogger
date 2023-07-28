const express = require("express");
const router = express.Router();
const assert = require('assert');

router.get('/', async (req, res, next) => {
    try{
        const drafts = await getDraftArticles();
        const blog = await getBlogInformation();
        const published = await getPublishedArticles();
    
        res.render('author-home', {blog, drafts, published});
    }
    catch(err){
        next(err);
    }
});

router.get('/edit/:id', async (req, res, next) => {
    const articleId = req.params.id;
    
    try{
        const draft = await getDraft(articleId);
        const blog = await getBlogInformation();
        res.render('edit-article', {draft, blog, error: null});
    }
    catch(err){
        next(err);
    }
});

router.post('/edit/update/:id', async (req, res, next) => {
    const articleId = req.params.id;
    const {title, subtitle, body} = req.body;
    const lastModified = new Date().toLocaleString('en-GB', {timeZone: 'GMT'});
  
    // Make sure the form isn't blank
    if(!title || !subtitle || !body){
        const error = "All fields are required.";

        try{
            const draft = await getDraft(articleId);
            const blog = await getBlogInformation();
            res.render('edit-article', {draft, blog, error});
        }
        catch(err){
            next(err);
        }
    } 
    else{
        try{
            global.db.run('UPDATE drafts SET title = ?, subtitle = ?, body = ?, last_modified = ? WHERE id = ?', [title, subtitle, body, lastModified, articleId]);
            res.redirect('/author');
        }
        catch(err){
            next(err);
        }
    }
});

router.get('/publish/:id', async (req, res, next) => {
    const articleId = req.params.id;

    try{
        const draft = await getDraft(articleId);

        const {title, subtitle, author, body, create_date} = draft;
        const publishDate = new Date().toLocaleString('en-GB', {timeZone: 'GMT'});

            try{
                // Add the article to the articles table
                global.db.run('INSERT INTO articles (title, subtitle, author, body, create_date, publish_date) VALUES (?, ?, ?, ?, ?, ?)', [title, subtitle, author, body, create_date, publishDate]);

                // Delete the article from the drafts table
                global.db.run('DELETE FROM drafts WHERE id = ?', [articleId]);
                res.redirect("/author");
            }
            catch(err){
                next(err);
            }
    }
    catch(err){
        next(err);
    }
});

router.get('/delete/:id', (req, res, next) => {
    const articleId = req.params.id;

    try{
        global.db.run('DELETE FROM drafts WHERE id = ?', [articleId]);
        res.redirect("/author");
    }
    catch(err){
        next(err);
    }
});

router.get('/new', async (req, res, next) => {
    try{
        const blog = await getBlogInformation();
        res.render('new-article', {blog, error: null});
    }
    catch(err){
        next(err);
    }
});

router.post('/new/create', async (req, res, next) => {
    const {title, subtitle, body} = req.body;
    const createdAt = new Date().toLocaleString('en-GB', {timeZone: 'GMT'});
    const lastModified = createdAt;
    
    // Make sure the form isn't blank
    if(!title || !subtitle || !body) {
        const error = 'All fields are required.';
        try{
            const blog = await getBlogInformation();
            res.render('new-article', {blog, error});
        }
        catch(err){
            next(err);
        }
    } 
    else{
        try{
            const blog = await getBlogInformation();
            const updatedAuthor = blog.author;
    
            try{
                global.db.run('INSERT INTO drafts (title, subtitle, author, body, create_date, last_modified) VALUES (?, ?, ?, ?, ?, ?)', [title, subtitle, updatedAuthor, body, createdAt, lastModified]);
                res.redirect('/author');
            }
            catch(err){
                next(err);
            }
        }
        catch(err){
            next(err);
        }
    }
});

router.get('/delete-published/:id', (req, res, next) => {
    const articleId = req.params.id;
    
    try{
        global.db.run('DELETE FROM articles WHERE id = ?', [articleId]);
        res.redirect("/author");
    }
    catch(err){
        next(err);
    }
});

router.get("/settings", async (req, res) => {
    try{
        const blog = await getBlogInformation();
        res.render('author-settings', {blog, error: null});
    }
    catch(err){
        next(err);
    }
});

router.post('/settings/update/', async (req, res, next) => {
    const {title, subtitle, author} = req.body;

    // Make sure the form isn't blank
    if(!title || !subtitle || !author){
        const error = 'All fields are required.';

        try{
            const blog = await getBlogInformation();
            res.render('author-settings', {blog, error});
        }
        catch(err){
            next(err);
        }
    } 
    else{
        try{
            global.db.run('UPDATE blog SET title = ?, subtitle = ?, author = ?', [title, subtitle, author]);
            global.db.run('UPDATE drafts SET author = ?', [author]);
            global.db.run('UPDATE articles SET author = ?', [author]);
            res.redirect('/author');
        }
        catch(err){
            next(err);
        }
    }
});

// Helper async functions
async function getPublishedArticles(){
    return new Promise((resolve, reject) => {
      global.db.all('SELECT * FROM articles', (err, rows) => {
        if(err){
          reject(err);
        }
        else{
          resolve(rows);
        }
      });
    });
}
  
async function getBlogInformation() {
    return new Promise((resolve, reject) => {
        global.db.get('SELECT * FROM blog', (err, row) => {
        if(err){
            reject(err);
        } 
        else{
            resolve(row);
        }
        });
    });
}

async function getDraftArticles(){
    return new Promise((resolve, reject) => {
      global.db.all('SELECT * FROM drafts', (err, rows) => {
        if(err){
          reject(err);
        }
        else{
          resolve(rows);
        }
      });
    });
}

async function getDraft(articleId){
    return new Promise((resolve, reject) => {
        global.db.get('SELECT * FROM drafts WHERE id = ?', [articleId], (err, row) => {
        if(err){
            reject(err);
        }
        else{
            resolve(row);
        }
      });
    });
}

// Export the router object
module.exports = router;