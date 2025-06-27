-- Write a query to list all movies along with their genres and durations.
select title,genre,duration_minutes
 from movies

-- Write a query to find all actors who acted in the 
-- movie Inception.
 select name from actors a
 join movie_actors ma on a.actor_id=ma.actor_id
 join movies m on m.movie_id = ma.movie_id
 where title='Inception'
 select * from movies

-- Write a query to list all movies directed by Christopher Nolan.
select m.title from directors d
join movie_directors md on d.director_id=md.director_id
join movies m on md.movie_id=m.movie_id
where name="Christopher Nolan";

-- Write a query to list all movies along with their directors' names.
select d.name,m.title from directors d
join movie_directors md on md.director_id= d.director_id
join movies m on m.movie_id=md.movie_id

-- Write a query to list all actors and the roles they played in each movie.
select a.name,role,title from actors a
join movie_actors ma on a.actor_id=ma.actor_id
join movies m on m.movie_id=ma.movie_id


-- Write a query to find all movies released 
-- after 2000 and list their titles, directors, and main actors.
select m.title,d.name as director_name,a.name as actor_name,m.release_year from actors a
join movie_actors ma on ma.actor_id=a.actor_id
join movies m on m.movie_id=ma.movie_id
join movie_directors md on md.movie_id=m.movie_id
join directors d on d.director_id=md.director_id
where m.release_year>2000


-- Write a query to count how many movies each actor has 
-- acted in, sorted in descending order.
select a.name as actor_name,count(title) as 
total_movies_act from actors a
join movie_actors ma on a.actor_id=ma.actor_id
join movies m on m.movie_id=ma.movie_id
group by a.name
order by total_movies_act desc

-- Write a query to find the director(s) who directed the
-- most movies.
select d.name as director_name,count(m.title) as movies_name from directors d
join movie_directors md on md.director_id=d.director_id
join movies m on m.movie_id=md.movie_id
group by d.name
order by movies_name desc

-- Write a query to find actors who acted in more than 
one movie.
 select a.name as actor_name,count(m.title) as movies from actors a
 join movie_actors ma on ma.actor_id=a.actor_id
 join movies m on ma.movie_id=m.movie_id
 group by actor_name
 having movies>1

-- Write a query to list movies along with the number of 
actors in each.
select m.title,count(a.name) as number_of_actors
from actors a
join movie_actors ma on ma.actor_id=a.actor_id
join movies m on ma.movie_id=m.movie_id
group by m.title
order by number_of_actors desc

--  List all movies with the total number of actors 
and the total number of directors.
Output: title, total_actors, total_directors
select m.title as movies,count(distinct a.name)as total_actors,
count( distinct d.name) as total_directors
from actors a
join movie_actors ma on ma.actor_id=a.actor_id
join movies m on m.movie_id= ma.movie_id
join movie_directors md on md.movie_id=m.movie_id
join directors d on d.director_id=md.director_id
group by movies

-- Find the top 3 actors who have acted in the most number of movies.
Output: actor_name, movie_count
select a.name as actor_name, count(m.title) as movie_count from actors a
join movie_actors ma on ma.actor_id=a.actor_id
join movies m on m.movie_id=ma.movie_id
group by actor_name 
order by movie_count desc
limit 3

🔹 3. List all directors who have directed only one movie.
Output: director_name, movie_title
select d.name as director_name,count(m.title)
 as movie_title from directors d
 join movie_directors md on d.director_id=md.director_id
 join movies m on m.movie_id=md.movie_id
 group by director_name
 
-- Find the average number of actors per movie.
Output: A single value: avg_actors_per_movie

SELECT 
  AVG(actor_count) AS avg_actors_per_movie
FROM (
  SELECT 
    m.movie_id, 
    COUNT(ma.actor_id) AS actor_count
  FROM movies m
  JOIN movie_actors ma ON m.movie_id = ma.movie_id
  GROUP BY m.movie_id
) AS actor_counts;

-- List all movies that have more than 3 actors.
-- Output: title, number_of_actors
select m.title as title,count(a.name) as number_of_actors from actors a
join movie_actors ma on ma.actor_id=a.actor_id
join movies m on m.movie_id= ma.movie_id
group by title
having number_of_actors<3
