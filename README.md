# IPL Database Management System (DBMS) Project

## Overview
The IPL-DBMS project is a comprehensive Database Management System designed to manage records related to the Indian Premier League (IPL). It provides users with a user-friendly interface to access various IPL-related data, including team information, player statistics, points tables for all seasons, and more. Administrators have additional privileges, allowing them to update player statistics, add new players, modify existing player details, and delete players from the database.

## Features
- **Team Information:** Users can view details about IPL teams, including their names, logos, home cities, and squad members.
- **Player Statistics:** Users can access comprehensive statistics for IPL players, including batting and bowling records, such as total runs, strike rates, wickets, economy rates, and more.
- **Points Tables:** Users can view points tables for all IPL seasons, providing insights into team standings and performance throughout each season.
- **Live Season Stats:** Real-time statistics for the current IPL season, including player performances, team rankings, and match results.
- **Admin Panel:** Administrators can log in to access privileged features, including:
  - Updating Bowling and Batting Statistics: Admins can update player statistics such as runs scored, wickets taken, strike rates, and economy rates.
  - Player Management: Admins can add new players to the database, edit existing player details, and delete players as needed.

## Technologies Used
- **Frontend**: HTML, CSS, JavaScript
- **Backend**: PHP
- **Database**: MySQL
- **Server Environment**: XAMPP (Apache, MySQL)

## Installation
1. **Clone the repository:**
   ```bash
   git clone https://github.com/Just-NK14/IPL-DBMS.git
   
2. **Install XAMPP:**
   - Download and install XAMPP from [https://www.apachefriends.org/index.html](https://www.apachefriends.org/index.html).

3. **Start the XAMPP server:**
   - Launch XAMPP control panel and start the Apache and MySQL services.

4. **Open phpMyAdmin:**
   - Open your web browser and go to [http://localhost/phpmyadmin](http://localhost/phpmyadmin).
   - Create a new database named `ipl`.
   - Import the `ipl.sql` file provided in the repository into the `ipl` database.

5. **Update localhost Configuration (if necessary):**
   - If your localhost setup uses a different username, password, or port, make sure to update the database connection configuration in the PHP files (`delete.php`, `add.php`, `edit.php`, `login.php`, `etc.`) accordingly.
   - The default database connection settings in the PHP files are:
     ```php
     $servername = "localhost:3307";
     $username = "root";
     $password = "";
     $database = "ipl";
     ```

6. **Move the project files:**
   - Move the cloned repository folder (`IPL-DBMS`) to the `htdocs` directory inside your XAMPP installation directory (e.g., `C:\xampp\htdocs`).

7. **Access the project:**
   - Open your web browser and go to [http://localhost/IPL-DBMS](http://localhost/IPL-DBMS) to access the project.

## Usage
- Once the project is set up and the database is imported, users can:
  - View information about IPL teams and their squads.
  - Access points tables for all seasons.
  - View statistics for the current season.
  - Administrators can log in to perform CRUD operations on bowling and batting statistics, as well as manage players (add, update, delete).

```

This README provides users with detailed instructions on setting up and using the IPL-DBMS project.
