SELECT * FROM movies,directors;
select title,genre from movies;
select  distinct movie_id from movies;
select count(title) from movies;
select * from movies
where movie_id=1;
-- between
select title,release_year from movies
where release_year  between 1972 and 2008 ;
-- likes
 select director_id,name from directors
 where name like"%n";
 select  * from directors;
 -- In
 select * from  directors
 where name in("Frank Darabont");
-- order by 
select * from directors
order by name asc, birth_year desc;
select * from actors
where name="Tim Robbins" or actor_id>1
order by birth_year desc