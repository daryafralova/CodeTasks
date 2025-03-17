---В какие города можно улететь из Парижа (Paris) и сколько времени это займёт?
---Поля в результирующей таблице:
---town_to
---flight_time

SELECT TOWN_TO,
	TIMEDIFF(time_in, time_out) AS flight_time
FROM TRIP
WHERE TRIP.TOWN_FROM = 'PARIS'