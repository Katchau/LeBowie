-- Toggle accepted answer
UPDATE Answer
    SET (accepted) = (true)
    WHERE Answer.post_id = 1;

-- Change a topic's description
UPDATE Topic
    SET (description) = ('Lorem ipsum')
    WHERE Topic.id = 1;

-- Change a user's email account
UPDATE UserAcc
    SET (email) = ('lorem@ipsum.com')
    WHERE UserAcc.id = 1;

-- Change a user's hash (password)
UPDATE UserAcc
    SET (hash) = ('741f4d2faefa49c7987f66a358dbce7058ba75fdf4d803a1ecfbc70502fb8b16')
    WHERE UserAcc.id = 1;

-- Change a user's first name
UPDATE UserAcc
    SET (first_name) = ('Armindo')
    WHERE UserAcc.id = 1;

-- Change a user's last name
UPDATE UserAcc
    SET (last_name) = ('Felicino')
    WHERE UserAcc.id = 1;

-- Change a user's picture (url)
UPDATE UserAcc
    SET (image) = ('funnycat.png')
    WHERE UserAcc.id = 1;

-- Change a user's description
UPDATE UserAcc
    SET (description) = ('Desde muito pequeno ouço dizer que gostos nao se discutem.')
    WHERE UserAcc.id = 1;

-- Promote user to Moderator
UPDATE UserAcc
    SET (user_type) = ('Moderator')
    WHERE UserAcc.id = 1;

-- Promote user to Admin
UPDATE UserAcc
    SET (user_type) = ('Administrator')
    WHERE UserAcc.id = 1;

-- Change user's country
UPDATE UserAcc
    SET (country) = (SELECT id FROM COUNTRY WHERE name = 'portugal')
    WHERE UserAcc.id = 1;

-- Change a post's state
UPDATE Post
    SET (current_state) = ('Deleted')
    WHERE Post.id = 1;
