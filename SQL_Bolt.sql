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


-- Exercise 6 — Tasks
            
            
                
--                     Find the domestic and international sales for each movie
--                  ✓
SELECT Domestic_sales, International_sales FROM movies INNER JOIN BoxOffice ON movies.id = BoxOffice.Movie_id
;
                
--                     Show the sales numbers for each movie that did better internationally rather than domestically
                
SELECT title, Domestic_sales, International_sales FROM movies INNER JOIN BoxOffice ON movies.id = BoxOffice.Movie_id
    WHERE International_sales > Domestic_sales
;                
--                     List all the movies by their ratings in descending order

SELECT title, rating FROM movies INNER JOIN BoxOffice ON movies.id = BoxOffice.Movie_id
    ORDER BY Rating DESC
;


-- Exercise 7 — Tasks
            
            
                
--                     Find the list of all buildings that have employees
--                     Also retrieve the number of for stretch
SELECT building, COUNT(*)
FROM employees
GROUP BY building;
                
--                     Find the list of all buildings and their capacity
SELECT * FROM buildings;
--                     Find list of all buildings, capacity and number of people in them 
--                     REPL like environment is super helpful, do it iteratively
--                     First have select * and make sure join is working, after join
--                     Treat all as one table, note group by has to be done with building_name,
--                     Which has more categories than building since some buildings are empty
--                     And we count building which tells us where an employee is at, not *
--                     Which would get us 1 instead of 0 for the empty buildings

SELECT building_name, COUNT(building)
FROM buildings b
  LEFT JOIN employees e
    ON b.building_name = e.building
GROUP BY building_name;
--                     List all buildings and the distinct employee roles in each building (including empty buildings)

SELECT DISTINCT b.building_name, e.role 
FROM buildings b
LEFT JOIN employees e
ON b.building_name = e.building
;

-- Exercise 8 — Tasks
            
            
                
--                     Find the name and role of all employees who have not been assigned to a building
--                  ✓
SELECT * FROM employees
WHERE building IS NULL;
                
--                     Find the names of the buildings that hold no employees
SELECT * FROM buildings
LEFT JOIN employees
ON building_name = building
WHERE building IS NULL;

--                     Find distribution of roles by building
SELECT ROLE, building, count(ROLE) FROM employees
GROUP BY ROLE, building;

-- Exercise 9 — Tasks
            
            
                
--                     List all movies and their combined sales in millions of dollars
--                  ✓
SELECT Title, 
(domestic_sales + international_sales) / 1000000 AS total_sales
FROM movies 
JOIN Boxoffice ON movies.id = Boxoffice.Movie_id;
                
--                     List all movies and their ratings in percent
SELECT Title, Rating * 10 AS Percentage_Rating
FROM movies 
JOIN Boxoffice ON movies.id = Boxoffice.Movie_id;
                
--                     List all movies that were released on even number years
SELECT Title, year
FROM movies 
JOIN Boxoffice ON movies.id = Boxoffice.Movie_id
WHERE year%2 = 0;


-- Exercise 10 — Tasks
			
			
                
--                     Find the longest time that an employee has been at the studio
--                  ✓
SELECT name, MAX(years_employed) FROM employees;
--                     For each role, find the average number of years employed by employees in that role
SELECT role, AVG(years_employed) 
FROM employees
GROUP BY role;
                
--                     Find the total number of employee years worked in each building
SELECT building, SUM(years_employed)
FROM employees
GROUP BY building
