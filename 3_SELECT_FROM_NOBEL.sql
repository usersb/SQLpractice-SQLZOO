--1.
--Change the query shown so that it displays Nobel prizes for 1950.



SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950
 
 
 
-- 2.
--Show who won the 1962 prize for Literature.



SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature'
   
   
   
-- 3.
--Show the year and subject that won 'Albert Einstein' his prize.



Select yr, subject 
from nobel
where winner = 'Albert Einstein'




--4.
--Give the name of the 'Peace' winners since the year 2000, including 2000.


Select winner 
from nobel
where yr >= 2000 AND subject = 'Peace'



--5.
--Show all details (yr, subject, winner) of the Literature prize winners for 1980 to 1989 inclusive.



Select yr, subject, winner
from nobel
where subject = 'Literature' AND yr BETWEEN 1980 AND 1989



--6.
--Show all details of the presidential winners:

--Theodore Roosevelt
--Woodrow Wilson
--Jimmy Carter
--Barack Obama



SELECT * FROM nobel
WHERE winner IN ('Theodore Roosevelt','Woodrow Wilson','Jimmy Carter','Barack Obama')



--7.
--Show the winners with first name John



Select winner
from nobel
where winner LIKE 'John%'



--8.
--Show the Physics winners for 1980 together with the Chemistry winners for 1984.



Select *
from nobel
where (subject = 'Physics' AND yr = 1980) OR (subject = 'Chemistry' AND yr = 1984)



--9.
--Show the winners for 1980 excluding the Chemistry and Medicine




Select *
from nobel
where yr = 1980 AND subject NOT IN ('Chemistry', 'Medicine')



--10.
--Show who won a 'Medicine' prize in an early year (before 1910, not including 1910) together with winners of a 'Literature' 
--prize in a later year (after 2004, including 2004)



Select * 
from nobel
where (subject = 'Medicine' AND yr < 1910) OR (subject = 'Literature' AND yr >= 2004)



--11.
--Find all details of the prize won by PETER GRÜNBERG

--Non-ASCII characters


Select *
from nobel
where winner = 'Peter Grünberg'




--12.
--Find all details of the prize won by EUGENE O'NEILL

--Escaping single quotes



Select * 
from nobel
where winner = 'Eugene O\'Neill'




--13.
--Knights in order

--List the winners, year and subject where the winner starts with Sir. Show the the most recent first, then by name order.



Select winner, yr, subject
from nobel
where winner LIKE 'Sir%'
order by yr DESC, winner




--14.
--The expression subject IN ('Chemistry','Physics') can be used as a value - it will be 0 or 1.

--Show the 1984 winners and subject ordered by subject and winner name; but list Chemistry and Physics last.





SELECT winner, subject
  FROM nobel
 WHERE yr=1984
 ORDER BY 
CASE WHEN subject IN ('Physics','Chemistry') THEN 1 ELSE 0 END,
 subject,winner
