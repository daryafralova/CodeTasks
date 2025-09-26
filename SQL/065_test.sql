

---Given a table of tweet data over a specified time period, calculate the 3-day rolling average of tweets for each user. Output the user ID, tweet date, and rolling averages rounded to 2 decimal places.

---Notes:

---A rolling average, also known as a moving average or running mean is a time-series technique that examines trends in data over a specified period of time.
---In this case, we want to determine how the tweet count for each user changes over a 3-day period.


SELECT user_id, tweet_date, round(avg(tweet_count) over(
      partition by user_id 
      order by tweet_date 
      rows between 2 PRECEDING  and CURRENT ROW), 2) as rolling_avg_3d
FROM tweets