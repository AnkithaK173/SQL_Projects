**Clinical Trials Database Project**
**Over view**
This project demonstrates the creation of a relational database for managing and analyzing clinical trial data. It includes tables for storing information about patients, treatments, visits, and adverse events. The database facilitates tracking patient visits, treatment plans, and any adverse events that occur during the trial.
**Purpose of the Project**
The purpose of this project is to create a structured database for clinical trials that allows easy access to patient information, treatment details, and trial outcomes. This project is useful for analyzing clinical trial data to gain insights on treatment efficacy, patient health outcomes, and adverse events.
**Database Schema**
The database consists of the following tables:

**Patients**: Stores patient information including their ID, name, age, gender, diagnosis, and enrollment date.
              Fields: Patient_ID, Name, Age, Gender, Diagnosis, Enrollment_Date, Treatment_ID
**Treatments**: Stores details about the treatments administered to patients.
                Fields: Treatment_ID, Treatment_Name, Description
**Visits**: Logs each patient’s visit to the clinic, including vital signs and any notes from the visit.
            Fields: Visit_ID, Patient_ID, Visit_Date, Visit_Type, Blood_Pressure, Heart_Rate, Notes
**Adverse Events**: Records adverse events experienced by patients during the trial.
                    Fields: Event_ID, Patient_ID, Event_Date, Event_Description, Severity
                  
                  




