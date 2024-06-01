-- Create hotels database if not exists -- Harsha Vardhan Bathala (hbathal)
CREATE DATABASE IF NOT EXISTS hotels;
USE hotels;

-- Create Property table -- Harsha Vardhan Bathala (hbathal)
CREATE TABLE Property (
    Property_id INT AUTO_INCREMENT PRIMARY KEY,
    Property_name VARCHAR(255) NOT NULL UNIQUE,
    Property_type VARCHAR(100) NOT NULL
);

-- Create Location table -- Harsha Vardhan Bathala (hbathal)
CREATE TABLE Location (
    Location_id INT AUTO_INCREMENT PRIMARY KEY,
    Address VARCHAR(255) NOT NULL,
    Area VARCHAR(100) NOT NULL,
    City VARCHAR(100) NOT NULL,
    State VARCHAR(100) NOT NULL,
    Property_id INT NOT NULL,
    UNIQUE KEY unique_location (Address, Area, City, State),
    FOREIGN KEY (Property_id) REFERENCES Property(Property_id)
);

-- Create Room table -- Harsha Vardhan Bathala (hbathal)
CREATE TABLE Room (
    Room_id INT AUTO_INCREMENT PRIMARY KEY,
    Room_type VARCHAR(100) NOT NULL,
    Room_count INT NOT NULL CHECK (Room_count > 0),
    Room_facilities TEXT NOT NULL,
    Property_id INT NOT NULL,
    UNIQUE KEY unique_room_type (Room_type, Property_id),
    FOREIGN KEY (Property_id) REFERENCES Property(Property_id)
);

-- Create Ratings table -- Harsha Vardhan Bathala (hbathal)
CREATE TABLE Ratings (
    Ratings_id INT AUTO_INCREMENT PRIMARY KEY,
    Site_review_rating FLOAT NOT NULL CHECK (Site_review_rating >= 1 AND Site_review_rating <=5),
    Site_review_count INT NOT NULL CHECK (Site_review_count >= 0),
    Property_id INT NOT NULL,
    FOREIGN KEY (Property_id) REFERENCES Property(Property_id)
);

-- Load data from CSV into the hotels table -- Krishna Suhurth Yalamanchili (kryala)
CREATE TABLE IF NOT EXISTS hotels (
    Address VARCHAR(255),
    Area VARCHAR(100),
    City VARCHAR(100),
    State VARCHAR(100),
    Room_type VARCHAR(100),
    Room_count INT,
    Room_facilities TEXT,
    Site_review_rating FLOAT,
    Site_review_count INT,
    Property_id INT PRIMARY KEY,
	Property_name VARCHAR(255),
    Property_type VARCHAR(100)
);

-- Load data from CSV into the hotels table -- Krishna Suhurth Yalamanchili (kryala)
LOAD DATA INFILE '/ProgramData/MySQL/MySQL Server 8.0/Uploads/ADT_final_spreadsheet.csv'
INTO TABLE hotels 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Insert data into Property table from hotels -- Krishna Suhurth Yalamanchili (kryala)
INSERT INTO Property (Property_name, Property_type)
SELECT DISTINCT Property_name, Property_type FROM hotels;

-- Display Property Table -- Krishna Suhurth Yalamanchili (kryala)
SELECT * FROM Property;

-- Insert data into Location table from hotels -- Krishna Suhurth Yalamanchili (kryala)
INSERT INTO Location (Address, Area, City, State, Property_id)
SELECT DISTINCT Address, Area, City, State, P.Property_id
FROM hotels T
JOIN Property P ON T.Property_name = P.Property_name;

-- Display Location Table -- Krishna Suhurth Yalamanchili (kryala)
SELECT * FROM Location;

-- Insert data into Room table from hotels -- Krishna Suhurth Yalamanchili (kryala)
INSERT INTO Room (Room_type, Room_count, Room_facilities, Property_id)
SELECT DISTINCT Room_type, Room_count, Room_facilities, P.Property_id
FROM hotels T
JOIN Property P ON T.Property_name = P.Property_name;

-- Display Room Table -- Krishna Suhurth Yalamanchili (kryala)
SELECT * FROM Room;

-- Insert data into Ratings table from hotels -- Krishna Suhurth Yalamanchili (kryala)
INSERT INTO Ratings (Site_review_rating, Site_review_count, Property_id)
SELECT DISTINCT Site_review_rating, Site_review_count, P.Property_id
FROM hotels T
JOIN Property P ON T.Property_name = P.Property_name;

-- Display Ratings Table -- Krishna Suhurth Yalamanchili (kryala)
SELECT * FROM Ratings;

-- Q: Build queries relevant to your application functionality design (what information will you display?)

-- Display all properties along with their locations: -- Vatsal Vinay Parikh (vatspari)
SELECT Property.Property_name, Location.Address, Location.Area, Location.City, Location.State
FROM Property
JOIN Location ON Property.Property_id = Location.Property_id;

-- Show available rooms for a specific property: -- Vatsal Vinay Parikh (vatspari)
SELECT Property.Property_name, Room.Room_type, Room.Room_count
FROM Property
JOIN Room ON Property.Property_id = Room.Property_id
WHERE Property.Property_name = 'Property_1';

-- List properties with their average ratings: -- Vatsal Vinay Parikh (vatspari)
SELECT Property.Property_name, AVG(Ratings.Site_review_rating) AS Avg_Rating
FROM Property
JOIN Ratings ON Property.Property_id = Ratings.Property_id
GROUP BY Property.Property_name;

-- Find properties with specific room amenities like Air Conditioning: -- Vatsal Vinay Parikh (vatspari)
SELECT DISTINCT Property.Property_name
FROM Property
JOIN Room ON Property.Property_id = Room.Property_id
WHERE Room.Room_facilities LIKE '%Air Conditioning%';

-- References: 
-- 1. https://www.w3schools.com/MySQL/default.asp
-- 2. https://stackoverflow.com/questions/59993844/error-loading-local-data-is-disabled-this-must-be-enabled-on-both-the-client
-- 3. https://www.oreilly.com/library/view/mysql-cookbook-4th/9781492093152/
-- 4. https://www.kaggle.com/code/residentmario/exploring-hotels-on-goibibo