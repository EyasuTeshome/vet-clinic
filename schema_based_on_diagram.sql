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

-- Invoices Table

CREATE TABLE invoices(
  id BIGSERIAL PRIMARY KEY NOT NULL,
  total_amount MONEY NOT NULL,
  generated_at DATE NOT NULL,
  payed_at DATE NOT NULL,
  medical_history_id INT NOT NULL,
  FOREIGN KEY (medical_history_id) REFERENCES medical_histories(medical_history_id) ON DELETE CASCADE
)

-- Invoice Items Table
CREATE TABLE invoice_items(
  id BIGSERIAL PRIMARY KEY NOT NULL,
  unit_price DECIMAL NOT NULL,
  quantity INT NOT NULL,
  total_price DECIMAL NOT NULL,
  invoice_id INT NOT NULL,
  treatment_id INT NOT NULL,
  FOREIGN KEY (invoice_id) REFERENCES invoices(invoice_id),
  FOREIGN KEY (treatment_id) REFERENCES treatments(treatment_id)
)