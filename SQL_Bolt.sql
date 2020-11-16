-- Exercise 2 — Tasks
			
			
                
--                     Find the movie with a row id of 6
--                  ✓
SELECT title FROM movies 
WHERE id = 6;
--                     Find the movies released in the years between 2000 and 2010
--                  ✓
SELECT title FROM movies 
WHERE year BETWEEN 2000 AND 2010;                
--                     Find the movies not released in the years between 2000 and 2010
--                  ✓
SELECT title FROM movies 
WHERE year NOT BETWEEN 2000 AND 2010;                
--                     Find the first 5 Pixar movies and their release year
--                  ✓
SELECT title, year FROM movies 
ORDER BY year 
ASC LIMIT 5;

-- Exercise 3 — Tasks
			
			
                
--                     Find all the Toy Story movies
SELECT * FROM movies 
WHERE title LIKE "%TOY STORY%";
                
--                     Find all the movies directed by John Lasseter
-- do case insensitive with LIKE better than case sensitive with equal sign
SELECT * FROM movies 
WHERE director LIKE "JOHN LASSETER";
                
--                     Find all the movies (and director) not directed by John Lasseter
SELECT * FROM movies 
WHERE director NOT LIKE "JOHN LASSETER"; 
                
--                     Find all the WALL-* movies
SELECT * FROM movies 
WHERE title LIKE "WALL-%";


-- Exercise 4 — Tasks
			
			
                
--                     List all directors of Pixar movies (alphabetically), without duplicates
--                  ✓
SELECT DISTINCT director FROM movies 
ORDER BY director ASC;                
--                     List the last four Pixar movies released (ordered from most recent to least)
SELECT * FROM movies 
ORDER BY year DESC 
LIMIT 4;                
                
--                     List the first five Pixar movies sorted alphabetically
SELECT title FROM movies 
ORDER BY title ASC 
LIMIT 5;
                
--                     List the next five Pixar movies sorted alphabetically
SELECT title FROM movies
ORDER BY title ASC
LIMIT 5 OFFSET 5;

-- Review 1 — Tasks
			
			
                
--                     List all the Canadian cities and their populations
SELECT city, population FROM north_american_cities 
WHERE country LIKE "canada";
                
--                     Order all the cities in the United States by their latitude from north to south
SELECT city FROM north_american_cities
WHERE country LIKE "United States"
ORDER BY latitude;
                
--                     List all the cities west of Chicago, ordered from west to east
-- use sub query to select the cell with Chicago's longitude instead of hard coding
-- errors out if more than one row with Chicago
SELECT * FROM north_american_cities
WHERE longitude > (select longitude from north_american_cities where city = "Chicago")
ORDER BY longitude ASC;

-- alternate solution with self-join, will create duplicates if Chicago has multiple rows 
select c.city, c.longitude 
from north_american_cities c
inner join north_american_cities c1 on c.longitude < c1.longitude
where c1.city = 'Chicago'
order by c.longitude asc;
--                     List the two largest cities in Mexico (by population)

SELECT * FROM north_american_cities
WHERE COUNTRY LIKE "%MEXICO%"
ORDER BY population DESC LIMIT 2;
                
--                     List the third and fourth largest cities (by population) in the United States and their population

SELECT * FROM north_american_cities
WHERE COUNTRY LIKE "%UNITED STATES%"
ORDER BY population DESC LIMIT 2 OFFSET 2;