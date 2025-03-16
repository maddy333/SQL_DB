# EXCELSIOR - Comic Book Database

## Overview
EXCELSIOR is a structured SQL database designed to manage comic book information efficiently. It includes tables for storing publisher details, comic book issues, release years, roles, and quality codes. This project is intended for comic book enthusiasts, researchers, or developers looking to build applications that require an organized comic book database.

## Features
- Stores comic book metadata (titles, issue numbers, publishers, release years)
- Supports role-based categorization
- Includes quality codes for classification
- Designed for easy querying and expansion

## Database Schema
### Tables
#### `Quality_Codes`
Stores symbolic and numeric codes representing the quality of comic books.
```
CREATE TABLE Quality_Codes (
  id INT NOT NULL AUTO_INCREMENT,
  symbolic_code VARCHAR(10) NOT NULL,
  numeric_code FLOAT NOT NULL,
  PRIMARY KEY (id)
);
```
#### `Publisher`
Stores information about publishers.
```
CREATE TABLE Publisher (
  ID INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  PRIMARY KEY (ID)
);
```
#### `Roles`
Defines roles within the comic book industry.
```
CREATE TABLE Roles (
  ID INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  PRIMARY KEY (ID)
);
```
#### `Years`
Stores the release year of comics.
```
CREATE TABLE Years (
  ID INT NOT NULL AUTO_INCREMENT,
  release_year INT NOT NULL,
  PRIMARY KEY (ID)
);
```
#### `Comics`
Holds the main comic book records.
```
CREATE TABLE Comics (
  ID INT NOT NULL AUTO_INCREMENT,
  title VARCHAR(255) NOT NULL,
  issue_number INT NOT NULL,
  publisher_id INT NOT NULL,
  year_published INT NOT NULL,
  PRIMARY KEY (ID),
  FOREIGN KEY (publisher_id) REFERENCES Publisher(ID),
  FOREIGN KEY (year_published) REFERENCES Years(ID)
);
```

## Installation
### Prerequisites
- MySQL or any compatible SQL database system
- SQL client for executing queries

### Setup
1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/excelsior.git
   ```
2. Navigate to the project directory:
   ```bash
   cd excelsior
   ```
3. Import the database schema:
   ```bash
   mysql -u your_user -p < EXCELSIOR.sql
   ```
4. Verify database creation:
   ```sql
   SHOW DATABASES;
   USE excelsior;
   SHOW TABLES;
   ```

## Usage
- Run queries to retrieve information about comics, publishers, and release years.
- Expand the schema with additional features as needed.
- Use this database as a foundation for a comic book cataloging application.

## Contribution Guidelines
- Fork the repository and create a new branch.
- Implement your changes and test them.
- Submit a pull request with a detailed explanation.

## License
This project is licensed under the MIT License. See `LICENSE` for details.

## Acknowledgments
Special thanks to the contributors and the comic book community for inspiration.

