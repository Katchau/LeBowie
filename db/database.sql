.mode columns
.headers on
.nullvalue NULL

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
	country VARCHAR(32) NOT NULL,
    birth DATE NOT NULL,
	description VARCHAR(256),
	image VARCHAR(32)
);

/* TOPIC */
DROP TABLE IF EXISTS Topic;
CREATE TABLE Topic(
	id INTEGER PRIMARY KEY,
    topicname VARCHAR(32) UNIQUE NOT NULL
);

/* POSTS */

DROP TABLE IF EXISTS Post;
CREATE TABLE Post(
	id INTEGER PRIMARY KEY,
	user_id INTEGER NOT NULL,
    created DATE NOT NULL,
    
    description VARCHAR(1024) NOT NULL,
    
    up_score INTEGER NOT NULL DEFAULT 0,
    down_score INTEGER NOT NULL DEFAULT 0,
    
    edit_by VARCHAR(32),
    edit_date DATE,
	
	CONSTRAINT UserID FOREIGN KEY (user_id)
		REFERENCES UserAcc(id)
);

DROP TABLE IF EXISTS Question;
CREATE TABLE Question(
	post_id INTEGER PRIMARY KEY,
    topic_id INTEGER NOT NULL,
    title VARCHAR(64) NOT NULL,
	CONSTRAINT PostID FOREIGN KEY (post_id)
		REFERENCES Post(id),
	CONSTRAINT TopicID FOREIGN KEY (topic_id)
		REFERENCES Topic(id)
);

DROP TABLE IF EXISTS Answer;
CREATE TABLE Answer(
	post_id INTEGER PRIMARY KEY,
    
    question_id INTEGER NOT NULL,
	
	CONSTRAINT PostID FOREIGN KEY (post_id)
		REFERENCES Post(id),
	CONSTRAINT QuestionID FOREIGN KEY (question_id)
		REFERENCES Question(id)
);

DROP TABLE IF EXISTS AnswerComment;
CREATE TABLE AnswerComment(
	id INTEGER PRIMARY KEY,
   
    answer_id INTEGER NOT NULL,
	
	CONSTRAINT AnswerID FOREIGN KEY (answer_id)
		REFERENCES Answer(post_id)
);

/* BADGES */
DROP TABLE IF EXISTS Badge;
CREATE TABLE Badge(
	id INTEGER PRIMARY KEY,
    color VARCHAR(16) NOT NULL,
    text VARCHAR(16) NOT NULL
);

DROP TABLE IF EXISTS HasBadge;
CREATE TABLE HasBadge(
	id INTEGER PRIMARY KEY,
	user_id INTEGER NOT NULL,
    badge_id INTEGER NOT NULL,
	
	CONSTRAINT UserID FOREIGN KEY (user_id)
		REFERENCES UserAcc(id),
	CONSTRAINT BadgeID FOREIGN KEY (badge_id)
		REFERENCES Badge(id)
);
