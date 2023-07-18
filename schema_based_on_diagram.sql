CREATE TABLE treatments (
    id INT GENERATED ALWAYS AS IDENTITY,
    type VARCHAR(30),
    name VARCHAR(30),
    PRIMARY KEY(id),
);

CREATE TABLE medical_histories (
    id INT GENERATED ALWAYS AS IDENTITY,
    admitted_at TIMESTAMP,
    patient_id INT,
    status VARCHAR(30),
    PRIMARY KEY(id),
    FOREIGN KEY(patient_id) REFERENCES patients(id)
);

CREATE TABLE patients(
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(20),
  date_of_birth DATE,
  PRIMARY KEY(id)
);

CREATE TABLE invoices(
  id INT GENERATED ALWAYS AS IDENTITY,
  total_amountsql DECIMAL,
  generated_at TIMESTAMP,
  generated_at TIMESTAMP,
  medical_history_id INT
  PRIMARY KEY(id)
);

