---Выведите пассажиров с самым длинным ФИО. Пробелы, дефисы и точки считаются частью имени.
SELECT name
FROM PASSENGER
where length(name) = (
		select (max(length(name)))
		from passenger
	)