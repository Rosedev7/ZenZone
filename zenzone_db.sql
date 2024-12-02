-- Create database
CREATE DATABASE zenzone_db;

USE zenzone_db;

-- Users Table
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL
);

-- Journal Entries Table
CREATE TABLE JournalEntries (
    entry_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    entry_date DATE NOT NULL,
    mood_rating INT CHECK(mood_rating BETWEEN 1 AND 5),
    journal_text TEXT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Professionals Table
CREATE TABLE Professionals (
    professional_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    specialty VARCHAR(100)
);

-- Appointments Table
CREATE TABLE Appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    professional_id INT NOT NULL,
    appointment_date DATE NOT NULL,
    status VARCHAR(50) DEFAULT 'Scheduled',
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (professional_id) REFERENCES Professionals(professional_id)
);

-- Resources Table
CREATE TABLE Resources (
    resource_id INT AUTO_INCREMENT PRIMARY KEY,
    category VARCHAR(50),
    title VARCHAR(150),
    url VARCHAR(255)
);
