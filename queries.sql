/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals
WHERE name LIKE '%mon';

SELECT name FROM animals
WHERE date_of_birth >= '2016/01/01' and date_of_birth <= '2019/12/31';

-- List the name of all animals that are neutered and have less than 3 escape attempts.
SELECT name FROM animals
  WHERE neutered=TRUE AND escape_attempts<3;

SELECT date_of_birth FROM animals
WHERE name = 'Agumon' OR name = 'Pikachu';

SELECT name, escape_attempts FROM animals
WHERE weight_kg > 10.5;

SELECT * FROM animals
WHERE neutered = 1;

SELECT * FROM animals
WHERE name != 'Gabumon';

SELECT * FROM animals
WHERE weight_kg >= 10.4 and weight_kg <= 17.3;


---------------
UPDATE animals SET species = 'unspecified' WHERE id = 3;

-- Then roll back the change and verify that the species columns went back to the state before the transaction:

UPDATE animals SET species = null WHERE id = 3;

-- Update the animals table by setting the species column to digimon for all animals that have a name ending in mon.

UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';

-- Update the animals table by setting the species column to pokemon for all animals that don't have species already set

UPDATE animals SET species = 'pokemon' WHERE species IS null;

-- Commit the transaction.

COMMIT;

---------------------------------------------
-- Begin a new transaction.
BEGIN;
-- Delete all records in the animals table.
DELETE FROM animals;
-- Rollback.
ROLLBACK;

-- Delete all animals born after Jan 1st, 2022.
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
-- Create a savepoint for the transaction.
BEGIN;
SAVEPOINT my_savepoint;
-- Update all animals' weight to be their weight multiplied by -1.
UPDATE animals SET weight_kg = weight_kg * -1;
COMMIT;


------------------------------------------------------------
-- animal count
SELECT DISTINCT COUNT(name) FROM animals;
-- How many animals have never tried to escape?
SELECT DISTINCT COUNT(name)
FROM animals
WHERE escape_attempts = 0;
-- What is the average weight of animals?
SELECT AVG(weight_kg)
FROM animals;
-- Who escapes the most, neutered or not neutered animals?
SELECT SUM(escape_attempts)
FROM animals
WHERE neutered=TRUE;

SELECT SUM(escape_attempts)
FROM animals
WHERE neutered=FALSE;

-- What is the minimum and maximum weight of each type of animal?
SELECT MIN(weight_kg), MAX(weight_kg)
FROM animals
WHERE neutered=TRUE;

SELECT MIN(weight_kg), MAX(weight_kg)
FROM animals
WHERE neutered=FALSE;

-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT AVG(escape_attempts)
FROM animals
WHERE neutered=TRUE
AND date_of_birth >= '1990/01/01' and date_of_birth <= '2000/12/31';

SELECT AVG(escape_attempts)
FROM animals
WHERE neutered=FALSE
AND date_of_birth >= '1990/01/01' and date_of_birth <= '2000/12/31';


/*
What animals belong to Melody Pond?
*/
SELECT name
  FROM animals a
  JOIN owners o ON o.id = a.owner_id
  WHERE o.full_name='Melody Pond'
/*
List of all animals that are pokemon (their type is Pokemon).
*/
SELECT name
  FROM animals
  WHERE species_id=1

/*
List all owners and their animals, remember to include those that don't own any animal.
*/
SELECT owners.full_name, animals.name
  FROM owners
  LEFT JOIN animals ON owners.id = animals.owner_id
  /*
How many animals are there per species?
*/
SELECT species.name, COUNT(animals.id) AS animal_count
FROM species
JOIN animals ON species.id = animals.species_id
GROUP BY species.name;
/*
List all Digimon owned by Jennifer Orwell.
*/
SELECT animals.name
FROM animals
JOIN owners ON animals.owner_id = owners.id
JOIN species ON animals.species_id = species.id
WHERE owners.full_name = 'Jennifer Orwell' AND species.name = 'Digimon';

/*
List all animals owned by Dean Winchester that haven't tried to escape.
*/
SELECT animals.name
FROM animals
JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;

/*
Who owns the most animals?
*/
SELECT owners.full_name
FROM animals
JOIN owners ON animals.owner_id = owners.id
GROUP BY owners.full_name
ORDER BY COUNT(*) DESC
LIMIT 1;

