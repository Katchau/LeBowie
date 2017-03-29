import sys
import json
import requests
import random
import html

    
COUNTRIES = [
    "portugal",
    "france",
    "spain",
    "england",
    "italy",
    "united states of america",
]

BADGES = [
    "novice",
    "enthusiast",
    "expert",
]

USERS_NUMBER = 100
USERS_URL = "https://randomuser.me/api/?results=" + str(USERS_NUMBER)

ADMIN_PERCENTAGE = 0.01
MOD_PERCENTAGE = 0.05

USER_TYPES = [
    "Registered",
    "Moderator",
    "Administrator",
]

TOPICS = [
    "programming",
    "mathematics",
    "aviation",
]

TOPIC_DESCRIPTIONS = [
    "for programmers, just like you.",
    "for people studying math at any level.",
    "for aircraft pilots, mechanics and enthusiasts.",
]

TOPIC_QUESTION_URLS = [
    "https://api.stackexchange.com/2.2/questions?pagesize=50&order=desc&sort=votes&site=stackoverflow&filter=withbody",
    "https://api.stackexchange.com/2.2/questions?pagesize=50&order=desc&sort=votes&site=math&filter=withbody",
    "https://api.stackexchange.com/2.2/questions?pagesize=50&order=desc&sort=votes&site=aviation&filter=withbody",
]

TOPIC_ANSWER_URLS = [
    [
        "https://api.stackexchange.com/2.2/questions/",
        "/answers/?order=desc&sort=activity&site=stackoverflow&filter=withbody",
    ],
    [
        "https://api.stackexchange.com/2.2/questions/",
        "/answers/?order=desc&sort=activity&site=math&filter=withbody",
    ],
    [
        "https://api.stackexchange.com/2.2/questions/",
        "/answers/?order=desc&sort=activity&site=aviation&filter=withbody",
    ],
]

TOPIC_COMMENT_URLS = [
    [
        "https://api.stackexchange.com/2.2/answers/",
        "/comments?order=desc&sort=creation&site=stackoverflow&filter=withbody",
    ],
    [
        "https://api.stackexchange.com/2.2/answers/",
        "/comments?order=desc&sort=creation&site=math&filter=withbody",
    ],
    [
        "https://api.stackexchange.com/2.2/answers/",
        "/comments?order=desc&sort=creation&site=aviation&filter=withbody",
    ],
]

NUM_QUESTIONS = 50
DELETED_PERCENTAGE = 0.05

POST_STATES = [
    "Editing",
    "Published",
    "Deleted",
]

NUM_REPORTS = 50

REPORT_TITLES = [
    "this post is offensive",
    "this post is off-topic",
    "i do not like this post one bit",
    "test report",
]

REPORT_CONTENTS = [
    "i do not think this kind of post belongs here",
    "this is really poor taste",
    "not the first time this user has done it",
]

REPORT_REASONS = [
    "offensive",
    "off-topic",
    "other",
]

ACTIONS = [
    "Create",
    "Delete",
    "Update",
    "Upvote",
    "Downvote",
]


def generate_color():
    digits = "0123456789abcdef"
    color = "#"
    for i in range(0, 6):
        r = random.randrange(len(digits))
        color += digits[r];
    return color

def get_user_list():
    r = requests.get(USERS_URL)
    user_list = []
    for user in r.json()["results"]:
        user_list.append([
            user["login"]["username"],        
            user["email"],                    
            user["login"]["sha256"],          
            user["login"]["salt"],            
            user["name"]["first"],            
            user["name"]["last"],             
            user["dob"],                      
            random.randrange(len(COUNTRIES)),
        ])
    return user_list

def get_question_list(topic_index):
    r = requests.get(TOPIC_QUESTION_URLS[topic_index])
    question_list = []
    for question in r.json()["items"]:
        question_list.append([
            question["score"],                           
            random.randrange(max(question["score"], 1)),
            random.randrange(USERS_NUMBER),      
            html.escape(question["body"]),       
            (topic_index + 1),                   
            question["title"],                   
            question["tags"],                    
            question["question_id"],             
        ])
    return question_list

def get_random_post_state():
    state = POST_STATES[1]
    if random.randrange(100) < 100 * DELETED_PERCENTAGE:
        state = POST_STATES[2]
    return state

def get_answer_list(topic_index, question_ids):
    url = TOPIC_ANSWER_URLS[topic_index][0]
    for i, id in enumerate(question_ids):
        if i == 0:
            url += str(id)
        else:
            url += ";" + str(id)
    url += TOPIC_ANSWER_URLS[topic_index][1]

    r = requests.get(url)
    answer_list = []
    for answer in r.json()["items"]:
        answer_list.append([
            answer["score"],
            random.randrange(max(answer["score"], 1)),
            random.randrange(USERS_NUMBER),
            html.escape(answer["body"]),
            answer["is_accepted"],
            answer["question_id"],
            answer["answer_id"],
        ])
    return answer_list

def get_comment_list(topic_index, answer_ids):
    url = TOPIC_COMMENT_URLS[topic_index][0]
    for i, id in enumerate(answer_ids):
        if i == 0:
            url += str(id)
        else:
            url += ";" + str(id)
    url += TOPIC_COMMENT_URLS[topic_index][1]

    r = requests.get(url)
    comment_list = []
    for comment in r.json()["items"]:
        comment_list.append([
            comment["score"],
            random.randrange(max(comment["score"], 1)),
            random.randrange(USERS_NUMBER),
            html.escape(comment["body"]),
            comment["post_id"],
        ])
    return comment_list
            
out = open(sys.argv[1], "w")


for country in COUNTRIES:
    out.write("INSERT INTO country (name) VALUES (\'" + country + "\');\n")
out.write("\n")


for badge in BADGES:
    out.write("INSERT INTO badge (color, text) VALUES (\'" + generate_color() + "\', \'" + badge + "\');\n")
out.write("\n")


users = get_user_list()
mods = []

for i, user in enumerate(users):
    type = 0
    if i == 0:
        type = 2
    if i != 0 and i < len(users) * ADMIN_PERCENTAGE:
        type = 2
    elif i != 0 and i < len(users) * MOD_PERCENTAGE:
        mods.append(i + 1)
        type = 1
    out.write("INSERT INTO useracc (username, email, password, salt, first_name, last_name, birth, country, user_type) VALUES (\'" + user[0] + "\', \'" + user[1] + "\', \'" + user[2] + "\', \'" + user[3] + "\', \'" + user[4] + "\', \'" + user[5] + "\', \'" + user[6] + "\', " + str(user[7]) + ", \'" + USER_TYPES[type] + "\');\n")
out.write("\n")


for i, topic in enumerate(TOPICS):
    out.write("INSERT INTO topic (admin_id, topicname, description) VALUES (0, \'" + TOPICS[i] + "\', \'" + TOPIC_DESCRIPTIONS[i] + "\');\n");
out.write("\n")


db_post_id = 0
db_tag_id = 0
tag_ids_map = {}

for topic in range(0, len(TOPICS)):
    questions = get_question_list(topic)
    stack_exchange_question_ids = []
    db_question_ids_map = {}

    for question in questions:
        db_post_id = db_post_id + 1
        current_state = get_random_post_state()
        up_score = str(question[0])
        down_score = str(question[1])
        user_id = str(question[2])
        description = question[3]
        topic_id = str(question[4])
        title = question[5]
        tags = question[6]
        stack_exchange_question_id = question[7]
            
        out.write("INSERT INTO post (current_state, up_score, down_score) VALUES (\'" + current_state + "\', " + up_score + ", " + down_score + ");\n")
        out.write("INSERT INTO postinstance (post_id, user_id, description) VALUES (" + str(db_post_id) + ", " + user_id + ", \'" + description + "\');\n")
        out.write("INSERT INTO question (post_id, topic_id, title) VALUES (" + str(db_post_id) + ", " + topic_id + ", \'" + title + "\');\n")

        out.write("INSERT INTO activity (post_id, user_id, action) VALUES (" + str(db_post_id) + ", " + user_id + ", \'" + ACTIONS[0] + "\');\n")
        
        for tag in tags:
            current_tag_id = tag_ids_map.get(tag, None)
            if current_tag_id is None:
                db_tag_id = db_tag_id + 1
                tag_ids_map[tag] = db_tag_id
                current_tag_id = db_tag_id
                out.write("INSERT INTO tag (text) VALUES (\'" + tag + "\');\n")
            
            out.write("INSERT INTO questiontag (question_id, tag_id) VALUES (" + str(db_post_id) + ", " + str(current_tag_id) + ");\n")

        stack_exchange_question_ids.append(stack_exchange_question_id)
        db_question_ids_map[stack_exchange_question_id] = db_post_id
        out.write("\n")

    answers = get_answer_list(topic, stack_exchange_question_ids)
    stack_exchange_answer_ids = []
    db_answer_ids_map = {}

    for answer in answers:
        db_post_id = db_post_id + 1
        current_state = get_random_post_state()
        up_score = str(answer[0])
        down_score = str(answer[1])
        user_id = str(answer[2])
        description = answer[3]
        accepted = str(answer[4])
        db_question_id = str(db_question_ids_map[answer[5]])
        stack_exchange_answer_id = answer[6]

        out.write("INSERT INTO post (current_state, up_score, down_score) VALUES (\'" + current_state + "\', " + up_score + ", " + down_score + ");\n")
        out.write("INSERT INTO postinstance (post_id, user_id, description) VALUES (" + str(db_post_id) + ", " + user_id + ", \'" + description + "\');\n")
        out.write("INSERT INTO answer (post_id, question_id, accepted) VALUES (" + str(db_post_id) + ", " + db_question_id + ", \'" + accepted + "\');\n")

        out.write("INSERT INTO activity (post_id, user_id, action) VALUES (" + str(db_post_id) + ", " + user_id + ", \'" + ACTIONS[0] + "\');\n")

        stack_exchange_answer_ids.append(stack_exchange_answer_id)
        db_answer_ids_map[stack_exchange_answer_id] = db_post_id
        out.write("\n")

    comments = get_comment_list(topic, stack_exchange_answer_ids)

    for comment in comments:
        db_post_id = db_post_id + 1
        current_state = get_random_post_state()
        up_score = str(comment[0])
        down_score = str(comment[1])
        user_id = str(comment[2])
        description = comment[3]
        db_answer_id = str(db_answer_ids_map[comment[4]])

        out.write("INSERT INTO post (current_state, up_score, down_score) VALUES (\'" + current_state + "\', " + up_score + ", " + down_score + ");\n")
        out.write("INSERT INTO postinstance (post_id, user_id, description) VALUES (" + str(db_post_id) + ", " + user_id + ", \'" + description + "\');\n")
        out.write("INSERT INTO answercomment (post_id, answer_id) VALUES (" + str(db_post_id) + ", " + db_answer_id + ");\n")

        out.write("INSERT INTO activity (post_id, user_id, action) VALUES (" + str(db_post_id) + ", " + user_id + ", \'" + ACTIONS[0] + "\');\n")

        out.write("\n")

        
for i in range(0, NUM_REPORTS):
    post_id = str(random.randrange(db_post_id))
    user_id = str(random.randrange(USERS_NUMBER))
    title = REPORT_TITLES[random.randrange(len(REPORT_TITLES))]
    content = REPORT_CONTENTS[random.randrange(len(REPORT_CONTENTS))]
    reason = REPORT_REASONS[random.randrange(len(REPORT_REASONS))]

    out.write("INSERT INTO report (post_id, user_id, title, content, reason) VALUES (" + post_id + ", " + user_id + ", \'" + title + "\', \'" + content + "\', \'" + reason + "\');\n");
out.write("\n")
    
for i in range(0, USERS_NUMBER):
    user_id = str(i + 1)
    badge_id = str(random.randrange(len(BADGES)))

    out.write("INSERT INTO useraccbadge (user_id, badge_id) VALUES (" + user_id + ", " + badge_id + ");\n");
out.write("\n")

for i in range(0, len(TOPICS)):
    mod_id = str(mods[random.randrange(len(mods))])
    topic_id = str(i + 1)

    out.write("INSERT INTO topicuseracc (mod_id, topic_id) VALUES (" + mod_id + ", " + topic_id + ");\n");
                
