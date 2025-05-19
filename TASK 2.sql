-- Create temporary table to insert data
CREATE TEMP TABLE RandomCampers AS
SELECT
    g.i AS CamperID,
    -- Random gender: 65% Female (F), 35% Male (M)
    CASE
        WHEN RANDOM() < 0.65 THEN 'F'
        ELSE 'M'
    END AS Gender,
    -- Random age distribution with weighted logic
    CASE
        WHEN RANDOM() < 0.18 THEN FLOOR(RANDOM() * 6 + 7)    -- 7-12
        WHEN RANDOM() < 0.45 THEN FLOOR(RANDOM() * 2 + 13)   -- 13-14
        WHEN RANDOM() < 0.65 THEN FLOOR(RANDOM() * 3 + 15)   -- 15-17
        ELSE FLOOR(RANDOM() * 2 + 18)                        -- 18-19
    END AS Age
FROM generate_series(1, 5000) g(i);

-- Convert age to DateOfBirth
-- For simplicity, assume current year is 2025
ALTER TABLE RandomCampers ADD COLUMN DateOfBirth DATE;
UPDATE RandomCampers
SET DateOfBirth = MAKE_DATE(2025 - Age, FLOOR(RANDOM() * 12 + 1), FLOOR(RANDOM() * 28 + 1));

-- Add random names and contact info (dummy)
ALTER TABLE RandomCampers ADD COLUMN FirstName TEXT;
ALTER TABLE RandomCampers ADD COLUMN LastName TEXT;
ALTER TABLE RandomCampers ADD COLUMN MiddleName TEXT;
ALTER TABLE RandomCampers ADD COLUMN Email TEXT;
ALTER TABLE RandomCampers ADD COLUMN PersonalPhone TEXT;

UPDATE RandomCampers
SET FirstName = 'Name' || CamperID,
    LastName = 'Last' || CamperID,
    MiddleName = 'M' || CamperID,
    Email = 'user' || CamperID || '@example.com',
    PersonalPhone = '900000000' || (CamperID % 10);

-- Finally insert into Campers table
INSERT INTO Campers (CamperID, FirstName, MiddleName, LastName, DateOfBirth, Gender, Email, PersonalPhone)
SELECT CamperID, FirstName, MiddleName, LastName, DateOfBirth, Gender, Email, PersonalPhone
FROM RandomCampers;
