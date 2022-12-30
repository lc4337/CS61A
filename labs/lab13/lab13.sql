.read data.sql


CREATE TABLE bluedog AS
  SELECT color, pet FROM students WHERE color = "blue" AND pet = "dog";

CREATE TABLE bluedog_songs AS
  SELECT color, pet, song FROM students WHERE color = "blue" AND pet = "dog";


CREATE TABLE matchmaker AS
  SELECT a.pet, a.song, a.color, b.color FROM students AS a, students AS b WHERE a.pet = b.pet AND a.song = b.song AND a.time < b.time;

CREATE TABLE sevens AS
  SELECT seven FROM students, numbers WHERE number = 7 AND '7' AND students.time = numbers.time;

CREATE TABLE favpets AS
  SELECT pet, count(*) AS count FROM students GROUP BY pet ORDER BY count DESC LIMIT 10;

CREATE TABLE dog AS
  SELECT pet, count(*) FROM students WHERE pet = "dog" GROUP BY pet;

CREATE TABLE bluedog_agg AS
  SELECT song, count(*) AS cnt from bluedog_songs GROUP BY song ORDER BY cnt DESC;

CREATE TABLE instructor_obedience AS
  SELECT seven, instructor, count(*) AS count FROM students WHERE seven = '7' GROUP BY instructor;
