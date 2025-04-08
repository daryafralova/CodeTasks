---Выведите идентификаторы преподавателей, которые хотя бы один раз за всё время преподавали в каждом из одиннадцатых классов
SELECT teacher
FROM Schedule s
         JOIN Class c ON s.class = c.id
WHERE name LIKE '11 %'
GROUP BY teacher
HAVING COUNT(DISTINCT name) = 2;