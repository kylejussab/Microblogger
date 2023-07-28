#### Installation requirements ####

To get the website up and running, open the terminal and run the following commands:
    - npm install (Installs all the node modules)
    - npm run build-db (Builds the database with some articles already provided)
    - npm run start (Starts the server)

No additional packages are required

#### Getting started with my project ####

The web application runs on the port number 3000, to access the homepage go to http://localhost:3000/


----- NAVIGATION WITH URLS -----
All pages have navigation built in, however if you'd like to visit specific pages through their URLS, the following is a list of all URLS:
    - Reader Homepage: http://localhost:3000/
    - Author Homepage: http://localhost:3000/author
    - Author Settings: http://localhost:3000/author/settings
    - Create New Draft: http://localhost:3000/author/new

The following URLS require the primary ID from the relevant table (Replace 'ID' with the numerical value):
    - Reader Article Page: http://localhost:3000/article/'ID'
    - Edit Draft Article: http://localhost:3000/author/edit/'ID'


----- BUILT IN NAVIGATION -----
    - On the majority of the webpages there will be a burger menu in the top right corner, this menu always has a link to the Author Homepage
    - On some pages there will be a left arrow, this arrow will take you to the previous page you were on
    - On the Author Homepage there will be a gear icon below the burger menu, clicking the icon will take you to the Author Settings page
    - The edit and create draft buttons on the Author Homepage will take you to their corresponding URLs
    - On the Reader Homepage there will be square 'cards', clicking anywhere on the card will take you to that articles reader page


----- CHANGING YOUR BLOG INFORMATION -----
    - To change your blog information (including the blog title, subtitle, and author) navigate to the Author Settings page. Once on the page you can change all fields relating to the blog on the current page

----- CREATING AND EDITING ARTICLES -----
    - To create a new article, navigate to the Author Homepage and click the button 'Create New Draft' underneath the Draft Articles table. From here you'll be taken to a page to fill in the title, subtitle, and body of your new article
    - To edit a draft, navigate to the Author Homepage and click the 'Edit' button in the row of the draft you would like to edit in the 'Draft Articles' table. From here you'll be taken to a page to change the title, subtitle, and body of your selected draft


----- PUBLISHING, SHARING, AND DELETING ARTICLES -----
    - To publish a draft, navigate to the Author Homepage and click the 'Publish' button in the row of the draft you would like to publish in the 'Draft Articles' table. This will open up a confirmation box, and if you click 'Yes' your draft will be moved from drafts to published
    - To get a share link (readers link) of your published article, navigate to the Author Homepage and click the 'Share' button in the row of the article you would like the readers link for in the 'Published Articles' table. This will open up an alert box with the sharing link
    - To delete any article (published or drafts), navigate to the Author Homepage and click the 'Delete' button in the row of the artilce you would like to delete in either the 'Draft Articles' or 'Published Articles' table. This will open up a confirmation box, and if you click 'Yes' your article will be deleted


----- LIKING AND COMMENTING -----
    - To like an article, at the top of the articles reader page, beneath the title and subtitle there will be a heart icon with the number of likes next to it, clicking ONLY the heart icon will add 1 like to the total count
    - To leave a comment on an article, scroll down to the bottom of the article, on the articles reader page, and type your comment in the textarea with the placeholder text "Write a comment...". Clicking the 'Add comment' button will post your comment, and all comments can be viewed beneath the article body


*All form inputs that get sent to the database cannot be blank. If any field is blank the page will reload with an error message, requesting you fill in all fields before submitting*

#### Shutting down the web application ####

Just a friendly reminder to stop running the server once you're done with the application