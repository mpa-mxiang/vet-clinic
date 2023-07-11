-- Inside a transaction update the animals table by setting the species column to unspecified. Verify that change was made.

UPDATE animals SET species = 'unspecified' WHERE id = 3;

-- Then roll back the change and verify that the species columns went back to the state before the transaction:

UPDATE animals SET species = null WHERE id = 3;

-- Update the animals table by setting the species column to digimon for all animals that have a name ending in mon.
