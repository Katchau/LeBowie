PRAGMA foreign_key = on;

/* USERS */
DROP TABLE IF EXISTS UserAcc;
CREATE TABLE UserAcc(
	id INTEGER PRIMARY KEY,
	username VARCHAR(16) UNIQUE NOT NULL,
	passhash VARCHAR(32) NOT NULL,
    salt VARCHAR(32) NOT NULL,
	first_name VARCHAR(32),
	last_name VARCHAR(32),
	country VARCHAR(32),
    birth DATE,
	description VARCHAR(256),
	image VARCHAR(32) DEFAULT 'generic_user.png'
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
    user_id INTEGER REFERENCES UserAcc.id,
    created DATE NOT NULL,
    
    description VARCHAR(1024) NOT NULL,
    
    up_score INTEGER NOT NULL DEFAULT 0,
    down_score INTEGER NOT NULL DEFAULT 0,
    
    edit_by VARCHAR(32),
    edit_date DATE
);

DROP TABLE IF EXISTS Question;
CREATE TABLE Question(
	post_id INTEGER PRIMARY KEY REFERENCES Post.id,
    topic_id INTEGER NOT NULL REFERENCES Topic.id,
    title VARCHAR(64) NOT NULL
);

DROP TABLE IF EXISTS Answer;
CREATE TABLE Answer(
	post_id INTEGER PRIMARY KEY REFERENCES Post.id,
    
    question_id INTEGER NOT NULL REFERENCES Question.post_id
);

DROP TABLE IF EXISTS AnswerComment;
CREATE TABLE AnswerComment(
	id INTEGER PRIMARY KEY,
   
    answer_id INTEGER NOT NULL REFERENCES Answer.post_id
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
	user_id INTEGER REFERENCES UserAcc.id,
    badge_id INTEGER REFERENCES Badge.id
);
