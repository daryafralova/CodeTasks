---Для каждой игровой сессии вывести трёх лучших игроков (топ-3 по очкам). 
---Если у нескольких игроков одинаковое количество очков, присваивать им одинаковый ранг
---В результате должны быть колонки: game_session, player_name, score, rank.

---Дана таблица: GameScores
---player_name (VARCHAR) - имя игрока
---game_session (VARCHAR) - идентификатор игровой сессии
---score (INT) - количество очков

select first.player_name, first.game_session, first.score, first.rank
from (select *
		, dense_rank() over(partition by game_session order by score desc) as rank
		from GameScores) as first
where first.rank = < 3

