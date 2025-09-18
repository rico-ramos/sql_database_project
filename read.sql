-- read data from all clients
SELECT * FROM clients;

SELECT * FROM clients WHERE name like 'Joh%'

-- read the name, phone, and email of clients outside New York
SELECT c.name, c.phone, c.email FROM clients c
    JOIN address a on c.client_id = a.client_id;
WHERE a.city <> 'New York';

-- Read 5 most recent meetings
SELECT * FROM meetings
ORDER BY meeting_date DESC
LIMIT 5;

SELECT c.name, m.meeting_date, m.purose, l.location_name FROM meetings m
    JOIN clients c on m.client_id = c.client_id
    JOIN locations l on l.location_id = m.location_id;
WHERE l.location_name = 'New York';
