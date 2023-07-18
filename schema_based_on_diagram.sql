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
