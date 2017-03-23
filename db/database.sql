--nao tem headers o postgresql

DROP TABLE IF EXISTS Country CASCADE;
CREATE TABLE Country
(
	id INTEGER PRIMARY KEY,
	name VARCHAR(32) NOT NULL UNIQUE
);

DROP TABLE IF EXISTS Badge CASCADE;
CREATE TABLE Badge(
	id INTEGER PRIMARY KEY,
    color VARCHAR(16) NOT NULL,
    text VARCHAR(16) NOT NULL
);

/* USERS */
DROP TABLE IF EXISTS UserAcc CASCADE;
CREATE TABLE UserAcc
(
	id INTEGER PRIMARY KEY,
	username VARCHAR(16) UNIQUE NOT NULL,
	email VARCHAR(32) UNIQUE NOT NULL,
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
	CONSTRAINT Origin FOREIGN KEY (country)
		REFERENCES Country(id)
);

DROP TABLE IF EXISTS Administrator CASCADE;
CREATE TABLE Administrator
(
	id INTEGER PRIMARY KEY,
	user_id INTEGER UNIQUE NOT NULL,
	CONSTRAINT UserID FOREIGN KEY (user_id)
		REFERENCES UserAcc(id)
);

DROP TABLE IF EXISTS Moderator CASCADE;
CREATE TABLE Moderator
(
	id INTEGER PRIMARY KEY,
	user_id INTEGER UNIQUE NOT NULL,
	CONSTRAINT UserID FOREIGN KEY (user_id)
		REFERENCES UserAcc(id)
);


/* TOPIC */
DROP TABLE IF EXISTS Topic CASCADE;
CREATE TABLE Topic(
	id INTEGER PRIMARY KEY,
	admin_id INTEGER NOT NULL,
    topicname VARCHAR(32) UNIQUE NOT NULL,
	description VARCHAR(1024) NOT NULL,
	CONSTRAINT CreatedBy FOREIGN KEY (admin_id)
		REFERENCES Administrator(id)
);

/* POSTS */
DROP TYPE IF EXISTS PostState CASCADE;
CREATE TYPE PostState AS ENUM ('Editing', 'Published', 'Deleted');

DROP TABLE IF EXISTS Post CASCADE;
CREATE TABLE Post
(
	id INTEGER PRIMARY KEY,
	
	currentState PostState NOT NULL,
	up_score INTEGER NOT NULL DEFAULT 0,
    down_score INTEGER NOT NULL DEFAULT 0
);


DROP TABLE IF EXISTS PostInstance CASCADE;
CREATE TABLE PostInstance(
	id INTEGER PRIMARY KEY,
	post_id INTEGER NOT NULL,
	user_id INTEGER NOT NULL,
	
    description VARCHAR(1024),
    creation DATE DEFAULT CURRENT_DATE,
	
	CONSTRAINT PostID FOREIGN KEY (post_id)
		REFERENCES Post(id),
	CONSTRAINT Created FOREIGN KEY (user_id)
		REFERENCES UserAcc(id)
	
);

DROP TABLE IF EXISTS Question CASCADE;
CREATE TABLE Question(
	post_id INTEGER PRIMARY KEY,
    topic_id INTEGER NOT NULL,
    title VARCHAR(64) NOT NULL,
	CONSTRAINT PostID FOREIGN KEY (post_id)
		REFERENCES PostInstance(id),
	CONSTRAINT TopicID FOREIGN KEY (topic_id)
		REFERENCES Topic(id)
);

DROP TABLE IF EXISTS Tag CASCADE;
CREATE TABLE Tag
(
	id INTEGER PRIMARY KEY,
	text VARCHAR(32) NOT NULL
);

DROP TABLE IF EXISTS Answer CASCADE;
CREATE TABLE Answer(
	post_id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
	accepted BOOLEAN DEFAULT FALSE,
	
	CONSTRAINT PostID FOREIGN KEY (post_id)
		REFERENCES Post(id),
	CONSTRAINT QuestionID FOREIGN KEY (question_id)
		REFERENCES Question(post_id)
);

DROP TABLE IF EXISTS AnswerComment CASCADE;
CREATE TABLE AnswerComment(
	post_id INTEGER PRIMARY KEY,
    answer_id INTEGER NOT NULL,
	
	CONSTRAINT AnswerID FOREIGN KEY (post_id)
		REFERENCES Answer(post_id)
);

DROP TABLE IF EXISTS Report CASCADE;
CREATE TABLE Report(
	id INTEGER PRIMARY KEY,
    post_id INTEGER NOT NULL,
	user_id INTEGER NOT NULL,
	title VARCHAR(32) NOT NULL,
	content VARCHAR(128) NOT NULL,
	reason VARCHAR(64) NOT NULL,
	created DATE DEFAULT CURRENT_DATE,
	
	CONSTRAINT PostID FOREIGN KEY (post_id)
		REFERENCES PostInstance(id),
	CONSTRAINT UserID FOREIGN KEY (user_id)
		REFERENCES UserAcc(id)
);

DROP TYPE IF EXISTS Action CASCADE;
CREATE TYPE Action AS ENUM ('Create', 'Delete', 'Update', 'Upvote', 'Downvote');

DROP TABLE IF EXISTS Activity CASCADE;
CREATE TABLE Activity(
	id INTEGER PRIMARY KEY,
    postContent_id INTEGER,
	post_id INTEGER NOT NULL,
	user_id INTEGER NOT NULL,
	action Action NOT NULL,
	
	CONSTRAINT PostID FOREIGN KEY (post_id)
		REFERENCES Post(id),
	CONSTRAINT PostInstanceID FOREIGN KEY (postContent_id)
		REFERENCES PostInstance(id),
	CONSTRAINT UserID FOREIGN KEY (user_id)
		REFERENCES UserAcc(id)
);



-- RelationTables

DROP TABLE IF EXISTS OwnsBadge CASCADE;
CREATE TABLE OwnsBadge(
	-- id INTEGER PRIMARY KEY,
	user_id INTEGER NOT NULL,
    badge_id INTEGER NOT NULL,
	PRIMARY KEY (user_id, badge_id),
	
	CONSTRAINT UserID FOREIGN KEY (user_id)
		REFERENCES UserAcc(id),
	CONSTRAINT BadgeID FOREIGN KEY (badge_id)
		REFERENCES Badge(id)
);

DROP TABLE IF EXISTS Moderation CASCADE;
CREATE TABLE Moderation
(
	-- id INTEGER PRIMARY KEY,
	mod_id INTEGER NOT NULL,
    topic_id INTEGER NOT NULL,
	PRIMARY KEY(mod_id,topic_id), 
	
	CONSTRAINT ModeratorID FOREIGN KEY (mod_id)
		REFERENCES Moderator(id),
	CONSTRAINT TopicID FOREIGN KEY (topic_id)
		REFERENCES Topic(id)
);

DROP TABLE IF EXISTS TagAssociation CASCADE;
CREATE TABLE TagAssociation
(
	-- id INTEGER PRIMARY KEY,
	question_id INTEGER NOT NULL,
    tag_id INTEGER NOT NULL,
	PRIMARY KEY(question_id,tag_id), 
	
	CONSTRAINT QuestionID FOREIGN KEY (question_id)
		REFERENCES Question(post_id),
	CONSTRAINT TagID FOREIGN KEY (tag_id)
		REFERENCES Tag(id)
);

CREATE TRIGGER IF NOT EXISTS update_score AFTER UPDATE OF up_score ON Post
FOR EACH ROW
BEGIN
	UPDATE  UserAcc SET score = 1+(SELECT score FROM UserAcc WHERE UserAcc.id = (SELECT user_id FROM Activity WHERE NEW.id = Activity.post_id and Activity.action = 'create'))
	WHERE UserAcc.id = (SELECT user_id FROM Activity WHERE NEW.id = Activity.post_id and Activity.action = 'create')
END;