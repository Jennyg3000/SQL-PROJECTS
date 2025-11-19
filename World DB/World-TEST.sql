USE world;
SELECT * FROM CITY;
SELECT * FROM country;

SELECT COUNT(C.ID) AS NumberOfCity, CT.Name
FROM City C, Country CT
WHERE C.CountryCode=CT.Code AND CT.Name ='United States'
GROUP BY CT.Name;

SELECT COUNT(C.ID) AS NumberOfCity, CT.Name
FROM City C JOIN Country CT
ON C.CountryCode=CT.Code AND CT.Name ='United States'
GROUP BY CT.Name;

SELECT Name FROM City
WHERE Name like '%NEW%';

SELECT Name, Population FROM CITY
ORDER BY Population DESC
LIMIT 10;

SELECT Name, Population FROM CITY
WHERE Population > 2000000
ORDER BY Population DESC;

SELECT Name FROM City
WHERE Name like 'Be%';

SELECT Name, Population FROM CITY
WHERE Population BETWEEN 500000 AND 1000000
ORDER BY Population DESC;

SELECT Name, Population FROM CITY
WHERE Population >=500000 AND Population<=1000000
ORDER BY Population DESC;

SELECT Name FROM City
ORDER BY Name;

SELECT Name FROM City
ORDER BY Name ASC;

SELECT Name, Population FROM CITY
ORDER BY Population DESC
LIMIT 1;

SELECT DISTINCT Name, COUNT(Name) AS Number FROM City
GROUP BY Name
ORDER BY Name; 

SELECT Name, Population FROM CITY
ORDER BY Population
LIMIT 1;

SELECT Name, Population FROM Country
ORDER BY Population DESC
LIMIT 1;

SELECT CT.Name, C.Name AS Capital FROM Country CT, City C 
WHERE  CT.Capital=C.ID AND CT.Name='Spain';

SELECT CT.Name, C.Name AS Capital 
FROM Country CT 
JOIN City C 
ON  CT.Capital=C.ID AND CT.Name='Spain';

SELECT C.Name AS CITY, CT.Continent AS CONTINENT 
FROM Country CT, City C 
WHERE  CT.Code=C.CountryCode AND CT.Continent='Europe';

SELECT C.Name AS CITY, CT.Continent AS CONTINENT 
FROM Country CT 
JOIN City C 
ON  CT.Code=C.CountryCode AND CT.Continent='Europe';

SELECT CT.Name AS Country, C.Name AS Capital, C.Population
FROM City AS C, Country AS CT
WHERE C.ID=CT.Capital
ORDER BY Country;

SELECT CT.Name AS Country, C.Name AS Capital, C.Population
FROM City AS C JOIN Country AS CT
ON C.ID=CT.Capital
ORDER BY C.Population;

SELECT Name, Population, SurfaceArea, 
Population/SurfaceArea AS Population_Dens 
FROM Country
ORDER BY  Population_Dens
LIMIT 20;
 
SELECT C.Name AS City, CT.Name AS Country, 
CT.GNP/CT.Population AS GNPPerCap, C.GNP/C.Population AS GNPPerCap_City
FROM City AS C, Country AS CT
WHERE GNPPerCap_City> (SELECT AVG(CT.GNP/CT.Population) FROM Country)
ORDER BY GNPPerCap_City;

SELECT C.Name AS City, CT.Name AS Country, 
CT.GNP/CT.Population AS GNPPerCap /*--, C.GNP/C.Population AS GNPPerCap_City*/
FROM City AS C, Country AS CT
WHERE GNPPerCap>AVG(SUM(CT.GNP)/SUM(CT.Population));


SELECT Name, GNP/Population AS GNPPerCap/*--, C.GNP/C.Population AS GNPPerCap_City*/
FROM Country 
WHERE GNP/Population > (SELECT AVG(GNP/Population) FROM Country);

SELECT AVG(GNP/Population) AS Value from country;

SELECT Population, Name FROM City
Order by Population
Limit 30, 10;

SELECT Population, Name FROM City
Order by Population
Limit 40;

SELECT CT.Name, Avg(CT.Population) AS AVGPopulation, SUM(C.Population) AS CountryPopulation
From Country CT, City C
WHERE C.CountryCode=CT.Code
GROUP BY CT.Name;

SELECT Name, Avg(Population) AS AVGPopulation /*, SUM(C.Population) AS CountryPopulation*/
From Country 
GROUP BY Name
ORDER BY AVGPopulation DESC;

SELECT Name, Population /*, SUM(C.Population) AS CountryPopulation*/
From Country;

SELECT C.Name, CT.Name, CT.Population, (CT.GNP/CT.Population) AS GDPPerCapita
FROM City C, Country CT
WHERE (CT.GNP/CT.Population)>=(SELECT AVG(CT.GNP/CT.Population) FROM Country)
ORDER BY CT.GNP/CT.Population DESC;

SELECT C.Name AS City, CT.Name AS Country, CT.Population, CT.GNP/CT.Population AS GDPPerCapita
FROM City C, Country CT
WHERE C.CountryCode=CT.Code AND (CT.GNP/CT.Population)> (SELECT AVG(GNP/Population) FROM Country);

SELECT AVG(GNP/Population) FROM Country;

SELECT C.Name AS City, CT.Name AS Country, CT.Population, CT.GNP/CT.Population AS GDPPerCapita
FROM City C, Country CT
WHERE C.CountryCode=CT.Code;

SELECT C.Name AS City, CT.Name AS Country, CT.Population, CT.GNP/CT.Population AS GDPPerCapita,
(SELECT AVG(GNP/Population) FROM Country) AS AVG_GDPPerCapita
FROM City C JOIN Country CT
ON C.CountryCode=CT.Code 
WHERE (CT.GNP/CT.Population)> (SELECT AVG(GNP/Population) FROM Country);

SELECT C.Name AS City, CT.Name AS Country, CT.Population, CT.GNP/CT.Population AS GDPPerCapita,
(SELECT AVG(GNP/Population) FROM Country) AS AVG_GDPPerCapita
FROM City C, Country CT
WHERE C.CountryCode=CT.Code AND (CT.GNP/CT.Population)> (SELECT AVG(GNP/Population) FROM Country);

SELECT AVG(C.Population) AS City_Population, CT.Name AS Country, CT.Population AS Country_Population
FROM City AS C, Country AS CT 
WHERE CT.Code=C.CountryCode
GROUP BY CT.Name,Country_Population;

SELECT AVG(C.Population) AS AVG_City_Population, CT.Name AS Country,  CT.Population AS Country_Population
FROM City AS C JOIN Country AS CT
ON CT.Code=C.CountryCode
GROUP BY CT.Name, Country_Population;


