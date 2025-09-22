-- 1) Adjust column name first
ALTER TABLE address CHANGE COLUMN zip zip_code VARCHAR(15);

-- 2) Rename the table
ALTER TABLE address RENAME TO client_address;

-- 3) Add the foreign key (now pointing at client_address)
ALTER TABLE client_address 
    ADD CONSTRAINT fk_client_address
        FOREIGN KEY (client_id) REFERENCES clients(client_id)
        ON UPDATE CASCADE ON DELETE CASCADE;

-- 4) Alter clients to add an updated timestamp
ALTER TABLE clients 
    ADD COLUMN updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

-- 5) Drop unused column in meetings
ALTER TABLE meetings DROP COLUMN duration;

-- 6) Update data
UPDATE clients 
SET phone = '111-222-3333' 
WHERE name = 'Alice Johnson';

UPDATE client_address 
SET city = 'Los Angeles', state = 'CA' 
WHERE client_id = (SELECT client_id FROM clients WHERE name = 'Michael Brown');
