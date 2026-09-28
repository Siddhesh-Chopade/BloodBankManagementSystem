CREATE DATABASE IF NOT EXISTS blood_bank CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE blood_bank;

CREATE TABLE users (
 id INT AUTO_INCREMENT PRIMARY KEY,
 name VARCHAR(120) NOT NULL,
 email VARCHAR(180) NOT NULL UNIQUE,
 password_hash VARCHAR(255) NOT NULL,
 role ENUM('Admin','Donor','Hospital') NOT NULL,
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE admins (id INT AUTO_INCREMENT PRIMARY KEY, user_id INT NOT NULL, FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE);
CREATE TABLE donors (
 id INT AUTO_INCREMENT PRIMARY KEY, user_id INT NULL, name VARCHAR(120) NOT NULL, blood_group ENUM('A+','A-','B+','B-','AB+','AB-','O+','O-') NOT NULL,
 city VARCHAR(100), phone VARCHAR(30), email VARCHAR(180), eligible BOOLEAN DEFAULT TRUE, last_donation DATE NULL, donation_count INT DEFAULT 0,
 FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE SET NULL
);
CREATE TABLE hospitals (
 id INT AUTO_INCREMENT PRIMARY KEY, user_id INT NULL, name VARCHAR(160) NOT NULL, city VARCHAR(100), phone VARCHAR(30), email VARCHAR(180), status ENUM('Active','Inactive') DEFAULT 'Active',
 FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE SET NULL
);
CREATE TABLE blood_inventory (
 id INT AUTO_INCREMENT PRIMARY KEY, blood_group ENUM('A+','A-','B+','B-','AB+','AB-','O+','O-') NOT NULL UNIQUE, units INT NOT NULL DEFAULT 0, expiry_date DATE NULL, updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
CREATE TABLE donations (
 id INT AUTO_INCREMENT PRIMARY KEY, donor_id INT NOT NULL, blood_group VARCHAR(3) NOT NULL, units INT DEFAULT 1, donation_date DATE NOT NULL, status ENUM('Collected','Rejected') DEFAULT 'Collected',
 FOREIGN KEY(donor_id) REFERENCES donors(id) ON DELETE CASCADE
);
CREATE TABLE blood_requests (
 id INT AUTO_INCREMENT PRIMARY KEY, hospital_id INT NOT NULL, patient_name VARCHAR(120) NOT NULL, blood_group VARCHAR(3) NOT NULL, units INT NOT NULL, urgency ENUM('Normal','Urgent','Emergency') DEFAULT 'Normal',
 status ENUM('Pending','Approved','Rejected','Fulfilled') DEFAULT 'Pending', requested_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY(hospital_id) REFERENCES hospitals(id) ON DELETE CASCADE
);
CREATE TABLE appointments (
 id INT AUTO_INCREMENT PRIMARY KEY, donor_id INT NOT NULL, appointment_date DATE NOT NULL, appointment_time TIME NOT NULL, location VARCHAR(180) NOT NULL, status ENUM('Scheduled','Completed','Cancelled') DEFAULT 'Scheduled',
 FOREIGN KEY(donor_id) REFERENCES donors(id) ON DELETE CASCADE
);
CREATE TABLE notifications (
 id INT AUTO_INCREMENT PRIMARY KEY, user_id INT NULL, type VARCHAR(50) NOT NULL, message TEXT NOT NULL, is_read BOOLEAN DEFAULT FALSE, created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE
);
CREATE TABLE blood_camps (
 id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(180) NOT NULL, camp_date DATE NOT NULL, city VARCHAR(100), venue VARCHAR(180), total_slots INT DEFAULT 0, registered_slots INT DEFAULT 0, status ENUM('Open','Closed','Completed') DEFAULT 'Open'
);
CREATE TABLE reports (
 id INT AUTO_INCREMENT PRIMARY KEY, report_type VARCHAR(80) NOT NULL, file_path VARCHAR(255), generated_by INT NULL, generated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY(generated_by) REFERENCES users(id) ON DELETE SET NULL
);

INSERT INTO blood_inventory (blood_group,units,expiry_date) VALUES
('A+',32,'2026-10-12'),('A-',9,'2026-10-04'),('B+',27,'2026-10-20'),('B-',7,'2026-10-02'),
('AB+',14,'2026-10-18'),('AB-',4,'2026-10-01'),('O+',58,'2026-11-02'),('O-',6,'2026-10-08');
