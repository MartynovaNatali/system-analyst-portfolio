sql
CREATE TABLE surveys (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL
);

CREATE TABLE questions (
    id SERIAL PRIMARY KEY,
    survey_id INT REFERENCES surveys(id),
    text TEXT NOT NULL,
    type VARCHAR(20)
);

CREATE TABLE answer_options (
    id SERIAL PRIMARY KEY,
    question_id INT REFERENCES questions(id),
    option_text VARCHAR(500) NOT NULL
);

CREATE TABLE user_answers (
    id SERIAL PRIMARY KEY,
    question_id INT REFERENCES questions(id),
    answer_option_id INT REFERENCES answer_options(id)
);