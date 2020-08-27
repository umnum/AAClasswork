PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);

CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    associated_author_id INTEGER NOT NULL,

    FOREIGN KEY (associated_author_id) REFERENCES users(id)
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
    subject_question INTEGER NOT NULL,
    author INTEGER NOT NULL,
    body TEXT NOT NULL,
    parent_reply INTEGER,

    FOREIGN KEY (subject_question) REFERENCES questions(id),
    FOREIGN KEY (author) REFERENCES users(id),
    FOREIGN KEY (parent_reply) REFERENCES replies(id)
);


CREATE TABLE question_likes(
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    author_id INTEGER NOT NULL,
    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (author_id) REFERENCES users(id)
);
-- Users table
INSERT INTO
    users (fname, lname)
VALUES
    ('Arthur','Miller'),
    ('Eugene O','Neill');


-- Questions table
INSERT INTO
    questions (title, body, associated_author_id)
VALUES
    ('SQL Question', 'I don''t understand SQL', (SELECT id FROM users WHERE fname = 'Arthur' AND lname = 'Miller')),
    ('Ruby Question', 'How do you use Ruby with SQL', (SELECT id FROM users WHERE fname = 'Eugene O' AND lname = 'Neill'));


