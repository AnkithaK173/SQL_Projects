CREATE DATABASE clinical_trials;

create tables for clinical trial project, such as Patients, Treatments, Visits, Adverse Events, and Lab Results.
 
USE clinical_trials;  

CREATE TABLE Patients (
    Patient_ID INT AUTO_INCREMENT PRIMARY KEY,   -- unique ID for each patient
    Name VARCHAR(50),                            -- Patient's Name
    Age INT,                                     -- Patient's Age
    Gender CHAR(1),                              -- 'M' for Male, 'F' for Female 
    Diagnosis VARCHAR(100),                      -- Medical diagnosis the patient has (e.g., 'Diabetes', 'Heart Disease')
    Enrollment_Date DATE,                        -- Date the patient was enrolled in the clinical trial
    Treatment_ID INT                             -- Reference to the treatment the patient is receiving
);

CREATE TABLE Treatments (
    Treatment_ID INT AUTO_INCREMENT PRIMARY KEY,  -- Unique identifier for each treatment
    Treatment_Name VARCHAR(50),                    -- Name of the treatment
    Description TEXT                               -- Detailed description of the treatment
);


CREATE TABLE Visits (
    Visit_ID INT AUTO_INCREMENT PRIMARY KEY,
    Patient_ID INT,
    Visit_Date DATE,
    Visit_Type VARCHAR(50),
    Blood_Pressure VARCHAR(10),
    Heart_Rate INT,
    Notes TEXT,
    FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID)
);

CREATE TABLE Adverse_Events (
    Event_ID INT AUTO_INCREMENT PRIMARY KEY,
    Patient_ID INT,
    Event_Date DATE,
    Event_Description TEXT,
    Severity VARCHAR(10),
    FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID)
);

Insert patient data

INSERT INTO Patients (Name, Age, Gender, Diagnosis, Enrollment_Date, Treatment_ID)
VALUES 
('Rajat', 45, 'M', 'Heart Disease', '2024-01-15', 101),
('Christina', 56, 'F', 'Diabetes', '2024-02-01', 102),
('Mary Grace', 65, 'F', 'Hypertension', '2024-03-01', 103);

Insert treatments in the Treatment table

INSERT INTO Treatments (Treatment_Name, Description) 
VALUES 
('Drug A', 'This drug is used to treat heart disease by improving blood flow.'),
('Drug B', 'A medication designed to help manage diabetes and regulate blood sugar levels.'),
('Drug C', 'Used to treat high blood pressure and prevent related complications.');

Insert patient visit data, tracking each visit.

INSERT INTO Visits (Patient_ID, Visit_Date, Visit_Type, Blood_Pressure, Heart_Rate, Notes)
VALUES 
(1, '2024-01-20', 'Follow-up', '120/80', 72, 'Patient showing signs of improvement'),
(2, '2024-02-05', 'Routine', '140/90', 80, 'Needs blood sugar monitoring'),
(3, '2024-03-10', 'Routine', '130/85', 76, 'Stable blood pressure.');

Inserting Data into the Adverse_Events Table

INSERT INTO Adverse_Events (Patient_ID, Event_Date, Event_Description, Severity)
VALUES 
(1, '2024-01-25', 'Mild headache', 'Mild'),
(2, '2024-02-10', 'Nausea and vomiting', 'Moderate'),
(3, '2024-03-15', 'Dizziness', 'Severe');
Query the data for analysis.
patients enrolled in the clinical trial:

SELECT * FROM Patients;

treatments assigned to each patient:

SELECT P.Name, T.Treatment_Name 
FROM Patients P
JOIN Treatments T ON P.Treatment_ID = T.Treatment_ID;

List of adverse events along with patient names:

SELECT P.Name, A.Event_Date, A.Event_Description, A.Severity 
FROM Adverse_Events A
JOIN Patients P ON A.Patient_ID = P.Patient_ID;

patient visit details:

SELECT P.Name, V.Visit_Date, V.Visit_Type, V.Blood_Pressure, V.Heart_Rate 
FROM Visits V
JOIN Patients P ON V.Patient_ID = P.Patient_ID;



