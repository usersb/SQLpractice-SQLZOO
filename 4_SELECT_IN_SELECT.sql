--1.
--List each country name where the population is larger than that of 'Russia'.



SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')
      
      
      
--2.
--Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.

--Per Capita GDP



Select name 
from world
where continent = 'Europe'
AND GDP / population > (Select GDP / population 
from world 
where name = 'United Kingdom')




--3.

--List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the 
--country.



Select name,continent
from world
where continent IN (Select continent
from world
where name IN ('Argentina','Australia'))
order by name




--4.
--Which country has a population that is more than Canada but less than Poland? Show the name and the population.




Select name, population
from world
where population  > (Select population 
                                   from world
                                  where name = 'Canada')
AND population < (Select population 
                              from world 
                              where name = 'Poland')
                              
                              
                              
                              
--5.
--Germany (population 80 million) has the largest population of the countries in Europe. Austria (population 8.5 million) has 11% of the population of Germany.

--Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.

--Decimal places
--Percent symbol %



Select name, CONCAT(ROUND((100 * population) / (SELECT population 
                                 FROM world WHERE name='Germany'),0), '%')
from world
where continent = 'Europe'




--6.
--Which countries have a GDP greater than every country in Europe? [Give the name only.] (Some countries may have NULL gdp values)



Select name
from world
where gdp > ALL(Select gdp 
from world
where continent = 'Europe'
AND gdp > 0)



--7.
--Find the largest country (by area) in each continent, show the continent, the name and the area:



Select continent, name, area
from world x
where area >= ALL (Select area 
                                  from world y
                                  where x.continent = y.continent
                                  AND area >0)
                                  
                                  
                                  
                                  
--8.
--List each continent and the name of the country that comes first alphabetically.




SELECT continent, MIN(name) AS name
FROM world 
GROUP BY continent
ORDER by continent




--9.
--Find the continents where all countries have a population <= 25000000. Then find the names of the countries associated with 
--these continents. Show name, continent and population.



select name,continent,population from world
where continent not in(select distinct continent from world where population >25000000)



--10.
--Some countries have populations more than three times that of any of their neighbours (in the same continent). Give the 
--countries and continents.



Select x.name,x.continent
from world x
where x.population > (Select (3*max(y.population))
                                  from world y
                                  where y.continent = x.continent AND y.name <> x.name) 

