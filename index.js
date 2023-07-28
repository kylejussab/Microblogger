const express = require('express');
const app = express();
const port = 3000;
const sqlite3 = require('sqlite3').verbose();

// Items in the global namespace are accessible throught out the node application
global.db = new sqlite3.Database('./database.db', function(err){
    if(err){
        console.error(err);
        // Bail out, we can't connect to the DB
        process.exit(1);
    }
    else{
        console.log("Database connected");
        // Tells SQLite to pay attention to foreign key constraints
        global.db.run("PRAGMA foreign_keys=ON");
    }
});

const authorRoutes = require('./routes/author');
const articleRoutes = require('./routes/article');

//set the app to use ejs for rendering
app.set('view engine', 'ejs');

app.get('/', async (req, res, next) => {
    try{
        // Sorting by the id is fine, as all new published articles are added to the bottom
        const published = await getPublishedArticles();
        const blog = await getBlogInformation();

        res.render('reader-home', {blog, published});
    }
    catch(err){
        next(err);
    }
});

// Allow the parsing of body data
app.use(express.urlencoded({extended: true}));
app.use(express.json());

// Allow for external stylesheets
app.use(express.static('public'));

app.use('/author', authorRoutes);
app.use('/article', articleRoutes);

app.listen(port, () => {
    console.log(`Example app listening on port ${port}`)
});

// Helper async functions
async function getPublishedArticles(){
    return new Promise((resolve, reject) => {
        // Decending ID order is the same as datetime decending order
        global.db.all('SELECT * FROM articles ORDER BY id DESC', (err, rows) => {
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