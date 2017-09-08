--Using SUM, Count, MAX, DISTINCT and ORDER BY.



--1.
--Show the total population of the world.

SELECT SUM(population)
FROM world




--2.
--List all the continents - just once each.




Select DISTINCT continent
from world



--3.
--Give the total GDP of Africa



Select sum(GDP) 
from world
where continent = 'Africa'



--4.
--How many countries have an area of at least 1000000



Select COUNT(name)
from world
where area >= 1000000




--5.
--What is the total population of ('Estonia', 'Latvia', 'Lithuania')




Select sum(population)
from world
where name IN('Estonia', 'Latvia', 'Lithuania')




--Using GROUP BY and HAVING



6.
For each continent show the continent and number of countries.



Select continent, count(name)
from world
group by continent



--7.
--For each continent show the continent and number of countries with populations of at least 10 million.



Select continent, count(name)
from world
where population >= 10000000
group by continent



--8.
--List the continents that have a total population of at least 100 million.



Select continent
from world
group by continent
having sum(population) >= 100000000




