.mode columns
.headers on
.nullvalue NULL
--estes headers eram de sqlite, nao sei se pintam em postgresql

PRAGMA foreign_key = on;

/* USERS */
DROP TABLE IF EXISTS UserAcc;
CREATE TABLE UserAcc
(
	id INTEGER PRIMARY KEY,
	username VARCHAR(16) UNIQUE NOT NULL,
	password VARCHAR(32) NOT NULL,
    salt VARCHAR(32) NOT NULL,
	first_name VARCHAR(32) NOT NULL,
	last_name VARCHAR(32) NOT NULL,
    birth DATE NOT NULL,
	country INTEGER NOT NULL,
	description VARCHAR(256),
	image VARCHAR(32),
	score INTEGER DEFAULT 0,
	google BOOLEAN DEFAULT FALSE,
	CONSTRAINT Origin FOREIGN KEY country
		REFERENCES Country(id)
);

DROP TABLE IF EXISTS Badge;
CREATE TABLE Badge(
	id INTEGER PRIMARY KEY,
    color VARCHAR(16) NOT NULL,
    text VARCHAR(16) NOT NULL
);

DROP TABLE IF EXISTS Administrator;
CREATE TABLE Administrator
(
	id INTEGER PRIMARY KEY, -- é boa ideia ter 2 ids am i rite?
	user_id INTEGER UNIQUE NOT NULL,
	CONSTRAINT UserID FOREIGN KEY user_id
		REFERENCES UserAcc(id)
);

DROP TABLE IF EXISTS Moderator;
CREATE TABLE Moderator
(
	id INTEGER PRIMARY KEY, -- é boa ideia ter 2 ids am i rite?
	user_id INTEGER UNIQUE NOT NULL,
	CONSTRAINT UserID FOREIGN KEY user_id
		REFERENCES UserAcc(id)
);

DROP TABLE IF EXISTS Country;
CREATE TABLE Country
(
	id INTEGER PRIMARY KEY,
	name VARCHAR(32) NOT NULL UNIQUE
);

/* TOPIC */
DROP TABLE IF EXISTS Topic;
CREATE TABLE Topic(
	id INTEGER PRIMARY KEY,
	admin_id INTEGER NOT NULL,
    topicname VARCHAR(32) UNIQUE NOT NULL,
	description VARCHAR(1024) NOT NULL,
	CONSTRAINT CreatedBy FOREIGN KEY admin_id
		REFERENCES Administrator(id)
);

/* POSTS */
CREATE TYPE PostState AS ENUM ('Editing', 'Published', 'Deleted');
DROP TABLE IF EXISTS Post;
CREATE TABLE Post
(
	id INTEGER PRIMARY KEY,
	
	currentState PostState NOT NULL,
	up_score INTEGER NOT NULL DEFAULT 0,
    down_score INTEGER NOT NULL DEFAULT 0
	--to be updated see instance
);


DROP TABLE IF EXISTS PostInstance;
CREATE TABLE PostInstance(
	id INTEGER PRIMARY KEY,
	post_id INTEGER NOT NULL,
	--user_id INTEGER NOT NULL, isto é aqui ou no post?
	
    description VARCHAR(1024),
    creation DATE DEFAULT CURRENT_DATE,
	
	CONSTRAINT PostID FOREIGN KEY (post_id)
		REFERENCES Post(id)
	
	--CONSTRAINT UserID FOREIGN KEY (user_id) isto é em cima ou aqui??
		--REFERENCES UserAcc(id)
	
);

DROP TABLE IF EXISTS Question;
CREATE TABLE Question(
	post_id INTEGER PRIMARY KEY,
    topic_id INTEGER NOT NULL,
    title VARCHAR(64) NOT NULL,
	CONSTRAINT PostID FOREIGN KEY (post_id)
		REFERENCES PostInstance(id),
	CONSTRAINT TopicID FOREIGN KEY (topic_id)
		REFERENCES Topic(id)
);

DROP TABLE IF EXISTS Tag;
CREATE TABLE Tag
(
	id INTEGER PRIMARY KEY,
	text VARCHAR(32) NOT NULL
);

DROP TABLE IF EXISTS Answer;
CREATE TABLE Answer(
	post_id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
	accepted BOOLEAN DEFAULT FALSE,
	
	CONSTRAINT PostID FOREIGN KEY (post_id)
		REFERENCES Post(id),
	CONSTRAINT QuestionID FOREIGN KEY (question_id)
		REFERENCES Question(post_id)
);

DROP TABLE IF EXISTS AnswerComment;
CREATE TABLE AnswerComment(
	post_id INTEGER PRIMARY KEY,
    answer_id INTEGER NOT NULL,
	
	CONSTRAINT AnswerID FOREIGN KEY (post_id)
		REFERENCES Answer(post_id)
);

DROP TABLE IF EXISTS Report;
CREATE TABLE Report(
	id INTEGER PRIMARY KEY,
    post_id INTEGER NOT NULL,
	user_id INTEGER NOT NULL,
	
	CONSTRAINT PostID FOREIGN KEY (post_id)
		REFERENCES PostInstance(id),
	CONSTRAINT UserID FOREIGN KEY (user_id)
		REFERENCES UserAcc(id)
);

CREATE TYPE Action AS ENUM ('Create', 'Delete', 'Update', 'Upvote', 'Downvote');
DROP TABLE IF EXISTS Activity;
CREATE TABLE Activity(
	id INTEGER PRIMARY KEY,
    post_id INTEGER NOT NULL,
	user_id INTEGER NOT NULL,
	action Action NOT NULL,
	
	--CONSTRAINT PostID FOREIGN KEY (post_id)
		--REFERENCES PostInstance(id), mudar quando a tabela for updated
	CONSTRAINT UserID FOREIGN KEY (user_id)
		REFERENCES UserAcc(id)
);



-- RelationTables
-- falta fazer as relações * -- * :) :O :P 

DROP TABLE IF EXISTS OwnsBadge;
CREATE TABLE OwnsBadge(
	-- id INTEGER PRIMARY KEY,
	user_id INTEGER NOT NULL,
    badge_id INTEGER NOT NULL,
	
	CONSTRAINT UserID FOREIGN KEY (user_id)
		REFERENCES UserAcc(id),
	CONSTRAINT BadgeID FOREIGN KEY (badge_id)
		REFERENCES Badge(id)
);

DROP TABLE IF EXISTS Moderation;
CREATE TABLE Moderation
(
	-- id INTEGER PRIMARY KEY,
	mod_id INTEGER NOT NULL,
    topic_id INTEGER NOT NULL,
	UNIQUE(mod_id,topic_id), 
	
	CONSTRAINT ModeratorID FOREIGN KEY (mod_id)
		REFERENCES Moderator(id),
	CONSTRAINT TopicID FOREIGN KEY (topic_id)
		REFERENCES Topic(id)
);

DROP TABLE IF EXISTS TagAssociation;
CREATE TABLE TagAssociation
(
	-- id INTEGER PRIMARY KEY,
	question_id INTEGER NOT NULL,
    tag_id INTEGER NOT NULL,
	UNIQUE(question_id,tag_id), 
	
	CONSTRAINT QuestionID FOREIGN KEY (question_id)
		REFERENCES Question(post_id),
	CONSTRAINT TagID FOREIGN KEY (tag_id)
		REFERENCES Tag(id)
);