-- Patients Table --

CREATE TABLE patients (
  id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
  name varchar(100) NOT NULL,
  date_of_birth DATE,
  PRIMARY key (id)
)

-- Medical Histories --

CREATE TABLE medical_histories (
  id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
  admitted_at TIMESTAMP,
  patient-id INT NOT NULL,
  status varchar(100),
  PRIMARY KEY(id) ,
  CONSTRAINT fk_patients FOREIGN KEY (patient_id) REFERENCES Patients (id) ON DELETE CASCADE
)