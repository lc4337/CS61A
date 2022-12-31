CREATE TABLE parents AS
  SELECT "abraham" AS parent, "barack" AS child UNION
  SELECT "abraham"          , "clinton"         UNION
  SELECT "delano"           , "herbert"         UNION
  SELECT "fillmore"         , "abraham"         UNION
  SELECT "fillmore"         , "delano"          UNION
  SELECT "fillmore"         , "grover"          UNION
  SELECT "eisenhower"       , "fillmore";

CREATE TABLE dogs AS
  SELECT "abraham" AS name, "long" AS fur, 26 AS height UNION
  SELECT "barack"         , "short"      , 52           UNION
  SELECT "clinton"        , "long"       , 47           UNION
  SELECT "delano"         , "long"       , 46           UNION
  SELECT "eisenhower"     , "short"      , 35           UNION
  SELECT "fillmore"       , "curly"      , 32           UNION
  SELECT "grover"         , "short"      , 28           UNION
  SELECT "herbert"        , "curly"      , 31;

CREATE TABLE sizes AS
  SELECT "toy" AS size, 24 AS min, 28 AS max UNION
  SELECT "mini"       , 28       , 35        UNION
  SELECT "medium"     , 35       , 45        UNION
  SELECT "standard"   , 45       , 60;


-- The size of each dog
CREATE TABLE size_of_dogs AS
  SELECT name, size FROM dogs, sizes WHERE min < height AND height <= max;


-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE by_parent_height AS
  SELECT child FROM parents, dogs WHERE parent = name ORDER BY height DESC;


-- Filling out this helper table is optional
CREATE TABLE siblings AS
  SELECT a.name, b.name, a.size FROM size_of_dogs AS a, size_of_dogs AS b, parents AS af, parents AS bf
   WHERE a.name < b.name AND a.size = b.size AND a.name = af.child AND b.name = bf.child AND af.parent = bf.parent;

-- Sentences about siblings that are the same size
CREATE TABLE sentences AS
  SELECT name || " and " || "name:1" || " are " || size || " siblings" FROM siblings;

-- Ways to stack 4 dogs to a height of at least 170, ordered by total height
CREATE TABLE stacks_helper(dogs, stack_height, last_height, n);

-- Add your INSERT INTOs here
INSERT INTO stacks_helper SELECT name, height, height, 1 FROM dogs ORDER BY height;
INSERT INTO stacks_helper 
  SELECT a.dogs || ", " || b.name, a.stack_height + b.height, b.height, a.n + 1 
  FROM stacks_helper AS a, dogs AS b
  WHERE a.last_height < b.height
  ORDER BY a.stack_height + b.height;
INSERT INTO stacks_helper
  SELECT a.dogs || ", " || b.name, a.stack_height + b.height, b.height, a.n + 1
  FROM stacks_helper AS a, dogs AS b
  WHERE a.last_height < b.height AND a.n = 2
  ORDER BY a.stack_height + b.height;
INSERT INTO stacks_helper
  SELECT a.dogs || ", " || b.name, a.stack_height + b.height, b.height, a.n + 1
  FROM stacks_helper AS a, dogs AS b
  WHERE a.last_height < b.height AND a.n = 3 AND a.stack_height + b.height >= 170
  ORDER BY a.stack_height + b.height;


CREATE TABLE stacks AS
  SELECT dogs, stack_height FROM stacks_helper WHERE n = 4;

