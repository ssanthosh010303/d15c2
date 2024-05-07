/*
 * Author: Sakthi Santhosh
 * Created on: 01/04/2024
 *
 * Day-15 Challenge-2: Database Schema for a Video Store
 */
CREATE TABLE category (
    category_id INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL
);

CREATE TABLE movie (
    movie_id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    format ENUM('VHS', 'VCD', 'DVD') NOT NULL,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES category(category_id)
);

CREATE TABLE member (
    member_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    phone VARCHAR(15) UNIQUE,
    favorite_category_id INT,
    credit_card_number VARBINARY(128) NOT NULL, -- Encrypted
    member_type ENUM('Golden', 'Bronze') NOT NULL,
    FOREIGN KEY (favorite_category_id) REFERENCES category(category_id)
);

CREATE TABLE dependent (
    dependent_id INT,
    member_id INT,
    name VARCHAR(255) NOT NULL,
    PRIMARY KEY (dependent_id, member_id),
    FOREIGN KEY (member_id) REFERENCES member(member_id)
);

CREATE TABLE rental (
    rental_id INT PRIMARY KEY,
    movie_id INT NOT NULL,
    member_id INT NOT NULL,
    dependent_id INT,
    rental_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (movie_id) REFERENCES movie(movie_id),
    FOREIGN KEY (member_id) REFERENCES member(member_id),
    FOREIGN KEY (dependent_id) REFERENCES dependent(dependent_id)
);
