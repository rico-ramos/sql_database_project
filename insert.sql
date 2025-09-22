CREATE DATABASE IF NOT EXISTS client_db;

USE client_db;


-- Store client data
CREATE TABLE clients (
	client_id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	phone VARCHAR(20),
	email VARCHAR(50) UNIQUE NOT NULL,
	created TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Store client address data
CREATE TABLE address (
	address_id INT AUTO_INCREMENT PRIMARY KEY,
	client_id INT NOT NULL,
	address_line_1 VARCHAR(50),
	address_line_2 VARCHAR(50),
	city VARCHAR(30),
	state VARCHAR(25),
	zip VARCHAR(15),
	country VARCHAR(25),
	created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Store meetings data
CREATE TABLE meetings (
	meeting_id INT AUTO_INCREMENT PRIMARY KEY, 
	client_id INT NOT NULL,
	meeting_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	duration INT,
	purpose VARCHAR(250),
	location_code VARCHAR(100),
	FOREIGN KEY (client_id) REFERENCES clients(client_id),
	FOREIGN KEY (location_code) REFERENCES locations(location_code)
);

-- Store locations data for meetings
CREATE TABLE locations (
     location_id INT AUTO_INCREMENT PRIMARY KEY,
     location_code VARCHAR(50) UNIQUE NOT NULL,
     location_name VARCHAR(100) NOT NULL,
     room_number VARCHAR(50),
     building VARCHAR(50),
     floor VARCHAR(10),
     created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
     updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
 );



-- Insert sample data into clients table
INSERT INTO clients (name, phone, email) VALUES
('John Doe', '123-456-7890', 'john@example.com'),
('Jane Smith', '987-654-3210', 'jane@examples.com'),
('Alice Johnson', '555-123-4567', 'alice.johnson@example.com'),
('Michael Brown', '444-222-1111', 'michael.brown@example.com'),
('Emily Davis', '333-888-7777', 'emily.davis@example.com'),
('Sarah Wilson', '222-333-4444', 'sarah.wilson@example.com');

-- Insert sample data into address table
INSERT INTO address (client_id, address_line_1, city, state, zip) VALUES 
(1, '123 Happy Place', 'Somewhereville', 'New York', '12345'),
(2, '2 Bee Glad', 'Metropolis', 'Indiana', '54321'),
(3, '925 Is The Way', 'Somecity', 'California', '67583'),
(4, '456 Oak Street', 'Springfield', 'Illinois', '62704'),
(5, '789 Pine Avenue', 'Riverdale', 'Oregon', '97035');


-- Insert sample data into meetings table
INSERT INTO meetings (client_id, meeting_date, purpose, location_code) VALUES
(1, '2024-10-01 10:00:00', 'Project Kickoff', 'LOC001'),
(2, '2024-10-02 14:00:00', 'Quarterly Review', 'LOC002'),
(3, '2024-10-03 09:30:00', 'Budget Planning', 'LOC003'),
(3, '2024-10-04 11:00:00', 'Design Workshop', 'LOC004'),
(5, '2024-10-05 15:00:00', 'Client Presentation', 'LOC005');


-- Insert sample data into locations table for architectural meetings
INSERT INTO locations (location_code, location_name, room_number, building, floor) VALUES
('LOC001', '1st Floor Conference Room', '101', 'Main Building', 1),
('LOC002', '3rd Floor Library', '305', 'Main Building', 3),
('LOC003', '2nd Floor Design Studio', '210', 'Main Building', 2),
('LOC004', '5th Floor Boardroom', '501', 'Main Building', 5),
('LOC005', 'Ground Floor Reception Meeting Area', 'G05', 'Main Building', 0),
('LOC006', '4th Floor Project War Room', '415', 'Main Building', 4),
('LOC007', '2nd Floor Breakout Lounge', '220', 'Main Building', 2),
('LOC008', 'Basement Materials Lab', 'B02', 'Main Building', -1);



-- Grant SELECT privilege on employees table to office_user
GRANT SELECT ON clients, meetings TO 'office_user'@'localhost';
GRANT SELECT ON meetings TO 'office_user'@'localhost';


-- Grant INSERT and UPDATE privilege on clients, meetings, and addresses to hr_manager
GRANT INSERT, UPDATE ON clients TO 'office_manager'@'localhost';
GRANT INSERT, UPDATE ON meetings TO 'office_manager'@'localhost';
GRANT INSERT, UPDATE ON address TO 'office_manager'@'localhost';


-- Revoke DELETE privilege from office_user
REVOKE DELETE ON clients FROM 'office_user'@'localhost';

-- Grant all privileges on multiple tables to office_admin
GRANT ALL PRIVILEGES ON clients, meetings, locations, address TO 'office_admin'@'localhost';