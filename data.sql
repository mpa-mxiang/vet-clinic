/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Agumon', TO_DATE('03/02/2020', 'DD/MM/YYYY'), 0, 1, 10.23);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Gabumon', TO_DATE('15/11/2018', 'DD/MM/YYYY'), 2, 1, 8);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Pikachu', TO_DATE('07/01/2021', 'DD/MM/YYYY'), 1, 0, 15.04);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Devimon', TO_DATE('12/05/2017', 'DD/MM/YYYY'), 5, 1, 11);

/*
Insert the following data:
Animal: His name is Charmander. He was born on Feb 8th, 2020, and currently weighs -11kg. He is not neutered and he has never tried to escape.
Animal: Her name is Plantmon. She was born on Nov 15th, 2021, and currently weighs -5.7kg. She is neutered and she has tried to escape 2 times.
Animal: His name is Squirtle. He was born on Apr 2nd, 1993, and currently weighs -12.13kg. He was not neutered and he has tried to escape 3 times.
Animal: His name is Angemon. He was born on Jun 12th, 2005, and currently weighs -45kg. He is neutered and he has tried to escape once.
Animal: His name is Boarmon. He was born on Jun 7th, 2005, and currently weighs 20.4kg. He is neutered and he has tried to escape 7 times.
Animal: Her name is Blossom. She was born on Oct 13th, 1998, and currently weighs 17kg. She is neutered and she has tried to escape 3 times.
Animal: His name is Ditto. He was born on May 14th, 2022, and currently weighs 22kg. He is neutered and he has tried to escape 4 times.
*/

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Charmander', TO_DATE('08/02/2020', 'DD/MM/YYYY'), 0, FALSE, 11);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Plantmon', TO_DATE('15/11/2021', 'DD/MM/YYYY'), 2, TRUE, 5.7);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Squirtle', TO_DATE('02/04/1993', 'DD/MM/YYYY'), 3, FALSE, 12.13);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Angemon', TO_DATE('12/06/2005', 'DD/MM/YYYY'), 1, TRUE, 45);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Boarmon', TO_DATE('07/06/2005', 'DD/MM/YYYY'), 7, TRUE, 20.4);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Blossom', TO_DATE('13/10/1998', 'DD/MM/YYYY'), 3, TRUE, 17);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Ditto', TO_DATE('14/05/2022', 'DD/MM/YYYY'), 4, TRUE, 22);

---------------------------------------------------------------------------------------------------------------------------------------
/*
Insert the following data into the owners table:
Sam Smith 34 years old.
Jennifer Orwell 19 years old.
Bob 45 years old.
Melody Pond 77 years old.
Dean Winchester 14 years old.
Jodie Whittaker 38 years old.
*/
INSERT INTO owners (id, full_name, age)
VALUES (1, 'Sam Smith', 34);

INSERT INTO owners (id, full_name, age)
VALUES (2, 'Jennifer Orwell', 19);

INSERT INTO owners (id, full_name, age)
VALUES (3, 'Bob', 45);

INSERT INTO owners (id, full_name, age)
VALUES (4, 'Melody Pond', 77);

INSERT INTO owners (id, full_name, age)
VALUES (5, 'Dean Winchester', 14);

INSERT INTO owners (id, full_name, age)
VALUES (6, 'Jodie Whittaker', 38);
---------------------------------------------------------------------------------------------------------------------------------------
/*
Insert the following data into the species table:
Pokemon
Digimon
*/
INSERT INTO species (id, name)
VALUES (1, 'Pokemon');

INSERT INTO species (id, name)
VALUES (2, 'Digimon');
---------------------------------------------------------------------------------------------------------------------------------------
/*
Modify your inserted animals so it includes the species_id value:
If the name ends in "mon" it will be Digimon
All other animals are Pokemon
*/
update animals set species_id=2 WHERE name LIKE '%mon';
update animals set species_id=1 WHERE name NOT LIKE '%mon';
---------------------------------------------------------------------------------------------------------------------------------------

/*
Modify your inserted animals to include owner information (owner_id):
Sam Smith owns Agumon.
Jennifer Orwell owns Gabumon and Pikachu.
Bob owns Devimon and Plantmon.
Melody Pond owns Charmander, Squirtle, and Blossom.
Dean Winchester owns Angemon and Boarmon.
*/
update animals set owner_id=1 WHERE name = 'Agumon';
update animals set owner_id=2 WHERE name = 'Gabumon' OR name = 'Pikachu';
update animals set owner_id=3 WHERE name = 'Devimon' OR name = 'Plantmon';
update animals set owner_id=4 WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';
update animals set owner_id=5 WHERE name = 'Angemon' OR name = 'Boarmon';

