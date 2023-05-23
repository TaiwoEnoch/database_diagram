CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    date_of_birth DATE
)

CREATE TABLE medical_history (
    id SERIAL PRIMARY KEY,
    admitted_at TIMESTAMP,
    patient_id INT REFERENCES patients(id),
    status VARCHAR(50)
);

CREATE TABLE treatments (
    id SERIAL PRIMARY KEY,
    type VARCHAR(50),
    name VARCHAR(50)
);

CREATE TABLE medical_treatments (
    id SERIAL PRIMARY KEY,
    medical_treatment_id INT REFERENCES treatments(id),
    medical_histories_id INT REFERENCES medical_history(id)
);

CREATE TABLE invoices (
    id SERIAL PRIMARY KEY,
    total_amount DECIMAL,
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_history_id INT REFERENCES medical_history(id)
);

CREATE TABLE invoice_items (
    id SERIAL PRIMARY KEY,
    unit_price DECIMAL,
    quantity INT,
    total_price DECIMAL,
    invoice_id INT REFERENCES invoices(id),
    treatment_id INT REFERENCES treatments(id)
);

CREATE INDEX patient_name_ASC ON patients(name ASC);
CREATE INDEX idx_medicalhistory_patient_id ON medical_history(patient_id);
CREATE INDEX idx_invoices_medical_history_id ON invoices(medical_history_id);
CREATE INDEX idx_invoicitems_invoice_id ON invoice_items(invoice_id);
CREATE INDEX idx_invoicitems_treatment_id ON invoice_items(treatment_id);
CREATE INDEX idx_medicaltreatments_medicaltreatment_id ON medical_treatments(medical_treatment_id);
CREATE INDEX idx_medicaltreatments_medicalhistories_id ON medical_treatments(medical_histories_id);
