/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name LIKE %mon;
SELECT * FROM animals WHERE date_of_birth BETWEEN CAST('2016-01-01' AS DATE) AND CAST('2019-12-31' AS DATE);
SELECT * FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name != 'Gabumon'; 
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;


BEGIN;
UPDATE animals SET species = 'unspecified';
ROLLBACK;

UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';

UPDATE animals SET species = 'pokemon' WHERE species IS NULL;

BEGIN;
DELETE FROM animals;
ROLLBACK;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
ROLLBACK;

BEGIN;
SAVEPOINT weight_save;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO weight_kg;

UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg <0;
COMMIT;

SELECT COUNT(*) FROM animals;

SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;

SELECT AVG(weight_kg) FROM animals;


SELECT neutered, SUM(escape_attempts) FROM animals GROUP BY neutered;

SELECT species, MIN(weight_kg) FROM animals GROUP BY species;

SELECT species, AVG(escape_attempts) FROM animals GROUP BY species WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-01-01';