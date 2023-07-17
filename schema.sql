/* Database schema to keep the structure of the entire database. */

CREATE TABLE animals (
    id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY, 
    name varchar(100),
    date_of_birth date,
    escape_attempts int,
    neutered boolean,
    weight_kg decimal,
);

-- Add a column species of type string to your animals table. Modify your schema.sql file
ALTER TABLE animals
ADD species varchar(255);


------------------------------------------------------------------------------------------------------------------------
-- Create a table named owners with the following columns:
-- id: integer (set it as autoincremented PRIMARY KEY)
-- full_name: string
-- age: integer
CREATE TABLE owners (
    id int NOT NULL,
    full_name varchar(255),
    Age int,
    PRIMARY KEY (ID)
);

-- Create a table named species with the following columns:
-- id: integer (set it as autoincremented PRIMARY KEY)
-- name: string
CREATE TABLE species (
    id int NOT NULL,
    name varchar(255),
    PRIMARY KEY (ID)
);

------------------------------------------------------------
-- Remove column species
ALTER TABLE animals
DROP COLUMN species;
-- Add column species_id which is a foreign key referencing species table
ALTER TABLE animals
ADD species_id int,
ADD FOREIGN KEY (species_id) REFERENCES species(id);
-- Add column owner_id which is a foreign key referencing the owners table
ALTER TABLE animals
ADD owner_id int,
ADD FOREIGN KEY (owner_id) REFERENCES owners(id);
------------------------------------------------------------------------------------------------------------------------
CREATE TABLE vets (
  id SERIAL PRIMARY KEY,
  name VARCHAR,
  age INTEGER,
  date_of_graduation DATE
);

CREATE TABLE specializations (
  vet_id INTEGER REFERENCES vets(id),
  specialty VARCHAR
);

CREATE TABLE visits (
  animal VARCHAR,
  vet_id INTEGER REFERENCES vets(id),
  visit_date DATE
);

--------------------------------------------------------------------------------------------------------------------------------------------
-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animal, vet_id, visit_date) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)

INSERT INTO owners (full_name, email)
SELECT 'Owner ' || generate_series(1, 2500000), 'owner_' || generate_series(1, 2500000) || '@mail.com'
ON CONFLICT DO NOTHING;

explain analyze SELECT COUNT(*) FROM visits where vet_id = 4
--------------------------------------------------------------------------------------------------------------------------------------------
SELECT COUNT(*) FROM visits where vet_id = 4;
SELECT * FROM visits where vet_id = 2;
SELECT * FROM owners where email = 'owner_18327@mail.com';

--------------------------------------------------------------------------------------------------------------------------------------------
INDEXING SOL:
CREATE INDEX visits_vet_id_idx ON visits (vet_id);
CREATE INDEX owners_email_idx ON owners (email);
