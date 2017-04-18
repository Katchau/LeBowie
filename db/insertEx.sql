INSERT INTO useracc (username, email, password, salt, first_name, last_name, birth, country, user_type) VALUES ('katp', 'katrina.palmer@gimail.com', 'b625c4673883767a0915944ee90852204c4b8907eb37f0155433dbc2b5081802', 'YMK462aV', 'katrina', 'palmer', '1977-06-23 11:35:10', 4, 'Registered');

INSERT INTO badge (color, text) VALUES ('#71fa5e', 'enthusiast');

INSERT INTO topic (admin_id, topicname, description) VALUES (1, 'programming', 'for programmers, just like you.');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 0, 0);

WITH ins1 AS(
    INSERT INTO Post (current_state, up_score, down_score) VALUES ('Published', 0, 0)
    RETURNING id AS newpostid
),ins2 AS(
    INSERT INTO PostInstance (user_id,post_id,description)
    SELECT 1,newpostid,'LoremIpsum?' FROM ins1
)
INSERT INTO Question(post_id,topic_id,title)    
--
INSERT INTO Post (current_state, up_score, down_score) VALUES ('Published', 0, 0);

INSERT INTO Question (post_id,topic_id,title) VALUES (@@Post.id,1,'Lorem');

INSERT INTO PostInstance (post_id,user_id,description) VALUES (@@Post.id,1,'Ipsum?');
--
INSERT INTO Post (current_state, up_score, down_score) VALUES ('Published', 0, 0);

INSERT INTO AnswerComment (post_id,answer_id) VALUES (@@Post.id,1);

INSERT INTO PostInstance (post_id,user_id,description) VALUES (@@Post.id,1,'Yes , ipsum.');