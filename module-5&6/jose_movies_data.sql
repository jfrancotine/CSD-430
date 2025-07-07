-- Jose Franco
-- Create Movies Table jose_movies_data

CREATE DATABASE IF NOT EXISTS CSD430;
USE CSD430;

DROP TABLE IF EXISTS jose_movies_data;

CREATE TABLE jose_movies_data (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    director VARCHAR(100),
    year_released INT,
    genre VARCHAR(50),
    rating DOUBLE
);

INSERT INTO jose_movies_data (title, director, year_released, genre, rating) VALUES
('Inception', 'Christopher Nolan', 2010, 'Sci-Fi', 8.8),
('The Godfather', 'Francis Ford Coppola', 1972, 'Crime', 9.2),
('Interstellar', 'Christopher Nolan', 2014, 'Sci-Fi', 8.6),
('The Matrix', 'The Wachowskis', 1999, 'Sci-Fi', 8.7),
('Pulp Fiction', 'Quentin Tarantino', 1994, 'Crime', 8.9),
('The Shawshank Redemption', 'Frank Darabont', 1994, 'Drama', 9.3),
('Gladiator', 'Ridley Scott', 2000, 'Action', 8.5),
('Titanic', 'James Cameron', 1997, 'Romance', 7.9),
('Avatar', 'James Cameron', 2009, 'Fantasy', 7.8),
('The Dark Knight', 'Christopher Nolan', 2008, 'Action', 9.0);
