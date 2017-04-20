INSERT INTO country (name) VALUES ('portugal');
INSERT INTO country (name) VALUES ('france');
INSERT INTO country (name) VALUES ('spain');
INSERT INTO country (name) VALUES ('england');
INSERT INTO country (name) VALUES ('italy');
INSERT INTO country (name) VALUES ('united states of america');

INSERT INTO badge (color, text) VALUES ('#421deb', 'novice');
INSERT INTO badge (color, text) VALUES ('#e0f6b9', 'enthusiast');
INSERT INTO badge (color, text) VALUES ('#345c70', 'expert');

INSERT INTO useracc (username, email, password, salt, first_name, last_name, birth, country, user_type) VALUES ('whitetiger938', 'basile.marchand@example.com', '885f99c2973d25c023ccc0acda8fd30ca577da120257879fee6772a6ca842f20', 'ecUmSPHW', 'basile', 'marchand', '1951-06-23 10:16:44', 6, 'Administrator');
INSERT INTO useracc (username, email, password, salt, first_name, last_name, birth, country, user_type) VALUES ('beautifulgoose718', 'charlotte.keller@example.com', '0128ff61bcb7169298b3d875efc20fb3485f7bb70d2dccaf455320a7b13769c4', 'UTV2wY2C', 'charlotte', 'keller', '1969-10-13 07:34:21', 3, 'Registered');
INSERT INTO useracc (username, email, password, salt, first_name, last_name, birth, country, user_type) VALUES ('greencat927', 'eli.wood@example.com', '94547a6905ec1b34b6cf90acf0ce420333093fc7e5274e446c4d6d81544c1e1f', 'U3NhV0Ff', 'eli', 'wood', '1972-01-01 20:03:12', 3, 'Registered');
INSERT INTO useracc (username, email, password, salt, first_name, last_name, birth, country, user_type) VALUES ('blackpanda477', 'eli.foster@example.com', '535172d52db39a8cb2352f5644a82ef829dbd16324e7a9091097cf180fd183ef', 'bFsBQ91D', 'eli', 'foster', '1951-06-22 11:49:15', 3, 'Registered');
INSERT INTO useracc (username, email, password, salt, first_name, last_name, birth, country, user_type) VALUES ('ticklishgoose494', 'bernard.miles@example.com', 'dc1508bfb7b4182f0ef95d04eab46d6728244793165b2f24961209e31d438e0c', 'vmFaMu6w', 'bernard', 'miles', '1990-09-24 00:03:23', 4, 'Registered');

INSERT INTO topic (admin_id, topicname, description) VALUES (1, 'programming', 'for programmers, just like you.');
INSERT INTO topic (admin_id, topicname, description) VALUES (1, 'mathematics', 'for people studying math at any level.');
INSERT INTO topic (admin_id, topicname, description) VALUES (1, 'aviation', 'for aircraft pilots, mechanics and enthusiasts.');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 0, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (1, 3, '&lt;p&gt;In my schema I have a created_on field. I want to assign EPOCH time value to it automatically on insert. How to achieve that?&lt;/p&gt;
');
INSERT INTO question (post_id, topic_id, title) VALUES (1, 1, 'How to get epoch time in Redshift?');
INSERT INTO activity (post_content_id, post_id, user_id, action) VALUES (1, 1, 3, 'Create');
INSERT INTO tag (text) VALUES ('sql');
INSERT INTO questiontag (question_id, tag_id) VALUES (1, 1);
INSERT INTO tag (text) VALUES ('database');
INSERT INTO questiontag (question_id, tag_id) VALUES (1, 2);
INSERT INTO tag (text) VALUES ('amazon-redshift');
INSERT INTO questiontag (question_id, tag_id) VALUES (1, 3);

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 0, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (2, 1, '&lt;pre&gt;&lt;code&gt;select date_part(epoch,sysdate)::int
&lt;/code&gt;&lt;/pre&gt;
');
INSERT INTO answer (post_id, question_id, accepted) VALUES (2, 1, 'False');
INSERT INTO activity ( post_id, user_id, action) VALUES (2, 1, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 1, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (3, 1, '&lt;p&gt;On PostgreSQL (from with redshift was forked) you would do it like this:&lt;/p&gt;

&lt;pre&gt;&lt;code&gt;ALTER TABLE sometable ALTER COLUMN created_on SET DEFAULT EXTRACT(EPOCH FROM now())
&lt;/code&gt;&lt;/pre&gt;

&lt;p&gt;Maybe it works in redshift as well.&lt;/p&gt;
');
INSERT INTO answer (post_id, question_id, accepted) VALUES (3, 1, 'False');
INSERT INTO activity ( post_id, user_id, action) VALUES (3, 1, 'Create');
INSERT INTO activity (post_id, user_id, action) VALUES (3, 1, 'Upvote');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 0, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (4, 3, 'I think that date_part is just a default name for result of EXTRACT() function. Return type in redshift should be integer, according to documentation: &lt;a href=&quot;http://docs.aws.amazon.com/redshift/latest/dg/r_EXTRACT_function.html&quot; rel=&quot;nofollow noreferrer&quot;&gt;docs.aws.amazon.com/redshift/latest/dg/r_EXTRACT_function.ht&amp;zwnj;&amp;#8203;ml&lt;/a&gt; It is different from PostgreSQL, where you get real as return type. So you shouldn&amp;#39;t need to cast it.');
INSERT INTO answercomment (post_id, answer_id) VALUES (4, 3);
INSERT INTO activity (post_id, user_id, action) VALUES (4, 3, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 0, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (5, 3, 'Apparently this is giving an error: ALTER COLUMN SET/DROP DEFAULT is not supported;  My table is blank so I don&amp;#39;t mind creating one from scratch. However, the column type for EXTRACT is date_part. Is it possible to cast it as Integer? I am using epoch time as a version number.');
INSERT INTO answercomment (post_id, answer_id) VALUES (5, 3);
INSERT INTO activity (post_id, user_id, action) VALUES (5, 3, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 4, 2);
INSERT INTO postinstance (post_id, user_id, description) VALUES (6, 3, '&lt;p&gt;The binary system assumes that each number can be represented as the sum of the powers of two, where each power of two is not repeated more than once. &lt;/p&gt;

&lt;p&gt;How can we show that this is not an assumption, and is true for all numbers?&lt;/p&gt;
');
INSERT INTO question (post_id, topic_id, title) VALUES (6, 2, 'Binary System Assumption');
INSERT INTO activity (post_content_id, post_id, user_id, action) VALUES (6, 6, 3, 'Create');
INSERT INTO tag (text) VALUES ('binary');
INSERT INTO questiontag (question_id, tag_id) VALUES (6, 4);
INSERT INTO activity (post_id, user_id, action) VALUES (6, 3, 'Upvote');
INSERT INTO activity (post_id, user_id, action) VALUES (6, 3, 'Upvote');
INSERT INTO activity (post_id, user_id, action) VALUES (6, 3, 'Upvote');
INSERT INTO activity (post_id, user_id, action) VALUES (6, 3, 'Upvote');
INSERT INTO activity (post_id, user_id, action) VALUES (6, 3, 'Downvote');
INSERT INTO activity (post_id, user_id, action) VALUES (6, 3, 'Downvote');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 3, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (7, 5, '&lt;p&gt;Perhaps the most intuitive proof is devising an explicit algorithm of finding the base $2$ representation is. (The number to be represented in binary is $c$) :&lt;/p&gt;

&lt;p&gt;$1)$ Let&#x27;s find such $n$ that $2^{n} \le c &amp;lt; 2^{n+1}$. The result of the integer division of $c = 2^n + r_1$.Here $r_1$ is our first (non zero) digit.&lt;/p&gt;

&lt;p&gt;$2)$ Now let&#x27;s take the $r_1$ (which is obviously less than $2^n$) and divide it by $2^{n−1}$,&lt;/p&gt;

&lt;p&gt;If $2^{n-2} \le r &amp;lt; 2^{n-1}$,  $$r_1=2^{n-1}+r_2 \implies c = 2^n +2^{n-1}+r_2 ~~~ ; (r_2 &amp;lt; 2^{n-1})$$&lt;/p&gt;

&lt;p&gt;or,&lt;/p&gt;

&lt;p&gt;If $ 2^{n-3} \le r &amp;lt; 2^{n-2}$,&lt;br&gt;
$$r_1=2^{n-2}+r_2 \implies c = 2^n +0 \cdot 2^{n-1}+ 2^{n-2} +r_2 ~~~ ; (r_2 &amp;lt; 2^{n-2})\
\\\text{So on..}
\\.
\\.$$&lt;/p&gt;

&lt;p&gt;The result of integer division gives us next digit and so on.&lt;/p&gt;

&lt;p&gt;Following the process until $n=0$, it is easy to see that we recover the (unique) representation of $c$ in base $2$.&lt;/p&gt;

&lt;p&gt;This algorithm, in general can be applied to show that every number &lt;em&gt;can&lt;/em&gt; definitely be and uniquely represented in any base $b &amp;gt; 1$.&lt;/p&gt;
');
INSERT INTO answer (post_id, question_id, accepted) VALUES (7, 6, 'False');
INSERT INTO activity ( post_id, user_id, action) VALUES (7, 5, 'Create');
INSERT INTO activity (post_id, user_id, action) VALUES (7, 5, 'Upvote');
INSERT INTO activity (post_id, user_id, action) VALUES (7, 5, 'Upvote');
INSERT INTO activity (post_id, user_id, action) VALUES (7, 5, 'Upvote');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 0, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (8, 2, '&lt;p&gt;I&#x27;ll prove this by induction.&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Claim&lt;/strong&gt;: Each number $n$ can be represented as the sum of a &lt;em&gt;finite&lt;/em&gt; number of powers of two, where each power of two is not repeated more than once. In other words:&lt;/p&gt;

&lt;p&gt;$n = \sum_{i=0}^{k}{a_i \cdot 2^i}$ for some finite $k$ where $a_i = 0$ or $a_i = 1$ for all $0 \le i \le k$&lt;/p&gt;

&lt;p&gt;Proof by induction over $n$:&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Base&lt;/strong&gt;: $0 = \sum_{i=0}^{0}{a_i \cdot 2^i}$  for $a_0 = 0$ Check!&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Step&lt;/strong&gt;: Suppose for some arbitrary $n$: $n = \sum_{i=0}^{k}{a_i \cdot 2^i}$ for some finite $k$ where $a_i = 0$ or $a_i = 1$ for all $0 \le i \le k$&lt;/p&gt;

&lt;p&gt;Then it also holds that $n = \sum_{i=0}^{k+1}{a_i \cdot 2^i}$ for some finite $k$ where $a_i = 0$ or $a_i = 1$ for all $0 \le i \le k$ and $a_{k+1} = 0$&lt;/p&gt;

&lt;p&gt;Now let&#x27;s consider $n + 1$:&lt;/p&gt;

&lt;p&gt;Let $j = min \{  0 \le i \le k+1 |a_i = 0\}$ &lt;/p&gt;

&lt;p&gt;Now define:&lt;/p&gt;

&lt;ul&gt;
&lt;li&gt;$a_i&#x27; = 0$ for all $0 \le i \le j-1$&lt;/li&gt;
&lt;li&gt;$a_j&#x27; = 1$ &lt;/li&gt;
&lt;li&gt;$a_i&#x27; = a_i$ for all $j+1 \le i \le k+1$ &lt;/li&gt;
&lt;/ul&gt;

&lt;p&gt;So we have for some finite $k$ where $a_i = 0$ or $a_i = 1$ for all $0 \le i \le k + 1$:&lt;/p&gt;

&lt;p&gt;$$\sum_{i=0}^{k+1}{a_i&#x27; \cdot 2^i} =$$&lt;/p&gt;

&lt;p&gt;$$ \sum_{i=0}^{j-1}{a_i&#x27; \cdot 2^i} + a_j&#x27;\cdot2^j + \sum_{i={j+1}}^{k+1}{a_i&#x27; \cdot 2^i} =$$&lt;/p&gt;

&lt;p&gt;$$ \sum_{i=0}^{j-1}{0 \cdot 2^i} + 1\cdot2^j +\sum_{i={j+1}}^{k+1}{a_i \cdot 2^i} =$$&lt;/p&gt;

&lt;p&gt;$$ 0 + 2^j +\sum_{i={j+1}}^{k+1}{a_i \cdot 2^i} =$$&lt;/p&gt;

&lt;p&gt;$$ 2^j +\sum_{i={j+1}}^{k+1}{a_i \cdot 2^i} =$$&lt;/p&gt;

&lt;p&gt;$$ 2^j - 1 + 1 + \sum_{i={j+1}}^{k+1}{a_i \cdot 2^i} =$$&lt;/p&gt;

&lt;p&gt;$$ \sum_{i=0}^{j-1}{2^i} + 1 + \sum_{i={j+1}}^{k+1}{a_i \cdot 2^i} = $$&lt;/p&gt;

&lt;p&gt;$$ \sum_{i=0}^{j-1}{1 \cdot 2^i} + 1 + \sum_{i={j+1}}^{k+1}{a_i \cdot 2^i} = $$&lt;/p&gt;

&lt;p&gt;$$\sum_{i=0}^{j-1}{a_i \cdot 2^i} + 0 + \sum_{i={j+1}}^{k+1}{a_i \cdot 2^i} + 1 =$$&lt;/p&gt;

&lt;p&gt;$$ \sum_{i=0}^{j-1}{a_i \cdot 2^i} + 0\cdot 2^j + \sum_{i={j+1}}^{k+1}{a_i \cdot 2^i} + 1 = $$&lt;/p&gt;

&lt;p&gt;$$\sum_{i=0}^{j-1}{a_i \cdot 2^i} + a_j \cdot 2^j + \sum_{i={j+1}}^{k+1}{a_i \cdot 2^i} + 1 = $$&lt;/p&gt;

&lt;p&gt;$$\sum_{i=0}^{j-1}{a_i \cdot 2^i} + \sum_{i={j}}^{k+1}{a_i \cdot 2^i} + 1 =$$&lt;/p&gt;

&lt;p&gt;$$ \sum_{i=0}^{k+1}{a_i \cdot 2^i} + 1 =$$&lt;/p&gt;

&lt;p&gt;$$ n + 1$$  Check!&lt;/p&gt;
');
INSERT INTO answer (post_id, question_id, accepted) VALUES (8, 6, 'False');
INSERT INTO activity ( post_id, user_id, action) VALUES (8, 2, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 0, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (9, 5, '+1, but to be rigorous, you shall add demonstration of &lt;i&gt;univocity&lt;/i&gt; of the representation (although obvious).');
INSERT INTO answercomment (post_id, answer_id) VALUES (9, 7);
INSERT INTO activity (post_id, user_id, action) VALUES (9, 5, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 0, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (10, 5, '@EthanBolker Yes, you are right.Fixed it.');
INSERT INTO answercomment (post_id, answer_id) VALUES (10, 7);
INSERT INTO activity (post_id, user_id, action) VALUES (10, 5, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 0, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (11, 2, 'I think the second inequality in (1) should be strict. Otherwise there is ambiguity when $c$ is a power of $2$.');
INSERT INTO answercomment (post_id, answer_id) VALUES (11, 7);
INSERT INTO activity (post_id, user_id, action) VALUES (11, 2, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 1, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (12, 4, '+1 This argument works for any base - that&amp;#39;s our automatic assumption for base 10.');
INSERT INTO answercomment (post_id, answer_id) VALUES (12, 7);
INSERT INTO activity (post_id, user_id, action) VALUES (12, 4, 'Create');
INSERT INTO activity (post_id, user_id, action) VALUES (12, 4, 'Upvote');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 1, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (13, 1, '&lt;p&gt;I found this word in one book. Chapter was connected with ICING operations, and I found this word with small explanation:&lt;br&gt;
&quot;A tube bonded to a surface, e.g. wing edge. When pressurized with fluid, it breaks up ice.&quot;&lt;br&gt;
Explain please what is it?&lt;br&gt;
What aircraft equipped with it?&lt;br&gt;
And photo please. &lt;/p&gt;
');
INSERT INTO question (post_id, topic_id, title) VALUES (13, 3, 'What does the word &quot;boot&quot; mean?');
INSERT INTO activity (post_content_id, post_id, user_id, action) VALUES (13, 13, 1, 'Create');
INSERT INTO tag (text) VALUES ('aircraft-systems');
INSERT INTO questiontag (question_id, tag_id) VALUES (13, 5);
INSERT INTO tag (text) VALUES ('anti-ice');
INSERT INTO questiontag (question_id, tag_id) VALUES (13, 6);
INSERT INTO tag (text) VALUES ('ice');
INSERT INTO questiontag (question_id, tag_id) VALUES (13, 7);
INSERT INTO activity (post_id, user_id, action) VALUES (13, 1, 'Upvote');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 0, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (14, 5, '&lt;p&gt;Versalog already told the core of the thing. Most prop aircraft which are approved for flights into known icing conditions have such boots to remove the ice from the wings leading edge.
Those boots are either inflated manually whenever you need them (by the press of a button of course), in regular intervals or automatically whenever ice is detected.&lt;/p&gt;

&lt;p&gt;Check this picture, the black think is the boot on a Dash 8&#x27;s wing:&lt;/p&gt;

&lt;p&gt;&lt;a href=&quot;https://i.stack.imgur.com/gG2tZ.jpg&quot; rel=&quot;nofollow noreferrer&quot;&gt;&lt;img src=&quot;https://i.stack.imgur.com/gG2tZ.jpg&quot; alt=&quot;Dash 8 boot&quot;&gt;&lt;/a&gt;
&lt;a href=&quot;https://upload.wikimedia.org/wikipedia/commons/b/b9/Horizon_Air_Q400_deicing_boot.JPG&quot; rel=&quot;nofollow noreferrer&quot;&gt;Link&lt;/a&gt;&lt;/p&gt;
');
INSERT INTO answer (post_id, question_id, accepted) VALUES (14, 13, 'False');
INSERT INTO activity ( post_id, user_id, action) VALUES (14, 5, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 1, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (15, 5, '&lt;p&gt;Find a picture of any WWII bomber  or any modern Caravan and there should be a black stripe along the leading edge of the wing and tail surfaces. That is termed a boot. Inflating it slightly will make the ice break and fall off the wing.
Happy Trails&lt;/p&gt;
');
INSERT INTO answer (post_id, question_id, accepted) VALUES (15, 13, 'False');
INSERT INTO activity ( post_id, user_id, action) VALUES (15, 5, 'Create');
INSERT INTO activity (post_id, user_id, action) VALUES (15, 5, 'Upvote');

INSERT INTO report (post_id, user_id, title, content, reason) VALUES (15, 2, 'test report', 'i do not think this kind of post belongs here', 'other');

INSERT INTO useraccbadge (user_id, badge_id) VALUES (1, 1);
INSERT INTO useraccbadge (user_id, badge_id) VALUES (2, 3);
INSERT INTO useraccbadge (user_id, badge_id) VALUES (3, 1);
INSERT INTO useraccbadge (user_id, badge_id) VALUES (4, 2);
INSERT INTO useraccbadge (user_id, badge_id) VALUES (5, 3);

INSERT INTO topicuseracc (mod_id, topic_id) VALUES (1, 1);
INSERT INTO topicuseracc (mod_id, topic_id) VALUES (1, 2);
INSERT INTO topicuseracc (mod_id, topic_id) VALUES (1, 3);
