USE homeworkbits1;

#Question 1 BITS
SHOW TABLES;

SELECT *
FROM client;

#Question 2 BITS
SELECT *
FROM tasks;

#Question 3 Colonial
SELECT TripName
FROM Trip
WHERE type = 'Hiking'
 AND Distance>6;

#Question 4 Colonial
SELECT TripName
FROM Trip
WHERE type = 'Paddling'
  OR State = 'VT';

#Question 3 Sports
SELECT LastName, FirstName
FROM Therapist
WHERE City = 'Palm Rivers';

#Question 4 Sports
SELECT LastName, FirstName
FROM Therapist
WHERE NOT City = 'Palm Rivers';

#Question 5 Sports
#No Balance over $3000 so no extra code needed
SELECT PatientNum, LastName, FirstName, Balance
FROM Patient;

#Question 11 Sports
SELECT PatientNum, LastName
FROM Patient
WHERE City IN ('Palm Rivers','Waterville','Munster');

#Question 21 Sports
#This is what I used
SELECT PatientNum, LastName
FROM Patient
WHERE City IN ('Palm Rivers','Waterville','Munster');

#This is what you could alternativly use
SELECT PatientNum, LastName
FROM Patient
WHERE City = 'Palm Rivers' OR City = 'Waterville' OR City = 'Munster';

#Question 22 Sports
SELECT *
FROM Therapies
WHERE Description LIKE '%training%';

