/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
  id INT GENERETED ALWAYS AS IDENTITY,
  name varchar(50),
  date_of_birth DATE,
  escape_attempts INT,
  neutered BOOLEAN,
  weight_kg DECIMAL,
  PRIMARY KEY (id)
);

ALTER TABLE animals
DROP COLUMN species;

ALTER TABLE animals 
ADD COLUMN species_id INT REFERENCES species(id)
ON DELETE CASCADE;

ALTER TABLE animals
ADD COLUMN owners_id INT REFERENCES owners(id)
ON DELETE CASCADE;


CREATE TABLE owners (
id INT GENERATED ALWAYS AS IDENTITY,
full_name varchar(100),
age INT,
PRIMARY KEY(id)
);

CREATE TABLE species (
id INT GENERATED ALWAYS AS IDENTITY,
name varchar(100),
PRIMARY KEY (id)
);

-- Schema to Join Tables --
CREATE TABLE vets (
  id INT GENERATED ALWAYS AS IDENTITY,
  name varchar(100),
  age INT,
  date_of_graduation DATE,
  PRIMARY KEY (id) 
);

CREATE TABLE specialization (
  id INT GENERATED ALWAYS AS IDENTITY,
  species_id INT REFERENCES species(id) ON DELETE CASCADE,
  vets_id INT REFERENCES vets(id) ON DELETE CASCADE,
  PRIMARY KEY (id)
);

CREATE TABLE visits (
  id INT GENERATED ALWAYS AS IDENTITY,
  animals_id INT REFERENCES animals(id) ON DELETE CASCADE,
  vets_id INT REFERENCES vets(id) ON DELETE CASCADE,
  date_of_visit DATE,
  PRIMARY KEY (id)
);


-- Performance Audit --
ALTER TABLE owners ADD COLUMN email VARCHAR(120);