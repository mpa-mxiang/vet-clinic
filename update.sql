-- Inside a transaction update the animals table by setting the species column to unspecified. Verify that change was made.

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

