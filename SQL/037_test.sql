--- Выведите среднюю цену бронирования за сутки для каждой из комнат, которую бронировали хотя бы один раз. Среднюю цену необходимо округлить до целого значения вверх.
SELECT Reservations.room_id,
	CEILING(AVG(Reservations.price)) AS avg_price
FROM Reservations
GROUP BY Reservations.room_id