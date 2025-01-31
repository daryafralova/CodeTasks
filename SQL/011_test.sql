---Какие кабинеты чаще всего использовались для проведения занятий? Выведите те, которые использовались максимальное количество раз

SELECT  DISTINCT classroom FROM (
SELECT classroom,CLASSES, MAX(CLASSES) OVER() AS D
FROM(
		SELECT classroom,
			COUNT(*) OVER(PARTITION BY classroom) AS CLASSES
		FROM SCHEDULE
	) AS R
	) AS S
WHERE CLASSES = D