# Property Price Analysis (MySQL + Power BI)

## Overview
This project analyzes property price trends in Sweden (2018–2023), using MySQL for analysis and Power BI for visualization.

## Files
- `dataset.sql` — CREATE and INSERT statements
- `queries.sql` — analysis queries
- `README.md` — project overview

## Tools
MySQL · Power BI · VS Code · Git & GitHub

## Author
Akshatha Baliga — Data Analyst


-- Step 1: Create the database
CREATE DATABASE IF NOT EXISTS property;

-- Step 2: Use the database
USE property;

--  Define your table
CREATE TABLE property (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255),
    country VARCHAR(100),
    location VARCHAR(255),
    building_construction_year INT,
    building_total_floors INT,
    apartment_floor INT,
    apartment_rooms INT,
    apartment_bedrooms INT,
    apartment_bathrooms INT,
    apartment_total_area FLOAT,
    apartment_living_area FLOAT,
    price_in_usd DECIMAL(15,2)
);

INSERT INTO property (
  title, country, location, building_construction_year,
  building_total_floors, apartment_floor, apartment_rooms,
  apartment_bedrooms, apartment_bathrooms, apartment_total_area,
  apartment_living_area, price_in_usd
) VALUES
('Modern Loft in Downtown', 'USA', 'New York, NY', 2015, 30, 12, 4, 2, 2, 1200.5, 950.0, 850000.00),
('Beachside Villa', 'Spain', 'Barcelona', 2010, 3, 1, 6, 4, 3, 2500.0, 2100.0, 1250000.00),
('Luxury Condo', 'Canada', 'Toronto, ON', 2018, 20, 15, 5, 3, 2, 1600.0, 1400.0, 950000.00),
('Penthouse Suite', 'UAE', 'Dubai Marina', 2020, 50, 50, 7, 5, 4, 3500.0, 3000.0, 2750000.00),
('Historic Flat', 'UK', 'London', 1900, 5, 2, 3, 2, 1, 900.0, 800.0, 650000.00),
('City Apartment', 'Germany', 'Berlin', 2005, 10, 6, 3, 2, 1, 1100.0, 950.0, 720000.00),
('Suburban Home', 'Australia', 'Sydney', 2012, 2, 1, 5, 3, 2, 2000.0, 1800.0, 980000.00),
('Mountain Retreat', 'Switzerland', 'Zermatt', 2008, 4, 2, 6, 4, 3, 2400.0, 2200.0, 1350000.00),
('Eco-Friendly Studio', 'Netherlands', 'Amsterdam', 2019, 6, 3, 2, 1, 1, 800.0, 700.0, 560000.00),
('Urban Flat', 'France', 'Paris', 2016, 8, 5, 3, 2, 2, 1000.0, 850.0, 780000.00),
('Modern Loft in Downtown', 'USA', 'New York, NY', 2015, 30, 12, 4, 2, 2, 1200.5, 950.0, 850000.00),
('Beachside Villa', 'Spain', 'Barcelona', 2010, 3, 1, 6, 4, 3, 2500.0, 2100.0, 1250000.00),
('Luxury Condo', 'Canada', 'Toronto, ON', 2018, 20, 15, 5, 3, 2, 1600.0, 1400.0, 950000.00),
('Penthouse Suite', 'UAE', 'Dubai Marina', 2020, 50, 50, 7, 5, 4, 3500.0, 3000.0, 2750000.00),
('Historic Flat', 'UK', 'London', 1900, 5, 2, 3, 2, 1, 900.0, 800.0, 650000.00),
('City Apartment', 'Germany', 'Berlin', 2005, 10, 6, 3, 2, 1, 1100.0, 950.0, 720000.00),
('Suburban Home', 'Australia', 'Sydney', 2012, 2, 1, 5, 3, 2, 2000.0, 1800.0, 980000.00),
('Mountain Retreat', 'Switzerland', 'Zermatt', 2008, 4, 2, 6, 4, 3, 2400.0, 2200.0, 1350000.00),
('Eco-Friendly Studio', 'Netherlands', 'Amsterdam', 2019, 6, 3, 2, 1, 1, 800.0, 700.0, 560000.00),
('Urban Flat', 'France', 'Paris', 2016, 8, 5, 3, 2, 2, 1000.0, 850.0, 780000.00),
('Seaside Apartment', 'Portugal', 'Lisbon', 2011, 6, 3, 4, 2, 2, 1300.0, 1100.0, 790000.00),
('Downtown Studio', 'USA', 'Chicago, IL', 2017, 12, 7, 2, 1, 1, 850.0, 750.0, 620000.00),
('Garden View Flat', 'Italy', 'Rome', 2009, 5, 2, 3, 2, 1, 950.0, 850.0, 680000.00),
('Skyline Condo', 'Singapore', 'Orchard Road', 2021, 40, 35, 5, 3, 2, 1700.0, 1500.0, 1450000.00),
('Countryside Cottage', 'Ireland', 'Galway', 2000, 2, 1, 6, 4, 2, 2200.0, 2000.0, 890000.00),
('Lakefront Property', 'USA', 'Minneapolis, MN', 2013, 3, 1, 5, 3, 2, 2100.0, 1900.0, 920000.00),
('City Center Apartment', 'Japan', 'Tokyo', 2019, 20, 10, 3, 2, 1, 1000.0, 850.0, 870000.00),
('Modern Duplex', 'Brazil', 'São Paulo', 2016, 10, 5, 6, 4, 3, 2400.0, 2200.0, 980000.00),
('Riverside Flat', 'Germany', 'Frankfurt', 2014, 8, 4, 4, 2, 2, 1200.0, 1050.0, 760000.00),
('Hilltop Villa', 'Greece', 'Athens', 2007, 2, 1, 7, 5, 4, 3000.0, 2700.0, 1580000.00),
('Canal View Studio', 'Netherlands', 'Rotterdam', 2018, 6, 3, 2, 1, 1, 750.0, 650.0, 540000.00),
('City Loft', 'Germany', 'Munich', 2012, 10, 5, 3, 2, 1, 950.0, 850.0, 710000.00),
('Luxury Penthouse', 'UAE', 'Abu Dhabi', 2021, 45, 45, 6, 4, 3, 3200.0, 2900.0, 2650000.00),
('Suburban Duplex', 'Canada', 'Vancouver, BC', 2007, 2, 1, 5, 3, 2, 2100.0, 1900.0, 880000.00),
(Modern Loft in Downtown', 'USA', 'New York, NY', 2015, 30, 12, 4, 2, 2, 1200.5, 950.0, 850000.00),
('Beachside Villa', 'Spain', 'Barcelona', 2010, 3, 1, 6, 4, 3, 2500.0, 2100.0, 1250000.00),
('Luxury Condo', 'Canada', 'Toronto, ON', 2018, 20, 15, 5, 3, 2, 1600.0, 1400.0, 950000.00),
('Penthouse Suite', 'UAE', 'Dubai Marina', 2020, 50, 50, 7, 5, 4, 3500.0, 3000.0, 2750000.00),
('Historic Flat', 'UK', 'London', 1900, 5, 2, 3, 2, 1, 900.0, 800.0, 650000.00),
('City Apartment', 'Germany', 'Berlin', 2005, 10, 6, 3, 2, 1, 1100.0, 950.0, 720000.00),
('Suburban Home', 'Australia', 'Sydney', 2012, 2, 1, 5, 3, 2, 2000.0, 1800.0, 980000.00),
('Mountain Retreat', 'Switzerland', 'Zermatt', 2008, 4, 2, 6, 4, 3, 2400.0, 2200.0, 1350000.00),
('Eco-Friendly Studio', 'Netherlands', 'Amsterdam', 2019, 6, 3, 2, 1, 1, 800.0, 700.0, 560000.00),
('Urban Flat', 'France', 'Paris', 2016, 8, 5, 3, 2, 2, 1000.0, 850.0, 780000.00),
('Terrace Apartment', 'USA', 'Los Angeles, CA', 2014, 15, 8, 4, 2, 2, 1250.0, 1100.0, 890000.00),
('Canal View Studio', 'Netherlands', 'Rotterdam', 2018, 6, 3, 2, 1, 1, 750.0, 650.0, 540000.00),
('City Loft', 'Germany', 'Munich', 2012, 10, 5, 3, 2, 1, 950.0, 850.0, 710000.00),
('Luxury Penthouse', 'UAE', 'Abu Dhabi', 2021, 45, 45, 6, 4, 3, 3200.0, 2900.0, 2650000.00),
('Suburban Duplex', 'Canada', 'Vancouver, BC', 2007, 2, 1, 5, 3, 2, 2100.0, 1900.0, 880000.00),
('City View Condo', 'USA', 'San Francisco, CA', 2016, 25, 20, 5, 3, 2, 1600.0, 1400.0, 970000.00),
('Garden Flat', 'UK', 'Manchester', 2003, 4, 2, 3, 2, 1, 1000.0, 900.0, 640000.00),
('Lake House', 'Sweden', 'Stockholm', 2010, 2, 1, 6, 4, 3, 2300.0, 2100.0, 1100000.00),
('Skyline Studio', 'Singapore', 'Marina Bay', 2022, 50, 48, 2, 1, 1, 850.0, 750.0, 680000.00),
('Historic Townhouse', 'France', 'Lyon', 1995, 3, 1, 5, 3, 2, 1900.0, 1700.0, 820000.00),
('Oceanfront Condo', 'USA', 'Miami, FL', 2015, 20, 18, 5, 3, 2, 1800.0, 1600.0, 1150000.00),
('City Studio', 'Japan', 'Osaka', 2019, 12, 6, 2, 1, 1, 700.0, 600.0, 580000.00),
('Mountain View Apartment', 'Chile', 'Santiago', 2011, 8, 4, 4, 2, 2, 1300.0, 1150.0, 720000.00),
('Luxury Flat', 'Italy', 'Florence', 2016, 6, 3, 3, 2, 2, 1100.0, 950.0, 690000.00),
('Suburban Villa', 'India', 'Bangalore', 2010, 2, 1, 6, 4, 3, 2200.0, 2000.0, 850000.00),
('City Center Loft', 'Germany', 'Hamburg', 2013, 10, 5, 3, 2, 1, 950.0, 850.0, 710000.00),
('Lakeview Studio', 'Austria', 'Vienna', 2018, 5, 2, 2, 1, 1, 800.0, 700.0, 600000.00),
('Historic Apartment', 'UK', 'Edinburgh', 2005, 4, 2, 3, 2, 1, 1000.0, 900.0, 670000.00),
('Modern Duplex', 'Brazil', 'Rio de Janeiro', 2020, 6, 3, 5, 3, 2, 1600.0, 1400.0, 880000.00),
('Penthouse View', 'USA', 'Seattle, WA', 2022, 30, 30, 6, 4, 3, 2500.0, 2300.0, 1450000.00),
('City View Apartment', 'USA', 'Denver, CO', 2014, 18, 10, 4, 2, 2, 1300.0, 1150.0, 820000.00),
('Canal Side Loft', 'Belgium', 'Bruges', 2011, 4, 2, 3, 2, 1, 950.0, 850.0, 670000.00),
('Luxury Townhouse', 'UK', 'Bristol', 2008, 3, 1, 6, 4, 3, 2100.0, 1900.0, 980000.00),
('Skyline Penthouse', 'UAE', 'Dubai Downtown', 2022, 60, 60, 7, 5, 4, 3600.0, 3300.0, 2850000.00),
('Suburban Flat', 'Germany', 'Cologne', 2010, 6, 3, 3, 2, 1, 1000.0, 900.0, 710000.00),
('Lakeview Condo', 'Canada', 'Ottawa, ON', 2015, 12, 6, 4, 2, 2, 1400.0, 1250.0, 850000.00),
('Historic Studio', 'France', 'Nice', 2003, 5, 2, 2, 1, 1, 800.0, 700.0, 590000.00),
('Modern Apartment', 'Australia', 'Melbourne', 2018, 10, 5, 3, 2, 2, 1100.0, 950.0, 760000.00),
('Garden View Loft', 'Italy', 'Naples', 2009, 4, 2, 3, 2, 1, 950.0, 850.0, 680000.00),
('City Center Condo', 'USA', 'Boston, MA', 2016, 20, 15, 5, 3, 2, 1600.0, 1400.0, 940000.00),
('City View Apartment', 'USA', 'Denver, CO', 2014, 18, 10, 4, 2, 2, 1300.0, 1150.0, 820000.00),
('Canal Side Loft', 'Belgium', 'Bruges', 2011, 4, 2, 3, 2, 1, 950.0, 850.0, 670000.00),
('Luxury Townhouse', 'UK', 'Bristol', 2008, 3, 1, 6, 4, 3, 2100.0, 1900.0, 980000.00),
('Skyline Penthouse', 'UAE', 'Dubai Downtown', 2022, 60, 60, 7, 5, 4, 3600.0, 3300.0, 2850000.00),
('Suburban Flat', 'Germany', 'Cologne', 2010, 6, 3, 3, 2, 1, 1000.0, 900.0, 710000.00),
('Lakeview Condo', 'Canada', 'Ottawa, ON', 2015, 12, 6, 4, 2, 2, 1400.0, 1250.0, 850000.00),
('Historic Studio', 'France', 'Nice', 2003, 5, 2, 2, 1, 1, 800.0, 700.0, 590000.00),
('Modern Apartment', 'Australia', 'Melbourne', 2018, 10, 5, 3, 2, 2, 1100.0, 950.0, 760000.00),
('Garden View Loft', 'Italy', 'Naples', 2009, 4, 2, 3, 2, 1, 950.0, 850.0, 680000.00),
('City Center Condo', 'USA', 'Boston, MA', 2016, 20, 15, 5, 3, 2, 1600.0, 1400.0, 940000.00),
('Ocean Breeze Apartment', 'Portugal', 'Porto', 2012, 5, 3, 4, 2, 2, 1300.0, 1150.0, 790000.00),
('City Studio', 'USA', 'Austin, TX', 2017, 10, 6, 2, 1, 1, 850.0, 750.0, 620000.00),
('Garden View Flat', 'Italy', 'Venice', 2009, 4, 2, 3, 2, 1, 950.0, 850.0, 680000.00),
('Skyline Condo', 'Singapore', 'Orchard Road', 2021, 40, 35, 5, 3, 2, 1700.0, 1500.0, 1450000.00),
('Countryside Cottage', 'Ireland', 'Cork', 2000, 2, 1, 6, 4, 2, 2200.0, 2000.0, 890000.00),
('Lakefront Property', 'USA', 'Madison, WI', 2013, 3, 1, 5, 3, 2, 2100.0, 1900.0, 920000.00),
('City Center Apartment', 'Japan', 'Kyoto', 2019, 20, 10, 3, 2, 1, 1000.0, 850.0, 870000.00),
('Modern Duplex', 'Brazil', 'Brasília', 2016, 10, 5, 6, 4, 3, 2400.0, 2200.0, 980000.00),
('Riverside Flat', 'Germany', 'Stuttgart', 2014, 8, 4, 4, 2, 2, 1200.0, 1050.0, 760000.00),
('Hilltop Villa', 'Greece', 'Thessaloniki', 2007, 2, 1, 7, 5, 4, 3000.0, 2700.0, 1580000.00);,
('City Loft', 'USA', 'Phoenix, AZ', 2015, 12, 6, 3, 2, 1, 950.0, 850.0, 710000.00),
('Canal View Apartment', 'Netherlands', 'Utrecht', 2018, 5, 3, 3, 2, 2, 1100.0, 950.0, 690000.00),
('Luxury Condo', 'Canada', 'Calgary, AB', 2016, 15, 10, 5, 3, 2, 1600.0, 1400.0, 920000.00),
('Historic Flat', 'UK', 'Liverpool', 2002, 4, 2, 3, 2, 1, 1000.0, 900.0, 640000.00),
('Mountain Retreat', 'Switzerland', 'Lucerne', 2010, 3, 1, 6, 4, 3, 2400.0, 2200.0, 1320000.00),
('Eco-Friendly Studio', 'Germany', 'Leipzig', 2019, 6, 3, 2, 1, 1, 800.0, 700.0, 560000.00),
('Urban Flat', 'France', 'Marseille', 2016, 8, 5, 3, 2, 2, 1000.0, 850.0, 780000.00),
('Seaside Apartment', 'Portugal', 'Faro', 2011, 6, 3, 4, 2, 2, 1300.0, 1100.0, 790000.00),
('Downtown Studio', 'USA', 'Portland, OR', 2017, 12, 7, 2, 1, 1, 850.0, 750.0, 620000.00),
('Skyline Penthouse', 'Singapore', 'Sentosa', 2022, 50, 50, 7, 5, 4, 3500.0, 3200.0, 2750000.00),
('City Loft', 'USA', 'Phoenix, AZ', 2015, 12, 6, 3, 2, 1, 950.0, 850.0, 710000.00),
('Canal View Apartment', 'Netherlands', 'Utrecht', 2018, 5, 3, 3, 2, 2, 1100.0, 950.0, 690000.00),
('Luxury Condo', 'Canada', 'Calgary, AB', 2016, 15, 10, 5, 3, 2, 1600.0, 1400.0, 920000.00),
('Historic Flat', 'UK', 'Liverpool', 2002, 4, 2, 3, 2, 1, 1000.0, 900.0, 640000.00),
('Mountain Retreat', 'Switzerland', 'Lucerne', 2010, 3, 1, 6, 4, 3, 2400.0, 2200.0, 1320000.00),
('Eco-Friendly Studio', 'Germany', 'Leipzig', 2019, 6, 3, 2, 1, 1, 800.0, 700.0, 560000.00),
('Urban Flat', 'France', 'Marseille', 2016, 8, 5, 3, 2, 2, 1000.0, 850.0, 780000.00),
('Seaside Apartment', 'Portugal', 'Faro', 2011, 6, 3, 4, 2, 2, 1300.0, 1100.0, 790000.00),
('Downtown Studio', 'USA', 'Portland, OR', 2017, 12, 7, 2, 1, 1, 850.0, 750.0, 620000.00),
('Skyline Penthouse', 'Singapore', 'Sentosa', 2022, 50, 50, 7, 5, 4, 3500.0, 3200.0, 2750000.00);
('City Loft', 'USA', 'San Diego, CA', 2016, 14, 7, 3, 2, 1, 950.0, 850.0, 720000.00),
('Canal View Apartment', 'Netherlands', 'The Hague', 2019, 5, 3, 3, 2, 2, 1100.0, 950.0, 700000.00),
('Luxury Condo', 'Canada', 'Edmonton, AB', 2017, 16, 11, 5, 3, 2, 1600.0, 1400.0, 930000.00),
('Historic Flat', 'UK', 'Leeds', 2004, 4, 2, 3, 2, 1, 1000.0, 900.0, 650000.00),
('Mountain Retreat', 'Switzerland', 'Interlaken', 2011, 3, 1, 6, 4, 3, 2400.0, 2200.0, 1340000.00),
('Eco-Friendly Studio', 'Germany', 'Dresden', 2020, 6, 3, 2, 1, 1, 800.0, 700.0, 570000.00),
('Urban Flat', 'France', 'Toulouse', 2017, 8, 5, 3, 2, 2, 1000.0, 850.0, 790000.00),
('Seaside Apartment', 'Portugal', 'Albufeira', 2012, 6, 3, 4, 2, 2, 1300.0, 1100.0, 800000.00),
('Downtown Studio', 'USA', 'Charlotte, NC', 2018, 12, 7, 2, 1, 1, 850.0, 750.0, 630000.00),
('Skyline Penthouse', 'Singapore', 'Bukit Timah', 2023, 50, 50, 7, 5, 4, 3500.0, 3200.0, 2780000.00),
('City Loft', 'USA', 'Salt Lake City, UT', 2016, 14, 7, 3, 2, 1, 950.0, 850.0, 725000.00),
('Canal View Apartment', 'Netherlands', 'Groningen', 2019, 5, 3, 3, 2, 2, 1100.0, 950.0, 705000.00),
('Luxury Condo', 'Canada', 'Halifax, NS', 2017, 16, 11, 5, 3, 2, 1600.0, 1400.0, 935000.00),
('Historic Flat', 'UK', 'Sheffield', 2004, 4, 2, 3, 2, 1, 1000.0, 900.0, 655000.00),
('Mountain Retreat', 'Switzerland', 'St. Moritz', 2011, 3, 1, 6, 4, 3, 2400.0, 2200.0, 1360000.00),
('Eco-Friendly Studio', 'Germany', 'Nuremberg', 2020, 6, 3, 2, 1, 1, 800.0, 700.0, 575000.00),
('Urban Flat', 'France', 'Strasbourg', 2017, 8, 5, 3, 2, 2, 1000.0, 850.0, 795000.00),
('Seaside Apartment', 'Portugal', 'Setúbal', 2012, 6, 3, 4, 2, 2, 1300.0, 1100.0, 805000.00),
('Downtown Studio', 'USA', 'Columbus, OH', 2018, 12, 7, 2, 1, 1, 850.0, 750.0, 635000.00),
('Skyline Penthouse', 'Singapore', 'Tanglin', 2023, 50, 50, 7, 5, 4, 3500.0, 3200.0, 2800000.00),
('City Loft', 'USA', 'Tampa, FL', 2016, 14, 7, 3, 2, 1, 950.0, 850.0, 730000.00),
('Canal View Apartment', 'Netherlands', 'Maastricht', 2019, 5, 3, 3, 2, 2, 1100.0, 950.0, 710000.00),
('Luxury Condo', 'Canada', 'Winnipeg, MB', 2017, 16, 11, 5, 3, 2, 1600.0, 1400.0, 940000.00),
('Historic Flat', 'UK', 'Nottingham', 2004, 4, 2, 3, 2, 1, 1000.0, 900.0, 660000.00),
('Mountain Retreat', 'Switzerland', 'Davos', 2011, 3, 1, 6, 4, 3, 2400.0, 2200.0, 1380000.00),
('Eco-Friendly Studio', 'Germany', 'Bonn', 2020, 6, 3, 2, 1, 1, 800.0, 700.0, 580000.00),
('Urban Flat', 'France', 'Bordeaux', 2017, 8, 5, 3, 2, 2, 1000.0, 850.0, 800000.00),
('Seaside Apartment', 'Portugal', 'Cascais', 2012, 6, 3, 4, 2, 2, 1300.0, 1100.0, 810000.00),
('Downtown Studio', 'USA', 'Indianapolis, IN', 2018, 12, 7, 2, 1, 1, 850.0, 750.0, 640000.00),
('Skyline Penthouse', 'Singapore', 'Holland Village', 2023, 50, 50, 7, 5, 4, 3500.0, 3200.0, 2820000.00),
('City Loft', 'USA', 'Kansas City, MO', 2016, 14, 7, 3, 2, 1, 950.0, 850.0, 735000.00),
('Canal View Apartment', 'Netherlands', 'Tilburg', 2019, 5, 3, 3, 2, 2, 1100.0, 950.0, 715000.00),
('Luxury Condo', 'Canada', 'Regina, SK', 2017, 16, 11, 5, 3, 2, 1600.0, 1400.0, 945000.00),
('Historic Flat', 'UK', 'Coventry', 2004, 4, 2, 3, 2, 1, 1000.0, 900.0, 665000.00),
('Mountain Retreat', 'Switzerland', 'Saas-Fee', 2011, 3, 1, 6, 4, 3, 2400.0, 2200.0, 1400000.00),
('Eco-Friendly Studio', 'Germany', 'Heidelberg', 2020, 6, 3, 2, 1, 1, 800.0, 700.0, 585000.00),
('Urban Flat', 'France', 'Lille', 2017, 8, 5, 3, 2, 2, 1000.0, 850.0, 805000.00),
('Seaside Apartment', 'Portugal', 'Aveiro', 2012, 6, 3, 4, 2, 2, 1300.0, 1100.0, 815000.00),
('Downtown Studio', 'USA', 'Cleveland, OH', 2018, 12, 7, 2, 1, 1, 850.0, 750.0, 645000.00),
('Skyline Penthouse', 'Singapore', 'Novena', 2023, 50, 50, 7, 5, 4, 3500.0, 3200.0, 2840000.00)
('City Loft', 'USA', 'Cincinnati, OH', 2016, 14, 7, 3, 2, 1, 950.0, 850.0, 740000.00),
('Canal View Apartment', 'Netherlands', 'Arnhem', 2019, 5, 3, 3, 2, 2, 1100.0, 950.0, 720000.00),
('Luxury Condo', 'Canada', 'St. John\'s, NL', 2017, 16, 11, 5, 3, 2, 1600.0, 1400.0, 950000.00),
('Historic Flat', 'UK', 'Derby', 2004, 4, 2, 3, 2, 1, 1000.0, 900.0, 670000.00),
('Mountain Retreat', 'Switzerland', 'Andermatt', 2011, 3, 1, 6, 4, 3, 2400.0, 2200.0, 1420000.00),
('Eco-Friendly Studio', 'Germany', 'Freiburg', 2020, 6, 3, 2, 1, 1, 800.0, 700.0, 590000.00),
('Urban Flat', 'France', 'Grenoble', 2017, 8, 5, 3, 2, 2, 1000.0, 850.0, 810000.00),
('Seaside Apartment', 'Portugal', 'Viana do Castelo', 2012, 6, 3, 4, 2, 2, 1300.0, 1100.0, 820000.00),
('Downtown Studio', 'USA', 'Milwaukee, WI', 2018, 12, 7, 2, 1, 1, 850.0, 750.0, 650000.00),


SELECT * FROM property.property;

--- 1.List all properties located in Sweden 
SELECT * 
FROM property 
WHERE country = 'Sweden';

--- 2. Show titles and locations of properties built after 2020.
SELECT title, location 
FROM property 
WHERE building_construction_year > 2020;

--- 3.Find properties with exactly 2 bedrooms.
SELECT *
 FROM property 
 WHERE apartment_bedrooms = 2;

--- 4.Count how many properties are located in the USA.
SELECT COUNT(*) AS usa_property_count 
FROM property 
WHERE country = 'USA';

--- 5.List distinct countries represented in the dataset.
SELECT DISTINCT country 
FROM property;

--- 6.Show properties with more than 2 bathrooms.
SELECT title, apartment_bathrooms 
FROM property 
WHERE apartment_bathrooms > 2;

--- 7. Retrieve the top 5 most expensive properties.
SELECT title, price_in_usd 
FROM property 
ORDER BY price_in_usd DESC 
LIMIT 5;

--- 8.Calculate the average property price per country.
SELECT country, AVG(price_in_usd) AS avg_price 
FROM property 
GROUP BY country;

--- 9.List properties with more than 3 rooms and located in Canada.
SELECT * 
FROM property 
WHERE apartment_rooms > 3 AND country = 'Canada';

 --- 10. Find properties built in 2023 with total area greater than 100 sqm.
SELECT title, apartment_total_area 
FROM property 
WHERE building_construction_year = 2023 AND apartment_total_area > 100;

--- 11. Display properties where location starts with 'S'.
SELECT title, location 
FROM property 
WHERE location LIKE 'S%';

 --- 12. Find the property with the highest price per square meter ( apartment_total_area /price_in_usd ).
SELECT title,  apartment_total_area /price_in_usd  AS price_per_sqm 
FROM property 
ORDER BY price_per_sqm DESC 
LIMIT 1;

--- 13. Rank properties by price within each country.
SELECT title, country, price_in_usd,
RANK() OVER (PARTITION BY country ORDER BY price_in_usd DESC) AS country_rank
FROM property;

--- 14. Find properties where the ratio of total area to living area is above 1.5.
SELECT title, apartment_total_area, apartment_living_area, 
 apartment_total_area / apartment_living_area AS area_ratio 
FROM property 
WHERE apartment_total_area / apartment_living_area > 1.5;

--- 15. Rank properties by price within each country.
SELECT title, country, price_in_usd,
RANK() OVER (PARTITION BY country ORDER BY price_in_usd DESC) AS country_rank
FROM property;

-- 16. Find properties where the ratio of total area to living area is above 1.0.
SELECT title, apartment_total_area, apartment_living_area, 
 apartment_total_area / apartment_living_area AS area_ratio 
FROM property
WHERE apartment_total_area / apartment_living_area > 1.0;

-- 17. Rank properties by price within each location:
SELECT 
  id, location, price_in_usd,
  RANK() OVER (PARTITION BY location ORDER BY price_in_usd DESC) AS price_rank
FROM property;

 -- 18. Row number for properties in 'Stockholm County' by construction year:
SELECT 
  id, location, building_construction_year,
  ROW_NUMBER() OVER (ORDER BY building_construction_year) AS row_num
FROM property
WHERE location LIKE '%Stockholm County%';


-- 19.Calculate average total and living area for each number of bedrooms.
SELECT apartment_bedrooms, AVG(apartment_total_area) AS avg_total_area, AVG(apartment_living_area) AS avg_living_area 
FROM property 
GROUP BY apartment_bedrooms;

-- 20. First property listed in each location by construction year:
SELECT 
id, location, building_construction_year,
FIRST_VALUE(title) OVER (PARTITION BY location ORDER BY building_construction_year ASC
ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) AS first_property
FROM property
order  by location;

-- 21.Last property listed in each location:
SELECT  id, location, building_construction_year,
LAST_VALUE(title) OVER (
PARTITION BY location 
ORDER BY building_construction_year DESC 
ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
  ) AS last_property
FROM property;


