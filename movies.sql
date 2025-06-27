create database movies;
create table movies(
 movie_id int auto_increment primary key,
 title varchar(255) not null,
 release_year int,
 genre varchar(100),
 duration_minutes int
 );
 CREATE TABLE actors (
    actor_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    birth_year INT
);

 create table directors (
 director_id int auto_increment primary key,
 name varchar(255) not null,
 birth_year int );
 
 create table  movie_directors(
 movie_id int,
 director_id int,
 primary key(movie_id,director_id),
 foreign key(movie_id) references movies(movie_id),
 foreign key(director_id) references directors(director_id));
 
 CREATE TABLE movie_actors (
    movie_id INT,
    actor_id INT,
    role VARCHAR(255),
    PRIMARY KEY (movie_id, actor_id),
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
    FOREIGN KEY (actor_id) REFERENCES actors(actor_id)
);
 insert into movies (title,release_year, genre,duration_minutes) values
 ('The Shawshank Redemption', 1994, 'Drama', 142),
('The Godfather', 1972, 'Crime', 175),
('Inception', 2010, 'Sci-Fi', 148),
('The Dark Knight', 2008, 'Action', 152);

INSERT INTO directors (name, birth_year) VALUES
('Frank Darabont', 1959),
('Francis Ford Coppola', 1939),
('Christopher Nolan', 1970);

INSERT INTO actors (name, birth_year) VALUES
('Tim Robbins', 1958),
('Morgan Freeman', 1937),
('Marlon Brando', 1924),
('Leonardo DiCaprio', 1974),
('Christian Bale', 1974),
('Heath Ledger', 1979);

INSERT INTO movie_directors (movie_id, director_id) VALUES
(1, 1),  -- The Shawshank Redemption - Frank Darabont
(2, 2),  -- The Godfather - Francis Ford Coppola
(3, 3),  -- Inception - Christopher Nolan
(4, 3);  -- The Dark Knight - Christopher Nolan

INSERT INTO movie_actors (movie_id, actor_id, role) VALUES
(1, 1, 'Andy Dufresne'),      -- Tim Robbins
(1, 2, 'Ellis Boyd Redding'), -- Morgan Freeman
(2, 3, 'Don Vito Corleone'),  -- Marlon Brando
(3, 4, 'Dom Cobb'),           -- Leonardo DiCaprio
(4, 5, 'Bruce Wayne / Batman'), -- Christian Bale
(4, 6, 'Joker');              -- Heath Ledger

select movie_id from movie_actors
order by movie_id asc;

select a.name,ma.role from actors a
join movie_actors ma on
a.actor_id=ma.actor_id;

select a.name,d.name,m.title,m.genre,m.release_year from actors a
join movie_actors ma on a.actor_id=ma.actor_id
join movie_directors dm on ma.movie_id=dm.movie_id
join movies m on m.movie_id=dm.movie_id
join directors d on d.director_id=dm.director_id
order by release_year desc;

select count(title) from movies;
select min(release_year) from movies;
select max(release_year) from movies;

select *from actors;

select max(actor_id),birth_year from actors
group by birth_year
having birth_year>1972
order by birth_year desc



