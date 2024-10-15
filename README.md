**Clinical Trials Database Project**
**Overview**
This project is a SQL-based relational database designed to manage and analyze data from clinical trials. It includes tables for Patients, Treatments, Visits, and Adverse Events, providing a streamlined approach to organizing and querying clinical trial information. The goal is to create a comprehensive system that can track patient interactions, treatments administered, and any adverse events occurring during the trials.

**Purpose**
The primary purpose of this project is to build a database that simplifies tracking various aspects of clinical trials:

Patient visits and health outcomes
Treatment plans and assignment
Adverse events that occur during treatment
By organizing this data in a clear structure, it helps researchers and medical professionals assess treatment effectiveness, monitor patient progress, and quickly identify potential health risks.

**Features**
1. **Patient Management**
Store detailed patient records, including diagnosis, treatment plans, and enrollment dates.
Track demographics like age, gender, and medical conditions (e.g., heart disease, diabetes).
2. **Treatment Tracking**
Maintain a record of the treatments provided to each patient.
Ensure proper association of patients with the appropriate treatments, medications, or interventions.
3. **Visit Logs**
Record patient visits, including visit dates, types, blood pressure, heart rate, and clinical notes.
Facilitate easy monitoring of vital signs and symptoms over time.
4. **Adverse Event Reporting**
Capture details of adverse events such as headaches, dizziness, or nausea.
Categorize these events by severity (e.g., mild, moderate, severe) to aid in risk assessment.
## Database Schema
![clinical_trial_database_Project](https://github.com/user-attachments/assets/58f18da0-fe05-454e-881f-1a1f4766e9d7)
This schema represents the core structure of the clinical trials database, including tables for patients, treatments, visits, and adverse events.
**Queries for Analysis**
1. **List of patients enrolled in the clinical trial**:
   SELECT * FROM Patients;
2. **Treatments assigned to each patient**:
   SELECT P.Name, T.Treatment_Name 
   FROM Patients P
   JOIN Treatments T ON P.Treatment_ID = T.Treatment_ID;
3. **Patient visit details**:
   SELECT P.Name, V.Visit_Date, V.Visit_Type, V.Blood_Pressure, V.Heart_Rate 
   FROM Visits V
   JOIN Patients P ON V.Patient_ID = P.Patient_ID;
4. **List of adverse events along with patient names**:
   SELECT P.Name, A.Event_Date, A.Event_Description, A.Severity 
   FROM Adverse_Events A
   JOIN Patients P ON A.Patient_ID = P.Patient_ID;
**Outcomes**
**Effective Data Management**: The project successfully demonstrated the management of clinical trials data, enabling streamlined data entry and retrieval. The database organizes critical information about patients, treatments, and adverse events, making it easier to track and analyze clinical trials.

**Improved Analysis**: With the ability to query different aspects of the trial, researchers can now analyze patient outcomes, monitor the safety and effectiveness of treatments, and ensure that adverse events are quickly identified and addressed.

**Enhanced Accuracy**: The relational structure ensures that data integrity is maintained, with foreign key relationships ensuring proper linkage between patients, treatments, and visits. 
**Conclusion**
This Clinical Trials Database project provides a robust platform for managing data in clinical trials. By organizing and linking tables with patients, treatments, visits, and adverse events, the system enables efficient tracking and analysis of patient health and treatment outcomes. Such a database can be an invaluable tool for clinical researchers and healthcare professionals in the pursuit of better health outcomes and safer clinical trial practices.




