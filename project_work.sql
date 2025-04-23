-- CREATE DATABASE Project_db;
USE Project_db;

-- User Table
CREATE TABLE User (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    age INT,
    gender VARCHAR(255)
);

-- StressAssessment Table
CREATE TABLE StressAssessment (
    assessment_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    date DATE NOT NULL,
    stress_level INT CHECK (stress_level BETWEEN 1 AND 10),
    notes TEXT,
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

-- MoodTracker Table
CREATE TABLE MoodTracker (
    mood_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    date DATE NOT NULL,
    mood VARCHAR(255),
    notes TEXT,
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

-- Reminder Table
CREATE TABLE Reminder (
    reminder_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    reminder_time DATETIME NOT NULL,
    description TEXT,
    FOREIGN KEY (user_id) REFERENCES User(user_id) 
);

-- Feedback Table
CREATE TABLE Feedback (
    feedback_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    message TEXT NOT NULL,
    date DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

-- EmergencyContact Table
CREATE TABLE EmergencyContact (
    contact_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    relationship VARCHAR(255),
    phone_number VARCHAR(255),
    email VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);
