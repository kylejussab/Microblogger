const express = require("express");
const router = express.Router();
const assert = require('assert');

router.get('/:id', async (req, res, next) => {
    const articleId = req.params.id;

    try{
        const article = await getArticle(articleId);
        const blog = await getBlogInformation();
        const comments = await getComments(articleId);
    
        res.render('article', {blog, article, comments, error: null});
    }
    catch(err){
        next(err);
    }
});
  
router.post('/:id/add-comment', async (req, res, next) => {
    const articleId = req.params.id;
    const {body} = req.body;
    const createDate = new Date().toLocaleString('en-GB', {timeZone: 'GMT'});

    // Make sure the form isn't blank
    if(!body){
        const error = "Cannot post a blank comment.";

        try{
            const article = await getArticle(articleId);
            const blog = await getBlogInformation();
            const comments = await getComments(articleId);
        
            res.render('article', {blog, article, comments, error});
        }
        catch(err){
            next(err);
        }
    }
    else{
        global.db.run('INSERT INTO comments (body, create_date, article_id) VALUES (?, ?, ?)', [body, createDate, articleId], function(err){
            if(err){
                next(err);
            }
            else{
                res.redirect('/article/' + articleId);
            }
        });
    }
});

router.get('/:id/add-like', (req, res, next) => {
    const articleId = req.params.id;

    global.db.run('UPDATE articles SET likes = likes + 1 WHERE id = ?', [articleId], function(err){
        if(err){
            next(err);
        }
        else{
            res.redirect('/article/' + articleId);
        }
    });
});

// Helper async functions
async function getArticle(articleId){
    return new Promise((resolve, reject) => {
        global.db.get('SELECT * FROM articles WHERE id = ?', [articleId], (err, row) => {
        if(err){
            reject(err);
        }
        else{
            resolve(row);
        }
      });
    });
}
  
async function getBlogInformation(){
    return new Promise((resolve, reject) => {
        global.db.get('SELECT * FROM blog', (err, row) => {
            if (err) {
                reject(err);
            } else {
            resolve(row);
            }
        });
    });
}

async function getComments(articleId){
    return new Promise((resolve, reject) => {
        global.db.all('SELECT * FROM comments WHERE article_id = ? ORDER BY id DESC', [articleId], (err, rows) => {
        if(err){
            reject(err);
        }
        else{
            resolve(rows);
        }
      });
    });
}

// Export the router object
module.exports = router;