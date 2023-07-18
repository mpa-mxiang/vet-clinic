CREATE TABLE treatments (
    id INT,
    type VARCHAR(30),
    name VARCHAR(30),
    PRIMARY KEY(id),
);

--  FOREIGN KEY(vet_id) REFERENCES vets(id),
--     FOREIGN KEY(species_id) REFERENCES species(id)

CREATE TABLE medical_histories (
    id INT,
    admitted_at VARCHAR(30),
    patient_id INT,
    status VARCHAR(30),
    PRIMARY KEY(id),
    FOREIGN KEY(patient_id) REFERENCES patients(id)
);
