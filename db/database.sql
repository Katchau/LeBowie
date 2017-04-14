
DROP TABLE IF EXISTS Country CASCADE;
CREATE TABLE Country
(
	id SERIAL PRIMARY KEY,
	name VARCHAR(32) NOT NULL UNIQUE
);

DROP TABLE IF EXISTS Badge CASCADE;
CREATE TABLE Badge(
	id SERIAL PRIMARY KEY,
    color VARCHAR(16) NOT NULL,
    text VARCHAR(32) NOT NULL
);

DROP TYPE IF EXISTS UserType CASCADE;
CREATE TYPE UserType AS ENUM ('Registered', 'Moderator', 'Administrator');

/* USERS */
DROP TABLE IF EXISTS UserAcc CASCADE;
CREATE TABLE UserAcc
(
	id SERIAL PRIMARY KEY,
	username VARCHAR(32) UNIQUE NOT NULL,
	email VARCHAR(32) UNIQUE NOT NULL,
	password VARCHAR(64) NOT NULL,
    salt VARCHAR(32) NOT NULL,
	first_name VARCHAR(32) NOT NULL,
	last_name VARCHAR(32) NOT NULL,
    birth DATE NOT NULL,
	country INTEGER NOT NULL,
	description VARCHAR(256),
	image VARCHAR(32),
	score INTEGER DEFAULT 0,
	google BOOLEAN DEFAULT FALSE,
	user_type UserType NOT NULL DEFAULT 'Registered',
	CONSTRAINT Origin FOREIGN KEY (country)
		REFERENCES Country(id)
);

/* TOPIC */
DROP TABLE IF EXISTS Topic CASCADE;
CREATE TABLE Topic(
	id SERIAL PRIMARY KEY,
	admin_id INTEGER NOT NULL,
    topicname VARCHAR(32) UNIQUE NOT NULL,
	description VARCHAR(1024) NOT NULL,
	CONSTRAINT CreatedBy FOREIGN KEY (admin_id)
		REFERENCES UserAcc(id)
);

/* POSTS */
DROP TYPE IF EXISTS PostState CASCADE;
CREATE TYPE PostState AS ENUM ('Editing', 'Published', 'Deleted');

DROP TABLE IF EXISTS Post CASCADE;
CREATE TABLE Post
(
	id SERIAL PRIMARY KEY,
	current_state PostState NOT NULL,
	up_score INTEGER NOT NULL DEFAULT 0,
    down_score INTEGER NOT NULL DEFAULT 0
);


DROP TABLE IF EXISTS PostInstance CASCADE;
CREATE TABLE PostInstance(
	id SERIAL PRIMARY KEY,
	post_id INTEGER NOT NULL,
	user_id INTEGER NOT NULL,
	
    description VARCHAR(32768),
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
    title VARCHAR(512) NOT NULL,
	CONSTRAINT PostID FOREIGN KEY (post_id)
		REFERENCES Post(id),
	CONSTRAINT TopicID FOREIGN KEY (topic_id)
		REFERENCES Topic(id)
);

DROP TABLE IF EXISTS Tag CASCADE;
CREATE TABLE Tag
(
	id SERIAL PRIMARY KEY,
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
	
	CONSTRAINT PostID FOREIGN KEY (post_id)
		REFERENCES Post(id),
	CONSTRAINT AnswerID FOREIGN KEY (answer_id)
		REFERENCES Answer(post_id)
);

DROP TABLE IF EXISTS Report CASCADE;
CREATE TABLE Report(
	id SERIAL PRIMARY KEY,
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
	id SERIAL PRIMARY KEY,
    post_content_id INTEGER,
	post_id INTEGER NOT NULL,
	user_id INTEGER NOT NULL,
	action Action NOT NULL,
	
	CONSTRAINT PostID FOREIGN KEY (post_id)
		REFERENCES Post(id),
	CONSTRAINT PostInstanceID FOREIGN KEY (post_content_id)
		REFERENCES PostInstance(id),
	CONSTRAINT UserID FOREIGN KEY (user_id)
		REFERENCES UserAcc(id)
);

-- RelationTables

DROP TABLE IF EXISTS UserAccBadge CASCADE;
CREATE TABLE UserAccBadge
(
	user_id INTEGER NOT NULL,
    badge_id INTEGER NOT NULL,
	PRIMARY KEY (user_id, badge_id),
	
	CONSTRAINT UserID FOREIGN KEY (user_id)
		REFERENCES UserAcc(id),
	CONSTRAINT BadgeID FOREIGN KEY (badge_id)
		REFERENCES Badge(id)
);

DROP TABLE IF EXISTS TopicUserAcc CASCADE;
CREATE TABLE TopicUserAcc
(
	mod_id INTEGER NOT NULL,
    topic_id INTEGER NOT NULL,
	PRIMARY KEY(mod_id,topic_id), 
	
	CONSTRAINT ModeratorID FOREIGN KEY (mod_id)
		REFERENCES UserAcc(id),
	CONSTRAINT TopicID FOREIGN KEY (topic_id)
		REFERENCES Topic(id)
);

DROP TABLE IF EXISTS QuestionTag CASCADE;
CREATE TABLE QuestionTag
(
	question_id INTEGER NOT NULL,
    tag_id INTEGER NOT NULL,
	PRIMARY KEY(question_id,tag_id), 
	
	CONSTRAINT QuestionID FOREIGN KEY (question_id)
		REFERENCES Question(post_id),
	CONSTRAINT TagID FOREIGN KEY (tag_id)
		REFERENCES Tag(id)
);

CREATE INDEX post_score_index
ON Post
USING btree (up_score DESC)
WHERE current_state = 'Published';

CREATE INDEX questions_creation_time_index
ON Question
USING btree (post_id DESC);
 
CREATE INDEX question_title_search ON Question USING gin(tsvector(title)); 

CREATE INDEX post_instance_creation_time_id
ON PostInstance
USING btree (post_id DESC);

CREATE INDEX answer_question_id_index
ON Answer
USING hash (question_id);

CREATE INDEX comment_answer_id_index
ON AnswerComment
USING hash (answer_id);

CREATE INDEX tag_name_index
ON Tag
USING hash (text);

CREATE INDEX reports_creation_time_index
ON Report
USING btree (id DESC);

CREATE INDEX user_username_index
ON UserAcc
USING hash (username);

--Triggers

CREATE FUNCTION update_PostScores() RETURNS TRIGGER
	LANGUAGE plpgsql
AS $update_Scores$
BEGIN
	IF (NEW.action = 'Upvote')
	THEN 	UPDATE Post SET up_score = up_score + 1 WHERE NEW.post_id = Post.id;
	ELSIF (NEW.action = 'Downvote')
	THEN UPDATE Post SET down_score = down_score + 1 WHERE NEW.post_id = Post.id;
	END IF;
	RETURN NEW;
END;
$update_Scores$;
 
CREATE TRIGGER UpdatePostScores
	AFTER INSERT
	ON Activity
	FOR EACH ROW
	EXECUTE PROCEDURE update_PostScores();

	

CREATE FUNCTION update_UserScores() RETURNS TRIGGER
	LANGUAGE plpgsql
AS $update_Scores$
BEGIN
	IF (NEW.action = 'Upvote')
	THEN UPDATE UserAcc SET score = score + 1 WHERE NEW.user_id = (SELECT DISTINCT UserAcc.id
											FROM (Question INNER JOIN PostInstance ON Question.post_id = PostInstance.post_id)
											INNER JOIN UserAcc ON PostInstance.user_id = UserAcc.id
											WHERE Question.post_id = NEW.post_id);
	ELSIF (NEW.action = 'Downvote')
	THEN UPDATE UserAcc SET score = score - 1 WHERE NEW.user_id = (SELECT DISTINCT UserAcc.id
											FROM (Question INNER JOIN PostInstance ON Question.post_id = PostInstance.post_id)
											INNER JOIN UserAcc ON PostInstance.user_id = UserAcc.id
											WHERE Question.post_id = NEW.post_id);
	END IF;
	RETURN NEW;
END;
$update_Scores$;
 
CREATE TRIGGER UpdateUserScores
	AFTER INSERT
	ON Activity
	FOR EACH ROW
	EXECUTE PROCEDURE update_UserScores();
	
	
 CREATE FUNCTION user_cant_answer_own() RETURNS TRIGGER
	LANGUAGE plpgsql
AS $$
BEGIN
 
  IF EXISTS ( SELECT DISTINCT UserAcc.id, Question.post_id
              FROM (Question INNER JOIN PostInstance ON Question.post_id = PostInstance.post_id)
              INNER JOIN UserAcc ON PostInstance.user_id = UserAcc.id
              WHERE Question.post_id = NEW.question_id AND UserAcc.id =
                                                                         (SELECT DISTINCT UserAcc.id
                                                                         FROM (Answer INNER JOIN PostInstance ON Answer.post_id = PostInstance.post_id)
                                                                         INNER JOIN UserAcc ON PostInstance.user_id = UserAcc.id
                                                                         WHERE Answer.post_id = NEW.post_id ))
  THEN
  RAISE EXCEPTION ' Cannot answer own question ';
  END IF;
 
END;
$$;
 
CREATE TRIGGER Usercantanswerown
	BEFORE INSERT
	ON Answer
	FOR EACH ROW
	EXECUTE PROCEDURE user_cant_answer_own();
	

	
CREATE FUNCTION question_unique_tags() RETURNS TRIGGER
	LANGUAGE plpgsql
AS $$
BEGIN
	IF EXISTS(SELECT question_id, tag_id FROM QuestionTag WHERE question_id = NEW.question_id AND tag_id = NEW.tag_id)
	THEN
	RAISE EXCEPTION ' Cannot have two of the same tag for a given question ';
	END IF;
 
END;
$$
;
 
CREATE TRIGGER QuestionWithUniqueTags
	BEFORE INSERT
	ON QuestionTag
	FOR EACH ROW
	EXECUTE PROCEDURE question_unique_tags()
;


DROP FUNCTION IF EXISTS delete_tag();
CREATE FUNCTION
	delete_tag()
RETURNS TRIGGER AS $tagged$
	BEGIN
                IF EXISTS (SELECT * FROM Tag, QuestionTag 
                WHERE id <> tag_id) THEN
		DROP TABLE Tag;
                END IF;
		RETURN OLD;
	END;
$tagged$ LANGUAGE plpgsql;
 
 
CREATE TRIGGER "DeleteTag" 
BEFORE DELETE ON question 
FOR EACH ROW 
EXECUTE PROCEDURE delete_tag();


DROP FUNCTION IF EXISTS at_least_one_admin();
CREATE FUNCTION
	at_least_one_admin()
RETURNS TRIGGER AS $aadmin$
	BEGIN
        IF (SELECT COUNT(*) FROM (SELECT DISTINCT * FROM UserAcc WHERE user_type = 'Administrator') AS Sel)  = 1 AND OLD.user_type = 'Administrator'
        THEN RAISE EXCEPTION ' Cannot have less than one administrator! ';
        END IF;
        RETURN OLD;
	END;
$aadmin$ LANGUAGE plpgsql;
 
 
CREATE TRIGGER "KeepAdmin" 
BEFORE DELETE ON UserAcc
FOR EACH ROW 
EXECUTE PROCEDURE at_least_one_admin();

CREATE VIEW cur_admins AS
SELECT id,username  
FROM UserAcc  
WHERE user_type = 'Administrator';

CREATE VIEW cur_mods AS 
SELECT id,username 
FROM UserAcc  
WHERE user_type = 'Moderator';  

CREATE VIEW mod_topics AS
SELECT username,topicname 
FROM (Topic INNER JOIN TopicUserAcc ON Topic.id = TopicUserAcc.topic_id)   
INNER JOIN mods ON TopicUserAcc.mod_id = mods.id;  

CREATE VIEW user_question_titles
SELECT DISTINCT UserAcc.id, Question.post_id, title
FROM (Question INNER JOIN PostInstance ON Question.post_id = PostInstance.post_id)
INNER JOIN UserAcc ON PostInstance.user_id = UserAcc.id
ORDER BY UserAcc.id;

-- adicionar outras à medida que precisem