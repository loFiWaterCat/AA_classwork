PRAGMA foreign_keys = ON;

DROP TABLE if exists question_likes;
DROP TABLE if exists replies;
DROP TABLE if exists question_follows;
DROP TABLE if exists questions;
DROP TABLE if exists users;

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);

CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    user_id  INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id)

);


CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    body TEXT NOT NULL,
    parent_reply_id INTEGER,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (parent_reply_id) REFERENCES replies(id)
);

CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)

);

INSERT INTO
     users(fname,lname)
VALUES
  ('ALAN','TRAN'),
  ('Brian',"Lin"),
  ('Chaplin', 'Pillar'),
  ('Mike', 'Madsen'),
  ('Danny', 'Fire');

INSERT INTO
   questions(title,body,user_id)
 VALUES
    ("Weight","HOW MUCH DO YOU LIFT??!",(SELECT id FROM users WHERE fname = "Brian" AND lname = "Lin")),
    ("Sleep","HOW MUCH DO YOU SLEEP??!",(SELECT id FROM users WHERE fname = "Brian" AND lname = "Lin")),
    ("Food", "How much can you eat??!!",(SELECT id FROM users WHERE fname = "ALAN" AND lname = "TRAN")),
    ("Wellbeing", "How are you?", (SELECT id FROM users WHERE fname = "ALAN" AND lname = "TRAN"));

INSERT INTO
    question_follows(user_id, question_id)
VALUES
    (1, 1),
    (1, 2),
    (2, 4);

INSERT INTO
    replies(question_id, user_id, body, parent_reply_id)
VALUES
    (1, 1, "More than you", NULL),
    (1, 2, "Bull sh*t", 1),
    (3, 2, "An apple a day", NULL),
    (3, 1, "To keep the doctors away?", 3),
    (3, 2, "Yeah I can't afford the doctor :c", 4);
