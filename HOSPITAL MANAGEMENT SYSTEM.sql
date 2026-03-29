Create Database HOSPITALDB;
USE HOSPITALDB;
CREATE TABLE PATIENT(PatientID INT AUTO_INCREMENT PRIMARY KEY,
Name VARCHAR(100) NOT NULL,
DOB DATE NOT NULL,
Age INT NOT NULL,
Gender VARCHAR(50) NOT NULL,
Phone VARCHAR(50));
INSERT INTO patient(Name, DOB, Age, Gender, Phone)
VALUES
('JANE', '2000-09-09', 26, 'Female', 0798676879),
('JAMES', '2001-02-03', 25, 'Male', 07235426543),
('JOAN', '2002-03-18', 24, 'Female', 0725326544),
('Willis', '2004-12-12', 21, 'Male', 07127363665),
('Joy', '2004-10-12', 21, 'Female', 084672554378),
('Denis', '2002-03-04', 22, 'Male', 072736836826),
('Obed', '2003-04-23', 23, 'Male', 0725641167535);

USE HOSPITALDB;
CREATE TABLE DOCTOR (
DoctorID INT AUTO_INCREMENT PRIMARY KEY,
Name VARCHAR(100) NOT NULL,
Specialisation VARCHAR(50) NOT NULL,
Phone VARCHAR(20));
INSERT INTO DOCTOR(Name, SPecialisation, Phone)
VALUES
('DR. Maina', 'General Surgery',073937483),
('DR. Wanjiku', 'Neurology', 0726478268),
('DR, Otieno', 'Psychiatry', 07387483788),
('DR. Mutua', 'Pediatrics', 0734739758478),
('DR. Njeri', 'Dermatology', 0732443345154),
('DR. Kamau', 'Cardinology', 0753452452245),
('DR. Korir', 'Orthopedics', 0876357833622);

USE HOSPITALDB;
CREATE TABLE APPOINTMENT (
AppointmentID INT AUTO_INCREMENT PRIMARY KEY,
PatientID INT NOT NULL,
DoctorID INT NOT NULL,
Date DATE NOT NULL,
Time TIME NOT NULL);
INSERT INTO APPOINTMENT(PatientID, DoctorID, Date, Time)
VALUES
(1, 1, '2023-11-02', '09:00:01'),
(2, 3, '2023-11-03', '09:02:00'),
(3, 2, '2023-11-03', '09:02:02'),
(4, 4, '2023-11-04', '09:04:00'),
(5, 6, '2023-11-29', '10:23:32'),
(6, 7, '2023-11-30', '12:00:00'),
(7, 5, '2023-12-03', '01:00:26');

USE HOSPITALDB;
CREATE TABLE TREATMENT(
TreatmentID INT PRIMARY KEY,
AppointmentID INT NOT NULL,
Diagnosis VARCHAR(100) NOT NULL,
Prescription VARCHAR(100) NOT NULL);
INSERT INTO TREATMENT(TreatmentID, AppointmentID, Diagnosis, Prescription)
VALUES
(101, 1, 'Common Cold', 'Paracetamol & Rest'),
(102, 2, 'Seasonal Allergies', 'Antihistamines'),
(103, 3, 'Appendicitis', 'Pre-op Antibiotics'),
(104, 4, 'Eczema', 'Hydrocortisone Cream'),
(105, 5, 'Migraine', 'Sumatriptam'),
(106, 6, 'Anxiety', 'Therapy Referral'),
(107, 7, 'Fracture', 'Painkiller $ Cast');

USE HOSPITALDB;
CREATE TABLE PAYMENT(
PaymentID INT AUTO_INCREMENT PRIMARY KEY,
PatientID INT NOT NULL,
Amount INT NOT NULL,
PaymentStatus VARCHAR(100) NOT NULL);
INSERT INTO PAYMENT(PatientID, Amount, Paymentstatus)
VALUES
(1, 2500, 'PAID'),
(2, 1500, 'PENDING'),
(3, 5000, 'PAID'),
(4, 1200, 'PAID'),
(5, 3000, 'PENDING'),
(6, 4500, 'OVERDUE'),
(7, 2000, 'PAID');

SELECT * FROM DOCTOR
WHERE NAME = 'DR. Maina';
DELETE FROM DOCTOR
WHERE DoctorID = 1;

SELECT  COUNT(*) AS TotalPatients FROM patient;

SELECT GENDER, COUNT(*) AS TOTAL FROM PATIENT GROUP BY GENDER;

SELECT Patient.PatientID, Patient.NAME, Patient.Phone
FROM PATIENT
INNER JOIN APPOINTMENT
ON PATIENT.PatientID = APPOINTMENT.PatientID;