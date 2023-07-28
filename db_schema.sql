PRAGMA foreign_keys=ON;

BEGIN TRANSACTION;

CREATE TABLE IF NOT EXISTS blog (
    title TEXT NOT NULL,
    subtitle TEXT NOT NULL,
    author TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS drafts (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    subtitle TEXT NOT NULL,
    author TEXT NOT NULL,
    body TEXT NOT NULL,
    create_date DATETIME,
    last_modified DATETIME
);

CREATE TABLE IF NOT EXISTS articles (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    subtitle TEXT NOT NULL,
    author TEXT NOT NULL,
    body TEXT NOT NULL,
    create_date DATETIME,
    publish_date DATETIME,
    likes INTEGER DEFAULT 0
);

CREATE TABLE IF NOT EXISTS comments (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    body TEXT NOT NULL,
    create_date DATETIME,
    article_id INTEGER NOT NULL,
    FOREIGN KEY (article_id) REFERENCES articles(id) ON DELETE CASCADE
);

--Blog information
INSERT INTO blog ("title", "subtitle", "author")
VALUES ('Lets talk video games', 'My opinion on todays video games', 'Kyle Jussab');

--Inserts for the draftBlogs
INSERT INTO drafts ("title", "subtitle", "author", "body", "create_date", "last_modified")
VALUES ('Uncharted: The Lost Legacy', 'The best Uncharted game made', 'Kyle Jussab', 'In the vast world of Uncharted games, Uncharted: The Lost Legacy stands out as my personal favorite. This compact installment in the series captures the essence of what makes these games so enjoyable while delivering a fresh and captivating experience. It may seem strange to say that a non-Nathan Drake Uncharted game takes the crown, but for me, it was an unforgettable journey.

One of the standout aspects of Uncharted: The Lost Legacy is the chemistry between the two leading ladies, Chloe and Nadine. Their dynamic and banter create a compelling and entertaining partnership that keeps players engaged from start to finish. Their contrasting personalities and skills complement each other beautifully, adding depth and nuance to the gameplay and narrative.

The supporting characters in The Lost Legacy are equally memorable. Each one contributes to the story in meaningful ways, leaving a lasting impact on the player. I remember laughing heartily at Sam''s antics towards the end of the game, and as the credits rolled, I felt a genuine sense of happiness and fulfillment.

While the game may be shorter in duration compared to its predecessors, it doesn''t sacrifice any of the quality that fans have come to expect from the Uncharted series. In fact, the compact form of The Lost Legacy adds to its overall excellence. The game is finely crafted, paying attention to every small detail and delivering a cohesive experience that is both engaging and satisfying.

The treasure that serves as the focal point of the game is arguably the most memorable in the entire franchise. It left an indelible mark in my mind, and even now, I can vividly recall the excitement and awe I felt as I embarked on the quest to uncover its secrets. Uncharted: The Lost Legacy proves that it''s not always about the grand scale of the adventure but rather the quality of the journey and the treasures found along the way.

In conclusion, Uncharted: The Lost Legacy stands as a shining example of how getting the small things right can make a game truly exceptional. Its compact form and simplicity only add to its brilliance, providing a concentrated dose of the Uncharted magic. The chemistry between Chloe and Nadine, along with the memorable supporting characters, make for an unforgettable adventure. While it may be unusual to claim that a non-Nathan Drake Uncharted game is the best, The Lost Legacy was undeniably my best experience within the franchise. It showcases the power of quality storytelling, engaging gameplay, and the ability to leave a lasting impression. Uncharted: The Lost Legacy is a testament to the incredible talent and craftsmanship of Naughty Dog, solidifying its place as a remarkable addition to the Uncharted universe.', '1/7/2023, 7:07:21', '5/7/2023, 9:34:42');

INSERT INTO drafts ("title", "subtitle", "author", "body", "create_date", "last_modified")
VALUES ('The Witcher 3: Wild Hunt', 'A Gwent maestro', 'Kyle Jussab', 'The Witcher 3: Wild Hunt is a game that captured my heart in numerous ways. From its captivating characters to its enthralling story, this game delivered an unforgettable experience that immersed me in the rich world of Geralt of Rivia.

One aspect that stands out for me is my love for Ciri, Geralt''s adopted daughter and a key figure in the narrative. Her presence added depth and emotional weight to the story, making me deeply invested in her journey and well-being. The bond between Geralt and Ciri felt genuine and heartfelt, further enhancing the overall narrative experience.

The story of The Witcher 3: Wild Hunt is a masterclass in storytelling. The main questline kept me engaged and eager to uncover the mysteries that unfolded before me. But what truly sets this game apart are the side quests. They are not mere distractions; they are narratives in their own right, with depth and complexity that rival many games'' main storylines. The Bloody Baron questline is a shining example of this, delivering a tale of tragedy and redemption that could stand alone as a remarkable story in its own right.

In addition to the captivating storytelling, The Witcher 3: Wild Hunt offers a unique gameplay experience with the addictive card game Gwent. I found myself spending hours immersed in this mini-game, even returning to it after completing the main game. The attention to detail in crafting a strategic and engaging card game within the larger world of The Witcher 3 is commendable and a testament to the game''s overall depth and variety.

The RPG elements in The Witcher 3: Wild Hunt only serve to enhance the immersive experience. The constant search for the best armor and equipment became a personal quest for me, driving me to explore every nook and cranny of the vast open world before tackling main quests. The game enticed me to invest time and effort into perfecting Geralt''s abilities, making every encounter feel rewarding and empowering.

In conclusion, The Witcher 3: Wild Hunt is a true masterpiece that seamlessly weaves together engaging storytelling, immersive gameplay, and unforgettable characters. The depth and quality of the side quests rival many games'' main storylines, exemplifying the remarkable attention to detail and care put into crafting this world. The love for Ciri, the enthralling story, and the addictive Gwent card game all contribute to a gaming experience that is unparalleled.

The Witcher 3: Wild Hunt stands as a testament to the power of open-world gaming, raising the bar for what can be achieved in the genre. It is a game that demands to be savored and explored, rewarding players with a rich and fulfilling journey.', '7/7/2023, 2:14:57', '10/7/2023, 6:47:35');

--Inserts for the articles
INSERT INTO articles ("title", "subtitle", "author", "body", "create_date", "publish_date", "likes")
VALUES ('The Last of Us Part II', 'Why TLOU2 is the best game ever made', 'Kyle Jussab', 'Like many dedicated fans of The Last of Us franchise, I eagerly awaited the release of The Last of Us Part 2. The anticipation was almost unbearable, as I had been waiting for this game for six long years. Every trailer, every YouTube video, every piece of information I could gather about the game only fueled my excitement. Naughty Dog had created a masterpiece with the first game, and I held the sequel to the highest possible standard. Little did I know that The Last of Us Part 2 would not only meet my expectations but would surpass them in ways I couldn''t have imagined.
As a budding game developer myself, I had immersed myself in the world of video games, seeking inspiration and knowledge to hone my craft. The first game, The Last of Us, had a profound impact on me. It touched me on a deep emotional level, showcasing the potential of storytelling in video games. It was a game that resonated with me, and I yearned to create something that could elicit similar emotions in others.

When I finally got my hands on The Last of Us Part 2, I embarked on a journey that would change my life forever. From the very beginning, I was captivated by the game''s narrative prowess and technical brilliance. The story took unexpected turns, exploring complex themes of revenge, loss, and the human capacity for both darkness and redemption. It was a narrative rollercoaster that tugged at my heartstrings, leaving me in tears and contemplation.

But it wasn''t just the story that made The Last of Us Part 2 the best video game ever made. It was the attention to detail, the impeccable world-building, and the sheer artistry that oozed from every pixel of the game. The environments were meticulously crafted, immersing me in a post-apocalyptic world that felt hauntingly real. The gameplay mechanics were refined to perfection, offering a seamless blend of stealth, action, and survival elements. Every encounter was a tense and exhilarating experience, and the level design was a testament to Naughty Dog''s expertise.

What truly sets The Last of Us Part 2 apart is its ability to evoke genuine emotional responses from the player. The characters are not just virtual avatars; they are complex, multi-dimensional beings with their own hopes, fears, and flaws. I formed deep connections with Ellie, Abby, and the rest of the cast, experiencing their triumphs and tragedies as if they were my own. The performances by the voice actors were superb, breathing life into these digital characters and making them feel like real people struggling in a harsh world.

In a year as tumultuous as 2020, The Last of Us Part 2 became a beacon of hope and meaning for me. It provided solace and escapism during dark times and reminded me of the transformative power of video games. As I played through the game, I felt a profound sense of purpose and clarity. I realized that my passion for game development was not just a passing fancy but a calling that had the potential to touch lives and create meaningful experiences.

The Last of Us Part 2 transcends being just a video game. It is a work of art, a testament to the limitless possibilities of interactive storytelling. It has redefined what a video game can achieve, pushing the boundaries of the medium and challenging our preconceptions. Its impact will be felt for years to come, inspiring a new generation of game developers and forever shaping the landscape of narrative-driven gaming.

As I reflect on my experience with The Last of Us Part 2, I am filled with a profound sense of gratitude. Gratitude for Naughty Dog and their unwavering dedication to their craft. Gratitude for the unforgettable characters and their emotional journey. And gratitude for the realization that I have found my purpose in life. I am now more determined than ever to use every ounce of my energy and creativity to learn and craft similar experiences that touch hearts, challenge minds, and bring joy to players.

The Last of Us Part 2 is not just the best video game ever made; it is a masterpiece that has changed my life. It has shown me the power of storytelling, the beauty of art, and the potential of video games as a medium. I will carry the lessons I learned from this game with me throughout my journey as a game developer, striving to create experiences that resonate with players on a profound level. The Last of Us Part 2 will forever hold a special place in my heart, a reminder of the transformative power of video games and the endless possibilities that lie ahead.', '19/12/2022, 5:30:23', '1/1/2023, 7:02:52', '34');

INSERT INTO articles ("title", "subtitle", "author", "body", "create_date", "publish_date", "likes")
VALUES ('Ghost of Tsushima', 'A samurai and a thief', 'Kyle Jussab', 'Ghost of Tsushima is a game that took me by surprise and captured my heart from the moment I set foot on the island. It''s a sprawling open-world adventure that immerses players in the rich and vibrant world of feudal Japan. From its breathtaking landscapes to its captivating storyline, this game offers an experience that is both exhilarating and emotionally resonant.

One aspect of Ghost of Tsushima that truly stood out for me was the online Legends mode. It provided a fresh and exciting multiplayer experience that breathed new life into the game. The gameplay was undeniably fun, allowing me to team up with friends and take on challenging missions together. The cooperative nature of Legends mode created a sense of camaraderie and made every victory all the more satisfying.

Beyond the multiplayer aspect, Ghost of Tsushima is a game that shines in its single-player campaign. Lord Shimura, a central character in the story, left a lasting impression on me. His stoic demeanor and unwavering dedication to honor resonated deeply, adding a layer of complexity to the narrative. The relationships and conflicts portrayed throughout the story kept me engaged and invested, urging me to push forward and discover the fate of Jin Sakai.

The combat in Ghost of Tsushima is a thrilling dance of steel and strategy. The fluidity of the combat mechanics made each encounter a joy to experience. The elegant swordplay, combined with the ability to adapt to different combat styles, added depth and variety to the gameplay. It was undeniably fun to unleash devastating attacks and employ stealth tactics to take down enemies. However, I must admit that I didn''t quite feel a sense of mastery over the combat. While enjoyable, it sometimes lacked the depth and challenge that would have truly elevated the experience.

Despite this minor criticism, Ghost of Tsushima succeeds in capturing the essence of its setting. The attention to detail is impeccable, from the meticulously designed landscapes to the authentic portrayal of Japanese culture. The world feels alive, teeming with dynamic events and memorable characters that breathe life into the game. The exploration of Tsushima is a treat in itself, as every corner of the island reveals stunning vistas and hidden secrets, beckoning players to embark on countless side quests and activities.

In terms of visuals and audio design, Ghost of Tsushima is a masterpiece. The vibrant color palette and breathtaking environments create a sense of awe and immersion. The haunting melodies of the score complement the gameplay, evoking a range of emotions that heighten the overall experience. Even after completing the game, I find myself drawn back to the world of Tsushima, exploring its nooks and crannies, and relishing in its serene beauty.

Ghost of Tsushima is not without its flaws, but its strengths far outweigh its minor shortcomings. It is a game that celebrates the spirit of adventure and honor, transporting players to a time and place that is both historically significant and imaginatively crafted. Sucker Punch Productions has crafted a remarkable experience that will be remembered as one of the standout titles of the PlayStation 4 era.

In conclusion, Ghost of Tsushima is an epic journey that captivated me from start to finish. Its engrossing storyline, engaging combat, and breathtaking world make it a must-play for any fan of action-adventure games. While the combat may lack a sense of mastery and depth, the overall experience is a testament to the dedication and passion of the development team. Ghost of Tsushima is an homage to the beauty and tragedy of feudal Japan, and it deserves recognition as a standout title that pushes the boundaries of what video games can achieve.', '5/2/2023, 8:15:12', '17/2/2023, 9:25:47', '18');

INSERT INTO articles ("title", "subtitle", "author", "body", "create_date", "publish_date", "likes")
VALUES ('Life is Strange: True Colors', 'The best of the rest', 'Kyle Jussab', 'Life has a funny way of bringing us exactly what we need at the right time, and for me, Life is Strange: True Colors was that game. From the moment I started playing, I knew this was going to be a unique and deeply meaningful experience. I approached the game with a deliberate slowness, savoring every moment and immersing myself fully in its world. And oh, what a world it was.

The soundtrack of Life is Strange: True Colors remains etched in my mind even to this day. The carefully curated music captivated me, drawing me into the emotions of each scene. I found myself pausing, just to sit and listen, letting the music wash over me and transport me to a place where emotions run deep and stories unravel with delicate precision.

But it was the protagonist, Alex Chen, who truly stole my heart. Her journey mirrored my own in ways I couldn''t have anticipated. As an outsider looking in, I saw my own struggles reflected in her character. The scene where she seeks solace in her headphones to drown out the painful sounds of her brother and father arguing struck a chord deep within me. It was a poignant reminder of the power of music as a balm for the soul, a refuge in times of turmoil. In that moment, tears welled up in my eyes, for I understood the weight of Alex''s pain and the silent battles we fight within ourselves.

Life is Strange: True Colors has an uncanny ability to evoke genuine emotions, and I found myself riding the waves of sadness, joy, and everything in between. The game created a space where I could fully embrace and experience the emotions it intended to convey. It reminded me that games have the power to touch our hearts, to make us feel something real and profound. The pinnacle of this emotional journey was when Alex shared a passionate kiss with her love interest. In that moment, I not only witnessed her joy, but I felt it reverberate through every fiber of my being. It was a visceral experience that transcended the virtual world and resonated within me.

The impact of Life is Strange: True Colors extends beyond the boundaries of its gameplay. It reinforced my belief that video games have the potential to be more than just entertainment. They can be vessels for empathy, conduits for self-discovery, and catalysts for personal growth. This realization was a guiding light, illuminating my path toward a career in game development. Previously, my aspirations were solely tied to Naughty Dog, but Life is Strange: True Colors opened my eyes to the possibilities beyond a single studio. Square Enix and Deck Nine have proven themselves to be masterful storytellers, weaving narratives that tug at our heartstrings and remind us of the profound impact games can have on our lives.

I am filled with an unwavering desire to be part of this industry, to create games that mean something, that touch the souls of players and invite them on transformative journeys. Life is Strange: True Colors reaffirmed my conviction that games possess the power to transcend mere entertainment and become profound works of art. I yearn to contribute to this medium, to be a part of the teams that craft experiences that resonate with players on a deeply personal level.

Life is Strange: True Colors is not just a game I love; it is a testament to the boundless potential of video games as a medium for storytelling and emotional connection. It reminded me of the importance of empathy, self-discovery, and the shared human experience. Through this game, I discovered a renewed sense of purpose and a deep understanding of why I am drawn to game development. Life is Strange: True Colors will forever hold a special place in my heart, a reminder that games have the power to touch our lives in ways we never thought possible.', '27/3/2023, 4:33:54', '6/4/2023, 11:13:06', '9');

--Inserts for the comments
INSERT INTO comments ("body", "create_date", "article_id")
VALUES ('OMG I loved this game as well!', '4/1/2023, 9:30:17', '1');

INSERT INTO comments ("body", "create_date", "article_id")
VALUES ('I don''t know about the strong claim that it''s the best game ever made, the story was average at best.', '9/1/2023, 2:13:39', '1');

INSERT INTO comments ("body", "create_date", "article_id")
VALUES ('Lord Shimura was definitely the best character', '24/2/2023, 10:56:22', '2');

COMMIT;