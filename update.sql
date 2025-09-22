

ALTER TABLE address 
    ADD CONSTRAINT fk_client_address
        FOREIGN KEY (client_id) REFERENCES clients(client_id)
        ON UPDATE CASCADE ON DELETE SET NULL;

ALTER TABLE clients ADD COLUMN updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

ALTER TABLE address CHANGE COLUMN zip zip_code VARCHAR(15), 
    MODIFY COLUMN client_id INT NOT NULL;

ALTER TABLE address RENAME TO client_address;

ALTER TABLE meetings DROP COLUMN duration;

UPDATE clients SET phone = '111-222-3333' WHERE name = 'Alice Johnson';

UPDATE address SET city = 'Los Angeles', state = 'CA' 
    WHERE client_id = (SELECT client_id FROM clients WHERE name = 'Michael Brown');