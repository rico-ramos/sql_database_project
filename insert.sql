CREATE DATABASE client_db;

USE client_db;

CREATE TABLE clients (
	client_id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	phone VARCHAR(20),
	email VARCHAR(50) NOT NULL,
	created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

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
	FOREIGN KEY (client_id) REFERENCES clients(client_id)
);

CREATE TABLE meetings (
	meeting_id INT AUTO_INCREMENT PRIMARY KEY, 
	client_id INT NOT NULL,
	meeting_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	purpose VARCHAR(250),
	location_id VARCHAR(100),
	FOREIGN KEY (client_id) REFERENCES clients(client_id),
	FOREIGN KEY (location_id) REFERENCES locations(location_id)
);

-- CREATE TABLE locations (
--     location_id VARCHAR(100) PRIMARY KEY,
--     location_name VARCHAR(100) NOT NULL,
--     address_line_1 VARCHAR(50),
--     address_line_2 VARCHAR(50),
--     city VARCHAR(30),
--     state VARCHAR(25),
--     zip VARCHAR(15),
--     country VARCHAR(25),
--     created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--     updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
-- );



-- Insert sample data into clients table
INSERT INTO clients (name, phone, email) VALUES
('John Doe', '123-456-7890', 'john@example.com'),
('Jane Smith', '987-654-3210', 'jane@examples.com'),
('Alice Johnson', '555-123-4567', 'alice.johnson@example.com');

-- Insert sample data into address table
INSERT INTO address (client_id, address_line_1, city, state, zip) VALUES 
(1, '123 Happy Place', 'Somewhereville', 'New York', '12345'),
(2, '2 Bee Glad', 'Metropolis', 'Indiana', '54321'),
(3, '925 Is The Way', 'Somecity', 'California', '67583');

-- Insert sample data into meetings table
INSERT INTO meetings (client_id, meeting_date, purpose, location_id) VALUES
(1, '2024-10-01 10:00:00', 'Project Kickoff', 'LOC001'),
(2, '2024-10-02 14: 00:00', 'Quarterly Review', 'LOC002'),
(3, '2024-10-03 09:30:00', 'Budget Planning', 'LOC003');    