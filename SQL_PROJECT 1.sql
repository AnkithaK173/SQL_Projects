CREATE DATABASE medical_management;
USE medical_management;

#Creating Tables:
# Patients Table: This table will store information about the patients, such as their contact details and medical history.

CREATE TABLE Patients (
    Patient_ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Date_of_Birth DATE,
    Gender CHAR(1),
    Contact_Number VARCHAR(15),
    Address VARCHAR(255),
    Medical_History TEXT
);

# Doctors Table: This table will store doctor information like their specialty and availability.

CREATE TABLE Doctors (
    Doctor_ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Specialty VARCHAR(100),
    Contact_Number VARCHAR(15),
    Availability ENUM('Available', 'Unavailable') DEFAULT 'Available'
);

# Appointments Table: This table stores appointments between patients and doctors, tracking the status of each appointment.

CREATE TABLE Appointments (
    Appointment_ID INT AUTO_INCREMENT PRIMARY KEY,
    Patient_ID INT,
    Doctor_ID INT,
    Appointment_Date DATE,
    Appointment_Time TIME,
    Purpose VARCHAR(255),
    Status ENUM('Scheduled', 'Completed', 'Canceled') DEFAULT 'Scheduled',
    FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID),
    FOREIGN KEY (Doctor_ID) REFERENCES Doctors(Doctor_ID)
);

# Medical Records Table: This table stores the diagnosis, treatment, and visit notes for each patient's visit.

CREATE TABLE Medical_Records (
    Record_ID INT AUTO_INCREMENT PRIMARY KEY,
    Patient_ID INT,
    Doctor_ID INT,
    Visit_Date DATE,
    Diagnosis TEXT,
    Treatment TEXT,
    Notes TEXT,
    FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID),
    FOREIGN KEY (Doctor_ID) REFERENCES Doctors(Doctor_ID)
);

# Inserting Sample Data: Insert Data into Patients Table:

INSERT INTO Patients (Name, Date_of_Birth, Gender, Contact_Number, Address, Medical_History)
VALUES
('Amit Sharma', '1990-05-21', 'M', '9876543210', '123 MG Road, Delhi', 'Asthma, Allergies'),
('Neha Gupta', '1985-08-14', 'F', '8765432109', '456 Brigade Road, Bengaluru', 'Diabetes'),
('Rajesh Kumar', '1978-03-10', 'M', '9123456789', '789 Park Street, Kolkata', 'Hypertension, Obesity'),
('Sonia Mehra', '1992-11-05', 'F', '9988776655', '321 Marine Drive, Mumbai', 'Thyroid Disorder'),
('Anil Verma', '1980-07-22', 'M', '9871234567', '567 Anna Salai, Chennai', 'Heart Disease');

# Insert Data into Doctors Table:

INSERT INTO Doctors (Name, Specialty, Contact_Number, Availability)
VALUES
('Dr. Priya Singh', 'Cardiologist', '9123456789', 'Available'),
('Dr. Rahul Mehta', 'General Physician', '9876543210', 'Available'),
('Dr. Anjali Rao', 'Pediatrician', '9988776655', 'Available'),
('Dr. Suresh Nair', 'Orthopedic Surgeon', '8765432109', 'Available'),
('Dr. Kavita Sharma', 'Dermatologist', '9654321098', 'Available');

# Insert Data into Appointments Table:

INSERT INTO Appointments (Patient_ID, Doctor_ID, Appointment_Date, Appointment_Time, Purpose, Status)
VALUES
(1, 2, '2024-10-25', '10:00:00', 'Routine Check-up', 'Scheduled'),
(2, 1, '2024-10-26', '11:30:00', 'Heart Check-up', 'Scheduled'),
(3, 4, '2024-10-27', '09:00:00', 'Knee Pain Consultation', 'Scheduled'),
(4, 3, '2024-10-28', '14:00:00', 'Child Vaccination', 'Scheduled'),
(5, 5, '2024-10-29', '16:00:00', 'Skin Rashes Consultation', 'Scheduled');

# Insert Data into Medical Records Table:

INSERT INTO Medical_Records (Patient_ID, Doctor_ID, Visit_Date, Diagnosis, Treatment, Notes)
VALUES
(1, 2, '2024-10-01', 'Common Cold', 'Rest, Hydration, Cold medication', 'Mild symptoms, stable'),
(2, 1, '2024-10-10', 'Hypertension', 'Medication prescribed', 'Monitor blood pressure'),
(3, 4, '2024-10-15', 'Osteoarthritis', 'Physical therapy', 'Needs regular check-ups'),
(4, 3, '2024-10-20', 'Viral Infection', 'Antiviral medication', 'Improving condition'),
(5, 5, '2024-10-22', 'Eczema', 'Topical steroids', 'Follow-up in 2 weeks');

# Querying Data: 
# List All Scheduled Appointments:
-- fetche all scheduled appointments along with patient and doctor details.

SELECT A.Appointment_ID, P.Name AS Patient_Name, D.Name AS Doctor_Name, 
       A.Appointment_Date, A.Appointment_Time, A.Purpose
FROM Appointments A
JOIN Patients P ON A.Patient_ID = P.Patient_ID
JOIN Doctors D ON A.Doctor_ID = D.Doctor_ID
WHERE A.Status = 'Scheduled';

# Find Available Doctors by Specialty
-- Retrieve all available doctors for a specific specialty, such as "Cardiologist."

SELECT Name, Contact_Number 
FROM Doctors 
WHERE Specialty = 'Cardiologist' AND Availability = 'Available';

# View Patient's Medical History
-- This query retrieves the full medical history of a specific patient, such as "Amit Sharma."

SELECT Visit_Date, Diagnosis, Treatment, Notes 
FROM Medical_Records 
WHERE Patient_ID IN (SELECT Patient_ID FROM Patients WHERE Name = 'Amit Sharma');

# List All Appointments for a Specific Doctor
-- Fetch all upcoming appointments for a specific doctor, for example, "Dr. Priya Singh."

SELECT A.Appointment_Date, A.Appointment_Time, P.Name AS Patient_Name, A.Purpose
FROM Appointments A
JOIN Patients P ON A.Patient_ID = P.Patient_ID
WHERE A.Doctor_ID IN (SELECT Doctor_ID FROM Doctors WHERE Name = 'Dr. Priya Singh');

# View Upcoming Appointments for the Next 7 Days
-- Retrieve all appointments scheduled within the next week.

SELECT A.Appointment_ID, P.Name AS Patient_Name, D.Name AS Doctor_Name, 
       A.Appointment_Date, A.Appointment_Time
FROM Appointments A
JOIN Patients P ON A.Patient_ID = P.Patient_ID
JOIN Doctors D ON A.Doctor_ID = D.Doctor_ID
WHERE A.Appointment_Date BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 7 DAY)
  AND A.Status = 'Scheduled';

# Check Doctor Availability Before Booking:
-- Ensure that a doctor has no appointments scheduled during a specific time before allowing a new booking.

SELECT COUNT(*)
FROM Appointments
WHERE Doctor_ID IN (SELECT Doctor_ID FROM Doctors WHERE Name = 'Dr. Priya Singh')
      AND Appointment_Date = '2024-10-25'
      AND Appointment_Time = '10:00:00';













