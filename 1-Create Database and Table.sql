-- Create Database
CREATE DATABASE Games;

-- Create Tables
USE Games;
CREATE TABLE VideoGames
(
    GameID INT PRIMARY KEY,
    Title VARCHAR(255),
    Developers VARCHAR(255),
    Genre VARCHAR(255),
    Release_Date VARCHAR(255),
    Platform VARCHAR(255)
);

CREATE TABLE Players
(
    PlayerID INT PRIMARY KEY,
    NickName VARCHAR(255),
    CountryID VARCHAR(255)
);

CREATE TABLE Purchase_Games
(
    PlayerID INT,
    GameID INT
);

CREATE TABLE Country
(
    CountryID VARCHAR(255) PRIMARY KEY,
    Country VARCHAR(255)
);

CREATE TABLE Price
(
    GameID INT,
    Price DECIMAL(10,2)
);