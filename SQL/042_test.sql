---Выведите имена пассажиров улетевших в Москву (Moscow) на самолете TU-134. В ответе не должно быть дубликатов

SELECT DISTINCT name
from trip
	inner join pass_in_trip on trip.id = pass_in_trip.trip
	inner join passenger on pass_in_trip.passenger = passenger.id
where 1 = 1
	and trip.town_to = 'moscow'
	and trip.plane = 'TU-134'