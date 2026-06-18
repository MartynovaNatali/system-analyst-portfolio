
# Кейс 3: Система опросов

## ER-диаграмма
surveys (1) → (M) questions
questions (1) → (M) answer_options

## Аналитический запрос
```sql
SELECT 
    q.text,
    ao.option_text,
    COUNT(ua.id) AS votes,
    RANK() OVER (PARTITION BY q.id ORDER BY COUNT(ua.id) DESC) AS rank
FROM questions q
JOIN answer_options ao ON q.id = ao.question_id
LEFT JOIN user_answers ua ON ao.id = ua.answer_option_id
GROUP BY q.id, ao.id;
```
