sql
-- Ранжирование ответов
SELECT 
    q.text AS question,
    ao.option_text,
    COUNT(ua.id) AS votes,
    RANK() OVER (PARTITION BY q.id ORDER BY COUNT(ua.id) DESC) AS rank
FROM questions q
JOIN answer_options ao ON q.id = ao.question_id
LEFT JOIN user_answers ua ON ao.id = ua.answer_option_id
GROUP BY q.id, q.text, ao.id, ao.option_text;