**Clinical Trials Database Project**
**Over view**
This project demonstrates the creation of a relational database for managing and analyzing clinical trial data. It includes tables for storing information about patients, treatments, visits, and adverse events. The database facilitates tracking patient visits, treatment plans, and any adverse events that occur during the trial.
**Purpose of the Project**
The purpose of this project is to create a structured database for clinical trials that allows easy access to patient information, treatment details, and trial outcomes. This project is useful for analyzing clinical trial data to gain insights on treatment efficacy, patient health outcomes, and adverse events.

## Database Schema
![clinical_trial_database_Project](https://github.com/user-attachments/assets/58f18da0-fe05-454e-881f-1a1f4766e9d7)
This schema represents the core structure of the clinical trials database, including tables for patients, treatments, visits, and adverse events.

## Detailed Explanation of the Database Structure

The database consists of several key tables:

### 1. Patients Table
- **Purpose**: To store information about each patient involved in the clinical trial.
- **Key Columns**:
  - `Patient_ID`: A unique identifier for each patient.
  - `Name`: The patient's name.
  - `Age`: The patient's age.
  - `Gender`: The patient's gender.
  - `Diagnosis`: The medical diagnosis of the patient.
  - `Enrollment_Date`: The date the patient was enrolled in the trial.
  - `Treatment_ID`: A reference to the treatment assigned to the patient.

![Patients Table Structure](images/patients_table_structure.png)

### 2. Treatments Table
- **Purpose**: To record the treatments being administered during the trial.
- **Key Columns**:
  - `Treatment_ID`: Unique identifier for each treatment.
  - `Treatment_Name`: The name of the treatment.
  - `Description`: A detailed description of the treatment.

![Treatments Table Structure](images/treatments_table_structure.png)

### 3. Visits Table
- **Purpose**: To log patient visits, including vital signs and notes.
- **Key Columns**:
  - `Visit_ID`: Unique identifier for each visit.
  - `Patient_ID`: Reference to the patient.
  - `Visit_Date`: The date of the visit.
  - `Visit_Type`: Type of visit (e.g., follow-up, routine).
  - `Blood_Pressure`: Blood pressure recorded during the visit.
  - `Heart_Rate`: Heart rate recorded during the visit.
  - `Notes`: Additional notes from the visit.

![Visits Table Structure](images/visits_table_structure.png)

### 4. Adverse Events Table
- **Purpose**: To record any adverse effects experienced by patients.
- **Key Columns**:
  - `Event_ID`: Unique identifier for each adverse event.
  - `Patient_ID`: Reference to the patient.
  - `Event_Date`: The date the event occurred.
  - `Event_Description`: Description of the event.
  - `Severity`: Severity level of the event (e.g., mild, moderate, severe).

![Adverse Events Table Structure](images/adverse_events_table_structure.png)
                  
                  




