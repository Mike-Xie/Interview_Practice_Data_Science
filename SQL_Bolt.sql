-- Exercise 2 — Tasks
			
			
                
--                     Find the movie with a row id of 6
--                  ✓
SELECT title FROM movies WHERE id = 6;
--                     Find the movies released in the years between 2000 and 2010
--                  ✓
SELECT title FROM movies WHERE year BETWEEN 2000 AND 2010;                
--                     Find the movies not released in the years between 2000 and 2010
--                  ✓
SELECT title FROM movies WHERE year NOT BETWEEN 2000 AND 2010;                
--                     Find the first 5 Pixar movies and their release year
--                  ✓
SELECT title, year FROM movies ORDER BY year ASC LIMIT 5;

-- Exercise 3 — Tasks
			
			
                
--                     Find all the Toy Story movies
SELECT * FROM movies WHERE title LIKE "%TOY STORY%";
                
--                     Find all the movies directed by John Lasseter
-- do case insensitive with LIKE better than case sensitive with equal sign
SELECT * FROM movies WHERE director LIKE "JOHN LASSETER";
                
--                     Find all the movies (and director) not directed by John Lasseter
SELECT * FROM movies WHERE director NOT LIKE "JOHN LASSETER"; 
                
--                     Find all the WALL-* movies
SELECT * FROM movies WHERE title LIKE "WALL-%";