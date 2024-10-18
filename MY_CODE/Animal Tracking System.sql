CREATE DATABASE wildlife_tracking;
USE wildlife_tracking;

CREATE TABLE animals (
	animal_id INT AUTO_INCREMENT PRIMARY KEY,
    species VARCHAR(50),
    name VARCHAR(50),
    age INT,
    gender VARCHAR(10) CHECK (gender IN ("Male","Female"))
); 

CREATE TABLE tracking (
	tracking_id INT AUTO_INCREMENT PRIMARY KEY,
    animal_id INT,
    location VARCHAR(100),
    timestamp DATETIME,
    coordinates VARCHAR(50),
    FOREIGN KEY (animal_id) REFERENCES animals(animal_id)
);

CREATE TABLE parks (
	park_id INT AUTO_INCREMENT PRIMARY KEY,
    park_name VARCHAR(100) NOT NULL,
    country VARCHAR(50),
    area_sq_km DECIMAL(10,2)
);

CREATE TABLE sightings (
	sighting_id INT AUTO_INCREMENT PRIMARY KEY,
    animal_id INT,
    park_id INT,
    date DATE,
    observer_name VARCHAR(100),
    FOREIGN KEY (animal_id) REFERENCES animals(animal_id),
    FOREIGN KEY (park_id) REFERENCES parks(park_id) 
);

INSERT INTO animals (species, name, age, gender)
VALUES
('Lion','Simba',5,'Male'),
('Elephant','Tusker',10,'Male'),
('Giraffe','Twiga',8,'Female');

INSERT INTO parks (park_name, country, area_sq_km)
VALUES
('Serengeti','Tanzania',14763.00),
('Kruger','South Africa',19485.00),
('Queen Elizabeth Park','Uganda',1978.00);

INSERT INTO tracking (animal_id, location, timestamp, coordinates)
VALUES
(1,'Serengeti', '2024-10-15 10:16:06','1.2921 N, 36.8219 E'),
(2, 'Queen Elizabeth Park', '2024-10-16 14:20:00','0.1921 S, 29.8819 E'),
(3, 'Kruger','2024-10-17 09:30:00','-23.9884 S, 31.5547 E');


INSERT INTO sightings (animal_id, park_id, date, observer_name)
VALUES
(1,1,'2024-10-15', 'Paxton'),
(2,3,'2024-10-16','Jane Smith'),
(3,2,'2024-10-17','Moses Okello');


select a.name, a.species, t.location, t.timestamp
FROM animals a
JOIN tracking t ON a.animal_id = t.animal_id
WHERE t.location = 'Serengeti';

SELECT p.park_name, COUNT(s.sighting_id) AS num_sightings
FROM parks p
JOIN sightings s ON p.park_id = s.park_id
GROUP BY p.park_name;

SELECT a.name, t.location, t.timestamp
FROM animals a
JOIN tracking t ON a.animal_id = t.animal_id
WHERE a.name = 'Simba';