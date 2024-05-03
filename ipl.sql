-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: May 03, 2024 at 06:56 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ipl`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_positions` ()   BEGIN
    -- Update batstats table
    UPDATE `batstats` t1
    JOIN (
        SELECT
            Player,
            Team,
            Runs,
            SR,
            Avg,
            NO,
            DENSE_RANK() OVER (ORDER BY Runs DESC, SR DESC, Avg DESC, NO DESC, Team DESC) AS new_pos
        FROM `batstats`
    ) t2 ON t1.Player = t2.Player AND t1.Team = t2.Team
    SET t1.POS = t2.new_pos;

    -- Update bowlstats table
    UPDATE `bowlstats` t1
    JOIN (
        SELECT
            Player,
            Team,
            Wkts,
            Ecom,
            Ov,
            Runs,
            DENSE_RANK() OVER (ORDER BY Wkts DESC, Ecom ASC, Ov DESC, Runs ASC, Team DESC) AS new_pos
        FROM `bowlstats`
    ) t2 ON t1.Player = t2.Player AND t1.Team = t2.Team
    SET t1.POS = t2.new_pos;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `batstats`
--

CREATE TABLE `batstats` (
  `POS` int(3) DEFAULT NULL,
  `Player` varchar(30) DEFAULT NULL,
  `Team` varchar(4) DEFAULT NULL,
  `Mat` int(2) DEFAULT NULL,
  `Inns` int(2) DEFAULT NULL,
  `NO` int(2) DEFAULT NULL,
  `Runs` int(4) DEFAULT NULL,
  `HS` varchar(4) DEFAULT NULL,
  `Avg` decimal(6,2) DEFAULT NULL,
  `BF` int(4) DEFAULT NULL,
  `SR` decimal(5,2) DEFAULT NULL,
  `100` int(1) DEFAULT NULL,
  `50` int(1) DEFAULT NULL,
  `4s` int(3) DEFAULT NULL,
  `6s` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `batstats`
--

INSERT INTO `batstats` (`POS`, `Player`, `Team`, `Mat`, `Inns`, `NO`, `Runs`, `HS`, `Avg`, `BF`, `SR`, `100`, `50`, `4s`, `6s`) VALUES
(5, 'Riyan Parag', 'RR', 4, 4, 2, 185, '84*', 92.50, 117, 158.12, 0, 2, 14, 12),
(6, 'Sanju Samson', 'RR', 4, 4, 1, 178, '82*', 59.33, 118, 150.85, 0, 2, 17, 8),
(7, 'Heinrich Klaasen', 'SRH', 4, 4, 2, 177, '80*', 88.50, 87, 203.45, 0, 2, 6, 17),
(8, 'Shubman Gill', 'GT', 4, 4, 1, 164, '89*', 54.67, 103, 159.22, 0, 1, 11, 7),
(9, 'Abhishek Sharma', 'SRH', 4, 4, 0, 161, '63', 40.25, 74, 217.57, 0, 1, 12, 15),
(10, 'Sai Sudharsan', 'GT', 4, 4, 0, 160, '45', 40.00, 125, 128.00, 0, 0, 16, 2),
(11, 'Rishabh Pant', 'DC', 4, 4, 0, 152, '55', 38.00, 96, 158.33, 0, 2, 12, 9),
(12, 'Shivam Dube', 'CSK', 4, 4, 1, 148, '51', 49.33, 92, 160.87, 0, 1, 9, 10),
(13, 'David Warner', 'DC', 4, 4, 0, 148, '52', 37.00, 103, 143.69, 0, 1, 15, 9),
(14, 'Nicholas Pooran', 'LSG', 3, 3, 2, 146, '64*', 146.00, 83, 175.90, 0, 1, 8, 12),
(15, 'Quinton De Kock', 'LSG', 3, 3, 0, 139, '81', 46.33, 99, 140.40, 0, 2, 14, 7),
(16, 'Shikhar Dhawan', 'PBKS', 4, 4, 0, 138, '70', 34.50, 105, 131.43, 0, 1, 16, 4),
(17, 'Jos Buttler', 'RR', 4, 4, 1, 135, '100*', 45.00, 99, 136.36, 1, 0, 13, 4),
(3, 'Sunil Narine', 'KKR', 8, 8, 0, 357, '109', 44.63, 194, 184.02, 1, 2, 37, 24),
(18, 'Aiden Markram', 'SRH', 4, 4, 1, 127, '50', 42.33, 96, 132.29, 0, 1, 8, 2),
(19, 'Tilak Varma', 'MI', 3, 3, 0, 121, '64', 40.33, 82, 147.56, 0, 1, 3, 9),
(20, 'Ajinkya Rahane', 'CSK', 4, 4, 0, 119, '45', 29.75, 91, 130.77, 0, 0, 7, 5),
(21, 'Travis Head', 'SRH', 3, 3, 0, 112, '62', 37.33, 62, 180.65, 0, 1, 15, 4),
(22, 'Faf Du Plessis', 'RCB', 5, 5, 0, 109, '44', 21.80, 82, 132.93, 0, 0, 13, 3),
(23, 'Andre Russell', 'KKR', 3, 2, 1, 105, '64*', 105.00, 44, 238.64, 0, 1, 7, 10),
(24, 'Prabhsimran Singh', 'PBKS', 4, 4, 0, 105, '35', 26.25, 65, 161.54, 0, 0, 13, 5),
(25, 'Tristan Stubbs', 'DC', 4, 4, 1, 103, '54', 34.33, 65, 158.46, 0, 1, 6, 7),
(26, 'Phil Salt', 'KKR', 3, 3, 0, 102, '54', 34.00, 72, 141.67, 0, 1, 9, 5),
(27, 'Rachin Ravindra', 'CSK', 4, 4, 0, 97, '46', 24.25, 56, 173.21, 0, 0, 11, 6),
(28, 'K L Rahul', 'LSG', 3, 3, 0, 93, '58', 31.00, 67, 138.81, 0, 1, 5, 5),
(29, 'Daryl Mitchell', 'CSK', 4, 4, 1, 93, '34', 31.00, 75, 124.00, 0, 0, 4, 4),
(30, 'Shashank Singh', 'PBKS', 4, 4, 3, 91, '61*', 91.00, 45, 202.22, 0, 1, 8, 6),
(31, 'Sam Curran', 'PBKS', 4, 4, 0, 91, '63', 22.75, 73, 124.66, 0, 1, 9, 1),
(32, 'Dinesh Karthik', 'RCB', 5, 4, 2, 90, '38*', 45.00, 52, 173.08, 0, 0, 6, 7),
(1, 'Ruturaj Gaikwad', 'CSK', 10, 10, 2, 509, '108*', 63.63, 347, 146.69, 1, 4, 53, 15),
(33, 'Ravindra Jadeja', 'CSK', 4, 4, 3, 84, '31*', 84.00, 60, 140.00, 0, 0, 7, 1),
(34, 'Liam Livingstone', 'PBKS', 3, 3, 2, 83, '38*', 83.00, 51, 162.75, 0, 0, 5, 6),
(35, 'Jonny Bairstow', 'PBKS', 4, 4, 0, 81, '42', 20.25, 51, 158.82, 0, 0, 11, 3),
(36, 'David Miller', 'GT', 3, 3, 1, 77, '44*', 38.50, 54, 142.59, 0, 0, 8, 2),
(37, 'Wriddhiman Saha', 'GT', 4, 4, 0, 76, '25', 19.00, 58, 131.03, 0, 0, 11, 2),
(38, 'Anuj Rawat', 'RCB', 4, 4, 0, 73, '48', 18.25, 63, 115.87, 0, 0, 5, 3),
(39, 'Tim David', 'MI', 3, 3, 1, 70, '42*', 35.00, 56, 125.00, 0, 0, 4, 3),
(4, 'Rohit Sharma', 'MI', 6, 6, 1, 261, '105*', 52.20, 156, 167.31, 1, 0, 28, 15),
(40, 'Hardik Pandya', 'MI', 3, 3, 0, 69, '34', 23.00, 45, 153.33, 0, 0, 8, 2),
(41, 'Cameron Green', 'RCB', 5, 5, 1, 68, '33', 17.00, 63, 107.94, 0, 0, 6, 2),
(42, 'Venkatesh Iyer', 'KKR', 3, 3, 1, 62, '50', 31.00, 37, 167.57, 0, 1, 5, 4),
(43, 'Mitchell Marsh', 'DC', 4, 4, 0, 61, '23', 15.25, 38, 160.53, 0, 0, 9, 3),
(44, 'Mayank Agarwal', 'SRH', 3, 3, 0, 59, '32', 19.67, 51, 115.69, 0, 0, 7, 1),
(45, 'Jitesh Sharma', 'PBKS', 4, 4, 0, 58, '27', 14.50, 46, 126.09, 0, 0, 3, 4),
(46, 'Shreyas Iyer', 'KKR', 3, 3, 1, 57, '39*', 28.50, 37, 154.05, 0, 0, 2, 4),
(47, 'Shahbaz Ahmed', 'SRH', 4, 3, 0, 56, '22', 18.67, 44, 127.27, 0, 0, 2, 4),
(48, 'Angkrish Raghuvanshi', 'KKR', 2, 1, 0, 54, '54', 54.00, 27, 200.00, 0, 1, 5, 3),
(49, 'Rinku Singh', 'KKR', 3, 3, 1, 54, '26', 27.00, 28, 192.86, 0, 0, 4, 3),
(50, 'Prithvi Shaw', 'DC', 2, 2, 0, 53, '43', 26.50, 34, 155.88, 0, 0, 6, 2),
(51, 'Rahul Tewatia', 'GT', 4, 3, 1, 51, '23*', 25.50, 34, 150.00, 0, 0, 6, 2),
(52, 'Mahipal Lomror', 'RCB', 2, 2, 1, 50, '33', 50.00, 21, 238.10, 0, 0, 5, 4),
(53, 'Naman Dhir', 'MI', 3, 3, 0, 50, '30', 16.67, 25, 200.00, 0, 0, 5, 3),
(54, 'Abishek Porel', 'DC', 4, 4, 2, 50, '32*', 25.00, 31, 161.29, 0, 0, 5, 2),
(55, 'Ishan Kishan', 'MI', 3, 3, 0, 50, '34', 16.67, 31, 161.29, 0, 0, 4, 5),
(56, 'Rajat Patidar', 'RCB', 5, 4, 0, 50, '29', 12.50, 46, 108.70, 0, 0, 3, 3),
(57, 'Krunal Pandya', 'LSG', 3, 3, 3, 46, '43*', 0.00, 27, 170.37, 0, 0, 4, 2),
(58, 'Marcus Stoinis', 'LSG', 3, 3, 0, 46, '24', 15.33, 31, 148.39, 0, 0, 1, 4),
(59, 'Dewald Brevis', 'MI', 2, 2, 0, 46, '46', 23.00, 39, 117.95, 0, 0, 2, 3),
(60, 'Ravichandran Ashwin', 'RR', 4, 2, 0, 45, '29', 22.50, 35, 128.57, 0, 0, 1, 3),
(61, 'Abdul Samad', 'SRH', 4, 2, 0, 44, '29', 22.00, 25, 176.00, 0, 0, 4, 2),
(62, 'Axar Patel', 'DC', 4, 4, 2, 43, '21', 21.50, 35, 122.86, 0, 0, 3, 1),
(63, 'Dhruv Jurel', 'RR', 4, 3, 1, 42, '20*', 21.00, 27, 155.56, 0, 0, 4, 1),
(64, 'Vijay Shankar', 'GT', 4, 4, 2, 40, '14*', 20.00, 38, 105.26, 0, 0, 2, 1),
(65, 'Yashasvi Jaiswal', 'RR', 4, 4, 0, 39, '24', 9.75, 27, 144.44, 0, 0, 6, 1),
(66, 'MS Dhoni', 'CSK', 4, 2, 2, 38, '37*', 0.00, 18, 211.11, 0, 0, 4, 3),
(67, 'Ramandeep Singh', 'KKR', 3, 2, 0, 37, '35', 18.50, 19, 194.74, 0, 0, 1, 4),
(68, 'Shai Hope', 'DC', 1, 1, 0, 33, '33', 33.00, 25, 132.00, 0, 0, 2, 2),
(69, 'Glenn Maxwell', 'RCB', 5, 5, 0, 32, '28', 6.40, 30, 106.67, 0, 0, 3, 1),
(70, 'Ashutosh Sharma', 'PBKS', 1, 1, 0, 31, '31', 31.00, 17, 182.35, 0, 0, 3, 1),
(71, 'Shimron Hetmyer', 'RR', 4, 3, 2, 30, '14*', 30.00, 20, 150.00, 0, 0, 3, 1),
(72, 'Azmatullah Omarzai', 'GT', 4, 2, 0, 28, '17', 14.00, 21, 133.33, 0, 0, 2, 1),
(73, 'Deepak Hooda', 'LSG', 1, 1, 0, 26, '26', 26.00, 13, 200.00, 0, 0, 2, 2),
(74, 'Kane Williamson', 'GT', 1, 1, 0, 26, '26', 26.00, 22, 118.18, 0, 0, 4, 0),
(75, 'Rahul Tripathi', 'SRH', 1, 1, 0, 20, '20', 20.00, 20, 100.00, 0, 0, 0, 1),
(76, 'Romario Shepherd', 'MI', 1, 1, 1, 15, '15*', 0.00, 6, 250.00, 0, 0, 2, 1),
(77, 'Sikandar Raza', 'PBKS', 1, 1, 0, 15, '15', 15.00, 16, 93.75, 0, 0, 0, 0),
(78, 'Devdutt Padikkal', 'LSG', 3, 3, 0, 15, '9', 5.00, 20, 75.00, 0, 0, 2, 0),
(79, 'Sameer Rizwi', 'CSK', 3, 2, 0, 14, '14', 7.00, 7, 200.00, 0, 0, 0, 2),
(80, 'Nitish Kumar Reddy', 'SRH', 1, 1, 1, 14, '14*', 0.00, 8, 175.00, 0, 0, 1, 1),
(81, 'Mohammed Siraj', 'RCB', 5, 1, 0, 12, '12', 12.00, 8, 150.00, 0, 0, 0, 2),
(82, 'Umesh Yadav', 'GT', 4, 1, 1, 10, '10*', 0.00, 11, 90.91, 0, 0, 0, 1),
(83, 'Saurav Chauhan', 'RCB', 1, 1, 0, 9, '9', 9.00, 6, 150.00, 0, 0, 0, 1),
(84, 'Jasprit Bumrah', 'MI', 3, 2, 2, 9, '8*', 0.00, 10, 90.00, 0, 0, 1, 0),
(85, 'Nitish Rana', 'KKR', 1, 1, 0, 9, '9', 9.00, 11, 81.82, 0, 0, 1, 0),
(86, 'Sumit Kumar', 'DC', 3, 2, 0, 9, '7', 4.50, 15, 60.00, 0, 0, 0, 1),
(87, 'Ayush Badoni', 'LSG', 3, 3, 0, 9, '8', 3.00, 18, 50.00, 0, 0, 0, 0),
(88, 'Shubham Dubey', 'RR', 2, 1, 1, 8, '8*', 0.00, 6, 133.33, 0, 0, 1, 0),
(89, 'Mitchell Starc', 'KKR', 3, 2, 2, 7, '6*', 0.00, 4, 175.00, 0, 0, 1, 0),
(90, 'Rashid Khan', 'GT', 4, 2, 1, 5, '4*', 5.00, 5, 100.00, 0, 0, 0, 0),
(91, 'Spencer Johnson', 'GT', 2, 1, 1, 5, '5*', 0.00, 5, 100.00, 0, 0, 1, 0),
(92, 'Harpreet Brar', 'PBKS', 4, 3, 3, 5, '2*', 0.00, 6, 83.33, 0, 0, 0, 0),
(93, 'Gerald Coetzee', 'MI', 3, 2, 0, 5, '4', 2.50, 12, 41.67, 0, 0, 0, 0),
(94, 'Akash Madhwal', 'MI', 1, 1, 1, 4, '4*', 0.00, 5, 80.00, 0, 0, 0, 0),
(95, 'Anrich Nortje', 'DC', 3, 1, 0, 4, '4', 4.00, 6, 66.67, 0, 0, 0, 0),
(96, 'Reece Topley', 'RCB', 2, 1, 1, 3, '3*', 0.00, 6, 50.00, 0, 0, 0, 0),
(97, 'Piyush Chawla', 'MI', 3, 2, 0, 3, '3', 1.50, 7, 42.86, 0, 0, 0, 0),
(98, 'Ricky Bhui', 'DC', 2, 2, 0, 3, '3', 1.50, 9, 33.33, 0, 0, 0, 0),
(99, 'Mohsin Khan', 'LSG', 2, 1, 0, 2, '2', 2.00, 1, 200.00, 0, 0, 0, 0),
(100, 'Pat Cummins', 'SRH', 4, 2, 2, 2, '2*', 0.00, 3, 66.67, 0, 0, 0, 0),
(102, 'Shams Mulani', 'MI', 2, 1, 1, 1, '1*', 0.00, 1, 100.00, 0, 0, 0, 0),
(101, 'Marco Jansen', 'SRH', 1, 1, 1, 1, '1*', 0.00, 1, 100.00, 0, 0, 0, 0),
(103, 'Kuldeep Yadav', 'DC', 2, 1, 0, 1, '1', 1.00, 2, 50.00, 0, 0, 0, 0),
(104, 'Ishant Sharma', 'DC', 3, 1, 1, 1, '1*', 0.00, 3, 33.33, 0, 0, 0, 0),
(105, 'Rasikh Salam', 'DC', 2, 1, 0, 1, '1', 1.00, 5, 20.00, 0, 0, 0, 0),
(2, 'Virat Kohli', 'RCB', 9, 9, 2, 430, '113*', 61.43, 295, 145.76, 1, 3, 40, 17);

--
-- Triggers `batstats`
--
DELIMITER $$
CREATE TRIGGER `calculate_batstats_avg_sr` BEFORE INSERT ON `batstats` FOR EACH ROW BEGIN
    DECLARE total_runs INT;
    DECLARE total_innings INT;
    DECLARE total_not_outs INT;
    DECLARE total_balls_faced INT;

    SELECT SUM(Runs) INTO total_runs FROM batstats WHERE Player = NEW.Player;

    SELECT SUM(Inns) INTO total_innings FROM batstats WHERE Player = NEW.Player;

    SELECT SUM(NO) INTO total_not_outs FROM batstats WHERE Player = NEW.Player;

    SELECT SUM(BF) INTO total_balls_faced FROM batstats WHERE Player = NEW.Player;

    IF total_innings - total_not_outs > 0 THEN
        SET NEW.Avg = total_runs / (total_innings - total_not_outs);
    ELSE
        SET NEW.Avg = 0;
    END IF;

    IF total_balls_faced > 0 THEN
        SET NEW.SR = (total_runs / total_balls_faced) * 100;
    ELSE
        SET NEW.SR = 0;
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_batstats_avg_sr` BEFORE UPDATE ON `batstats` FOR EACH ROW BEGIN
    DECLARE total_runs INT;
    DECLARE total_innings INT;
    DECLARE total_not_outs INT;
    DECLARE total_balls_faced INT;
    
    SELECT SUM(CASE WHEN POS = OLD.POS THEN NEW.Runs ELSE Runs END) INTO total_runs FROM batstats WHERE Player = NEW.Player;
    
    SELECT SUM(CASE WHEN POS = OLD.POS THEN NEW.Inns ELSE Inns END) INTO total_innings FROM batstats WHERE Player = NEW.Player;

    SELECT SUM(CASE WHEN POS = OLD.POS THEN NEW.NO ELSE NO END) INTO total_not_outs FROM batstats WHERE Player = NEW.Player;
    
    -- Calculate total balls faced
    SELECT SUM(CASE WHEN POS = OLD.POS THEN NEW.BF ELSE BF END) INTO total_balls_faced FROM batstats WHERE Player = NEW.Player;

    IF (total_innings - total_not_outs) > 0 THEN
        SET NEW.Avg = total_runs / (total_innings - total_not_outs);
    ELSE
        SET NEW.Avg = 0;
    END IF;
 
    IF total_balls_faced > 0 THEN
        SET NEW.SR = (total_runs / total_balls_faced) * 100;
    ELSE
        SET NEW.SR = 0;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `bowlstats`
--

CREATE TABLE `bowlstats` (
  `POS` int(2) NOT NULL,
  `Player` varchar(30) NOT NULL,
  `Team` varchar(4) NOT NULL,
  `Mat` int(2) NOT NULL,
  `Inns` int(2) NOT NULL,
  `Ov` decimal(4,1) NOT NULL,
  `Runs` int(3) NOT NULL,
  `Wkts` int(2) NOT NULL,
  `BBI` varchar(8) NOT NULL,
  `Avg` decimal(5,2) NOT NULL,
  `Ecom` decimal(4,2) NOT NULL,
  `SR` decimal(6,2) NOT NULL,
  `4w` int(1) NOT NULL,
  `5w` int(1) NOT NULL,
  `MAID` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bowlstats`
--

INSERT INTO `bowlstats` (`POS`, `Player`, `Team`, `Mat`, `Inns`, `Ov`, `Runs`, `Wkts`, `BBI`, `Avg`, `Ecom`, `SR`, `4w`, `5w`, `MAID`) VALUES
(1, 'Jasprit Bumrah', 'MI', 8, 8, 32.0, 204, 13, '21/5', 15.69, 6.38, 2.46, 0, 1, 0),
(2, 'Yuzvendra Chahal', 'RR', 8, 8, 30.0, 265, 13, '11/3', 20.38, 8.83, 2.31, 0, 0, 0),
(3, 'Mustafizur Rahman', 'CSK', 7, 7, 27.3, 277, 12, '29/4', 23.08, 10.26, 2.25, 1, 0, 0),
(4, 'Mohit Sharma', 'GT', 4, 4, 16.0, 131, 7, '25/3', 18.71, 8.19, 2.29, 0, 0, 0),
(5, 'Mayank Yadav', 'LSG', 2, 2, 8.0, 41, 6, '14/3', 6.83, 5.13, 1.33, 0, 0, 0),
(6, 'Khaleel Ahmed', 'DC', 4, 4, 16.0, 131, 6, '21/2', 21.83, 8.19, 2.67, 0, 0, 1),
(7, 'Kagiso Rabada', 'PBKS', 4, 4, 16.0, 141, 6, '23/2', 23.50, 8.81, 2.67, 0, 0, 0),
(8, 'Nandre Burger', 'RR', 4, 4, 14.0, 124, 6, '29/2', 20.67, 8.86, 2.33, 0, 0, 0),
(9, 'Pat Cummins', 'SRH', 4, 4, 16.0, 124, 5, '35/2', 24.80, 7.75, 3.20, 0, 0, 0),
(10, 'Trent Boult', 'RR', 4, 4, 14.0, 116, 5, '22/3', 23.20, 8.29, 2.80, 0, 0, 0),
(11, 'Yash Dayal', 'RCB', 5, 5, 19.0, 158, 5, '23/1', 31.60, 8.32, 3.80, 0, 0, 0),
(12, 'Harshit Rana', 'KKR', 3, 2, 8.0, 72, 5, '33/3', 14.40, 9.00, 1.60, 0, 0, 0),
(13, 'Andre Russell', 'KKR', 3, 3, 7.2, 68, 5, '25/2', 13.60, 9.71, 1.40, 0, 0, 0),
(14, 'Harpreet Brar', 'PBKS', 4, 4, 13.0, 74, 4, '13/2', 18.50, 5.69, 3.25, 0, 0, 0),
(15, 'Glenn Maxwell', 'RCB', 5, 3, 8.0, 59, 4, '23/2', 14.75, 7.38, 2.00, 0, 0, 0),
(16, 'Matheesha Pathirana', 'CSK', 2, 2, 8.0, 60, 4, '31/3', 15.00, 7.50, 2.00, 0, 0, 0),
(17, 'Sam Curran', 'PBKS', 4, 4, 10.0, 86, 4, '28/3', 21.50, 8.60, 2.50, 0, 0, 0),
(18, 'T Natarajan', 'SRH', 2, 2, 8.0, 71, 4, '32/3', 17.75, 8.88, 2.00, 0, 0, 0),
(19, 'Rashid Khan', 'GT', 4, 4, 16.0, 145, 4, '49/2', 36.25, 9.06, 4.00, 0, 0, 0),
(21, 'Arshdeep Singh', 'PBKS', 4, 4, 14.2, 131, 4, '28/2', 32.75, 9.36, 3.50, 0, 0, 0),
(20, 'Deepak Chahar', 'CSK', 4, 4, 15.1, 139, 4, '28/2', 34.75, 9.27, 3.75, 0, 0, 0),
(23, 'Naveen-Ul-Haq', 'LSG', 3, 3, 11.4, 109, 4, '25/2', 27.25, 9.91, 2.75, 0, 0, 0),
(22, 'Azmatullah Omarzai', 'GT', 4, 4, 13.0, 122, 4, '27/2', 30.50, 9.38, 3.25, 0, 0, 0),
(24, 'Mukesh Kumar', 'DC', 2, 2, 7.0, 70, 4, '21/3', 17.50, 10.00, 1.75, 0, 0, 0),
(25, 'Mohammed Siraj', 'RCB', 5, 5, 19.0, 192, 4, '26/2', 48.00, 10.11, 4.75, 0, 0, 0),
(26, 'Varun Chakaravarthy', 'KKR', 3, 3, 10.0, 108, 4, '33/3', 27.00, 10.80, 2.50, 0, 0, 0),
(27, 'Umesh Yadav', 'GT', 4, 4, 11.0, 121, 4, '31/2', 30.25, 11.00, 2.75, 0, 0, 0),
(28, 'Harshal Patel', 'PBKS', 4, 4, 16.0, 181, 4, '47/2', 45.25, 11.31, 4.00, 0, 0, 0),
(29, 'Anrich Nortje', 'DC', 3, 3, 12.0, 150, 4, '59/3', 37.50, 12.50, 3.00, 0, 0, 0),
(30, 'Akash Madhwal', 'MI', 1, 1, 4.0, 20, 3, '20/3', 6.67, 5.00, 1.33, 0, 0, 0),
(31, 'Vaibhav Arora', 'KKR', 1, 1, 4.0, 27, 3, '27/3', 9.00, 6.75, 1.33, 0, 0, 0),
(32, 'Sunil Narine', 'KKR', 3, 3, 12.0, 88, 3, '19/1', 29.33, 7.33, 4.00, 0, 0, 0),
(33, 'Kuldeep Yadav', 'DC', 2, 2, 8.0, 61, 3, '20/2', 20.33, 7.63, 2.67, 0, 0, 0),
(34, 'Noor Ahmad', 'GT', 2, 2, 8.0, 64, 3, '32/2', 21.33, 8.00, 2.67, 0, 0, 0),
(35, 'Reece Topley', 'RCB', 2, 2, 8.0, 66, 3, '27/2', 22.00, 8.25, 2.67, 0, 0, 0),
(37, 'Jaydev Unadkat', 'SRH', 3, 3, 11.1, 109, 3, '47/2', 36.33, 9.91, 3.67, 0, 0, 0),
(36, 'Mohsin Khan', 'LSG', 2, 2, 8.0, 79, 3, '34/2', 26.33, 9.88, 2.67, 0, 0, 0),
(38, 'Spencer Johnson', 'GT', 2, 2, 6.0, 60, 3, '25/2', 20.00, 10.00, 2.00, 0, 0, 0),
(39, 'Ishant Sharma', 'DC', 3, 3, 8.0, 82, 3, '43/2', 27.33, 10.25, 2.67, 0, 0, 0),
(40, 'Mayank Markande', 'SRH', 4, 4, 13.0, 145, 3, '39/2', 48.33, 11.15, 4.33, 0, 0, 0),
(41, 'Gerald Coetzee', 'MI', 3, 3, 10.3, 120, 3, '27/2', 40.00, 12.00, 3.33, 0, 0, 0),
(42, 'Shahbaz Ahmed', 'SRH', 4, 4, 7.0, 84, 3, '11/1', 28.00, 12.00, 2.33, 0, 0, 0),
(43, 'Axar Patel', 'DC', 4, 4, 12.0, 84, 2, '20/1', 42.00, 7.00, 6.00, 0, 0, 0),
(44, 'Sai Kishore', 'GT', 2, 2, 7.0, 52, 2, '24/1', 26.00, 7.43, 3.50, 0, 0, 0),
(45, 'Moeen Ali', 'CSK', 1, 1, 3.0, 23, 2, '23/2', 11.50, 7.67, 1.50, 0, 0, 0),
(46, 'Tushar Deshpande', 'CSK', 4, 4, 14.0, 112, 2, '21/2', 56.00, 8.00, 7.00, 0, 0, 0),
(47, 'Avesh Khan', 'RR', 4, 4, 15.0, 126, 2, '29/1', 63.00, 8.40, 7.50, 0, 0, 0),
(48, 'Cameron Green', 'RCB', 5, 5, 11.1, 105, 2, '27/2', 52.50, 9.55, 5.50, 0, 0, 0),
(49, 'Piyush Chawla', 'MI', 3, 3, 8.0, 83, 2, '31/1', 41.50, 10.38, 4.00, 0, 0, 0),
(50, 'Mitchell Starc', 'KKR', 3, 3, 11.0, 125, 2, '25/2', 62.50, 11.36, 5.50, 0, 0, 0),
(51, 'Rahul Chahar', 'PBKS', 3, 3, 8.0, 91, 2, '33/1', 45.50, 11.38, 4.00, 0, 0, 0),
(52, 'Vyshak Vijaykumar', 'RCB', 1, 1, 4.0, 23, 1, '23/1', 23.00, 5.75, 4.00, 0, 0, 0),
(53, 'Ravindra Jadeja', 'CSK', 4, 4, 14.0, 109, 1, '43/1', 109.00, 7.79, 14.00, 0, 0, 0),
(54, 'Maheesh Theekshana', 'CSK', 2, 2, 8.0, 63, 1, '27/1', 63.00, 7.88, 8.00, 0, 0, 0),
(55, 'Ravichandran Ashwin', 'RR', 4, 4, 15.0, 120, 1, '35/1', 120.00, 8.00, 15.00, 0, 0, 0),
(57, 'Sandeep Sharma', 'RR', 2, 2, 7.0, 58, 1, '22/1', 58.00, 8.29, 7.00, 0, 0, 0),
(58, 'M Siddharth', 'LSG', 2, 2, 5.0, 42, 1, '21/1', 42.00, 8.40, 5.00, 0, 0, 0),
(56, 'Darshan Nalkande', 'GT', 2, 2, 2.5, 24, 1, '6/1', 24.00, 8.00, 3.00, 0, 0, 0),
(59, 'Daryl Mitchell', 'CSK', 4, 1, 2.0, 18, 1, '18/1', 18.00, 9.00, 2.00, 0, 0, 0),
(60, 'Marcus Stoinis', 'LSG', 3, 1, 1.0, 9, 1, '9/1', 9.00, 9.00, 1.00, 0, 0, 0),
(61, 'Ravi Bishnoi', 'LSG', 3, 3, 10.0, 96, 1, '38/1', 96.00, 9.60, 10.00, 0, 0, 0),
(62, 'Bhuvneshwar Kumar', 'SRH', 4, 4, 16.0, 159, 1, '28/1', 159.00, 9.94, 16.00, 0, 0, 0),
(63, 'Mayank Dagar', 'RCB', 5, 5, 11.5, 120, 1, '23/1', 120.00, 10.00, 12.00, 0, 0, 0),
(64, 'Hardik Pandya', 'MI', 3, 2, 7.0, 76, 1, '46/1', 76.00, 10.86, 7.00, 0, 0, 0),
(65, 'Yash Thakur', 'LSG', 2, 2, 7.0, 81, 1, '38/1', 81.00, 11.57, 7.00, 0, 0, 0),
(67, 'Alzarri Joseph', 'RCB', 3, 3, 9.4, 115, 1, '43/1', 115.00, 12.78, 9.00, 0, 0, 0),
(66, 'Karn Sharma', 'RCB', 1, 1, 2.0, 24, 1, '24/1', 24.00, 12.00, 2.00, 0, 0, 0),
(68, 'Mitchell Marsh', 'DC', 4, 3, 8.0, 103, 1, '37/1', 103.00, 12.88, 8.00, 0, 0, 0),
(69, 'Kwena Maphaka', 'MI', 2, 2, 6.0, 89, 1, '23/1', 89.00, 14.83, 6.00, 0, 0, 0);

--
-- Triggers `bowlstats`
--
DELIMITER $$
CREATE TRIGGER `calculate_bowlstats_avg_sr_ecom` BEFORE INSERT ON `bowlstats` FOR EACH ROW BEGIN
    DECLARE total_runs_conceded INT;
    DECLARE total_overs_bowled INT;
    DECLARE total_wickets INT;

    SELECT SUM(Runs) INTO total_runs_conceded FROM bowlstats WHERE Player = NEW.Player;

    SELECT SUM(Ov) INTO total_overs_bowled FROM bowlstats WHERE Player = NEW.Player;

    SELECT SUM(Wkts) INTO total_wickets FROM bowlstats WHERE Player = NEW.Player;
    
    IF total_wickets > 0 THEN
        SET NEW.Avg = total_runs_conceded / total_wickets;
    ELSE
        SET NEW.Avg = 0;
    END IF;

    IF total_overs_bowled > 0 THEN
        SET NEW.SR = (total_overs_bowled / total_wickets);
    ELSE
        SET NEW.SR = 0;
    END IF;

    IF total_overs_bowled > 0 THEN
        SET NEW.Ecom = total_runs_conceded / total_overs_bowled;
    ELSE
        SET NEW.Ecom = 0;
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_bowlstats_avg_sr_ecom` BEFORE UPDATE ON `bowlstats` FOR EACH ROW BEGIN
    DECLARE total_runs_conceded INT;
    DECLARE total_overs_bowled INT;
    DECLARE total_wickets INT;

    SELECT SUM(Runs) INTO total_runs_conceded FROM bowlstats WHERE Player = NEW.Player;

    SELECT SUM(Ov) INTO total_overs_bowled FROM bowlstats WHERE Player = NEW.Player;

    SELECT SUM(Wkts) INTO total_wickets FROM bowlstats WHERE Player = NEW.Player;

    IF total_wickets > 0 THEN
        SET NEW.Avg = total_runs_conceded / total_wickets;
    ELSE
        SET NEW.Avg = 0;
    END IF;

    IF total_overs_bowled > 0 THEN
        SET NEW.SR = (total_overs_bowled / total_wickets);
    ELSE
        SET NEW.SR = 0;
    END IF;

    IF total_overs_bowled > 0 THEN
        SET NEW.Ecom = total_runs_conceded / total_overs_bowled;
    ELSE
        SET NEW.Ecom = 0;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `S.No` int(4) NOT NULL,
  `Player Name` varchar(23) DEFAULT NULL,
  `Team` varchar(6) DEFAULT 'Unsold',
  `Position` varchar(18) DEFAULT NULL,
  `Captain` varchar(7) NOT NULL DEFAULT 'No',
  `Country` varchar(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`S.No`, `Player Name`, `Team`, `Position`, `Captain`, `Country`) VALUES
(1, 'RUTURAJ GAIKWAD', 'CSK', 'Batter', 'Yes', 'India'),
(2, 'DEVON CONWAY', 'CSK', 'Batter', 'No', 'New Zealand'),
(3, 'MS DHONI', 'CSK', 'WK Keeper - Batter', 'No', 'India'),
(4, 'AJINKYA RAHANE', 'CSK', 'Batter', 'No', 'India'),
(5, 'SHAIK RASHEED', 'CSK', 'Batter', 'No', 'India'),
(6, 'SAMEER RIZVI', 'CSK', 'Batter', 'No', 'India'),
(7, 'AVANISH RAO ARAVELLY', 'CSK', 'Batter', 'No', 'India'),
(8, 'RAVINDRA JADEJA', 'CSK', 'All-Rounder', 'No', 'India'),
(9, 'MITCHELL SANTNER', 'CSK', 'All-Rounder', 'No', 'New Zealand'),
(10, 'MOEEN ALI', 'CSK', 'All-Rounder', 'No', 'England'),
(11, 'SHIVAM DUBE', 'CSK', 'All-Rounder', 'No', 'India'),
(12, 'NISHANT SINDHU', 'CSK', 'All-Rounder', 'No', 'India'),
(13, 'AJAY MANDAL', 'CSK', 'All-Rounder', 'No', 'India'),
(14, 'RACHIN RAVINDRA', 'CSK', 'All-Rounder', 'No', 'India'),
(15, 'SHARDUL THAKUR', 'CSK', 'All-Rounder', 'No', 'India'),
(16, 'DARYL MITCHELL', 'CSK', 'All-Rounder', 'No', 'New Zealand'),
(17, 'RAJVARDHAN HANGARGEKAR', 'CSK', 'Bowler', 'No', 'India'),
(18, 'DEEPAK CHAHAR', 'CSK', 'Bowler', 'No', 'India'),
(19, 'MAHEESH THEEKSHANA', 'CSK', 'Bowler', 'No', 'Sri Lanka'),
(20, 'MUKESH CHOUDHARY', 'CSK', 'Bowler', 'No', 'India'),
(21, 'MUSTAFIZUR RAHMAN', 'CSK', 'Bowler', 'No', 'Bangladesh'),
(22, 'PRASHANT SOLANKI', 'CSK', 'Bowler', 'No', 'India'),
(23, 'SIMARJEET SINGH', 'CSK', 'Bowler', 'No', 'India'),
(24, 'TUSHAR DESHPANDE', 'CSK', 'Bowler', 'No', 'India'),
(25, 'MATHEESHA PATHIRANA', 'CSK', 'Bowler', 'No', 'Sri Lanka'),
(26, 'RISHABH PANT', 'DC', 'WK Keeper - Batter', 'Yes', 'India'),
(27, 'DAVID WARNER', 'DC', 'Batter', 'No', 'Australia'),
(28, 'PRITHVI SHAW', 'DC', 'Batter', 'No', 'India'),
(29, 'YASH DHULL', 'DC', 'Batter', 'No', 'India'),
(30, 'SHAI HOPE', 'DC', 'Batter', 'No', 'West India'),
(31, 'SWASTIK CHHIKARA', 'DC', 'Batter', 'No', 'India'),
(32, 'ABISHEK POREL', 'DC', 'Batter', 'No', 'India'),
(33, 'HARRY BROOK', 'DC', 'Batter', 'No', 'England'),
(34, 'RICKY BHUI', 'DC', 'Batter', 'No', 'India'),
(35, 'KUMAR KUSHAGRA', 'DC', 'Batter', 'No', 'India'),
(36, 'TRISTAN STUBBS', 'DC', 'Batter', 'No', 'Australia'),
(37, 'AXAR PATEL', 'DC', 'All Rounder', 'No', 'India'),
(38, 'LALIT YADAV', 'DC', 'All Rounder', 'No', 'India'),
(39, 'MITCHELL MARSH', 'DC', 'All Rounder', 'No', 'Australia'),
(40, 'SUMIT KUMAR', 'DC', 'All Rounder', 'No', 'India'),
(41, 'PRAVIN DUBEY', 'DC', 'Bowler', 'No', 'India'),
(42, 'VICKY OSTWAL', 'DC', 'Bowler', 'No', 'India'),
(43, 'ANRICH NORTJE', 'DC', 'Bowler', 'No', 'South African'),
(44, 'KULDEEP YADAV', 'DC', 'Bowler', 'No', 'India'),
(45, 'JAKE FRASER-MCGURK', 'DC', 'Bowler', 'No', 'Australia'),
(46, 'KHALEEL AHMED', 'DC', 'Bowler', 'No', 'India'),
(47, 'ISHANT SHARMA', 'DC', 'Bowler', 'No', 'India'),
(48, 'JHYE RICHARDSON', 'DC', 'Bowler', 'No', 'Australia'),
(49, 'MUKESH KUMAR', 'DC', 'Bowler', 'No', 'India'),
(50, 'RASIKH DAR', 'DC', 'Bowler', 'No', 'India'),
(51, 'SHUBMAN GILL', 'GT', 'Batter', 'Yes', 'India'),
(52, 'DAVID MILLER', 'GT', 'Batter', 'No', 'South African'),
(53, 'MATTHEW WADE', 'GT', 'Batter', 'No', 'Australia'),
(54, 'WRIDDHIMAN SAHA', 'GT', 'WK Keeper - Batter', 'No', 'India'),
(55, 'BR SHARATH', 'GT', 'Batter', 'No', 'India'),
(56, 'KANE WILLIAMSON', 'GT', 'Batter', 'No', 'New Zealander'),
(57, 'ABHINAV MANOHAR', 'GT', 'All Rounder', 'No', 'India'),
(58, 'B. SAI SUDHARSAN', 'GT', 'All Rounder', 'No', 'India'),
(59, 'DARSHAN NALKANDE', 'GT', 'All Rounder', 'No', 'India'),
(60, 'VIJAY SHANKAR', 'GT', 'All Rounder', 'No', 'India'),
(61, 'AZMATULLAH OMARZAI', 'GT', 'All Rounder', 'No', 'Afghanistan'),
(62, 'SHAHRUKH KHAN', 'GT', 'All Rounder', 'No', 'India'),
(63, 'SANDEEP WARRIER', 'GT', 'Bowler', 'No', 'India'),
(64, 'JAYANT YADAV', 'GT', 'Bowler', 'No', 'India'),
(65, 'RAHUL TEWATIA', 'GT', 'Bowler', 'No', 'India'),
(66, 'MOHAMMAD SHAMI', 'GT', 'Bowler', 'No', 'India'),
(67, 'KARTIK TYAGI', 'GT', 'Bowler', 'No', 'India'),
(68, 'SUSHANT MISHRA', 'GT', 'Bowler', 'No', 'India'),
(69, 'SPENCER JOHNSON', 'GT', 'Bowler', 'No', 'South African'),
(70, 'NOOR AHMAD', 'GT', 'Bowler', 'No', 'Afghanistan'),
(71, 'SAI KISHORE', 'GT', 'Bowler', 'No', 'India'),
(72, 'UMESH YADAV', 'GT', 'Bowler', 'No', 'India'),
(73, 'RASHID KHAN', 'GT', 'Bowler', 'No', 'Afghanistan'),
(74, 'JOSHUA LITTLE', 'GT', 'Bowler', 'No', 'Irish'),
(75, 'MOHIT SHARMA', 'GT', 'Bowler', 'No', 'India'),
(76, 'MANAV SUTHAR', 'GT', 'Bowler', 'No', 'India'),
(77, 'SHREYAS IYER', 'KKR', 'Batter', 'Yes', 'India'),
(78, 'RINKU SINGH', 'KKR', 'Batter', 'No', 'India'),
(79, 'RAHMANULLAH GURBAZ', 'KKR', 'Batter', 'No', 'Afghanistan'),
(80, 'NITISH RANA', 'KKR', 'Batter', 'No', 'India'),
(81, 'SHERFANE RUTHERFORD', 'KKR', 'Batter', 'No', 'West India'),
(82, 'PHIL SALT', 'KKR', 'WK Keeper - Batter', 'No', 'England'),
(83, 'K.S BHARAT', 'KKR', 'Batter', 'No', 'India'),
(84, 'MANISH PANDEY', 'KKR', 'Batter', 'No', 'India'),
(85, 'ANGKRISH RAGHUVANSHI', 'KKR', 'Batter', 'No', 'India'),
(86, 'ANUKUL ROY', 'KKR', 'All Rounder', 'No', 'India'),
(87, 'RAMANDEEP SINGH', 'KKR', 'All Rounder', 'No', 'India'),
(88, 'ANDRE RUSSELL', 'KKR', 'All Rounder', 'No', 'West India'),
(89, 'VENKATESH IYER', 'KKR', 'All Rounder', 'No', 'India'),
(90, 'SUYASH SHARMA', 'KKR', 'Bowler', 'No', 'India'),
(91, 'ALLAH GHAZANFAR', 'KKR', 'Bowler', 'No', 'Afghanistan'),
(92, 'DUSHMANTHA CHAMEERA', 'KKR', 'Bowler', 'No', 'Sri Lanka'),
(93, 'SAKIB HUSSAIN', 'KKR', 'Bowler', 'No', 'India'),
(94, 'HARSHIT RANA', 'KKR', 'Bowler', 'No', 'India'),
(95, 'SUNIL NARINE', 'KKR', 'Bowler', 'No', 'West India'),
(96, 'VAIBHAV ARORA', 'KKR', 'Bowler', 'No', 'India'),
(97, 'VARUN CHAKARAVARTHY', 'KKR', 'Bowler', 'No', 'India'),
(98, 'MITCHELL STARC', 'KKR', 'Bowler', 'No', 'Australia'),
(99, 'CHETAN SAKARIYA', 'KKR', 'Bowler', 'No', 'India'),
(100, 'KL RAHUL', 'LSG', 'Batter', 'Yes', 'India'),
(101, 'DEVDUTT PADIKKAL', 'LSG', 'Batter', 'No', 'India'),
(102, 'QUINTON DE KOCK', 'LSG', 'WK Keeper - Batter', 'No', 'South African'),
(103, 'NICHOLAS POORAN', 'LSG', 'Batter', 'No', 'West India'),
(104, 'ASHTON TURNER', 'LSG', 'Batter', 'No', 'Australia'),
(105, 'AYUSH BADONI', 'LSG', 'All Rounder', 'No', 'India'),
(106, 'DEEPAK HOODA', 'LSG', 'All Rounder', 'No', 'India'),
(107, 'KRISHNAPPA GOWTHAM', 'LSG', 'All Rounder', 'No', 'India'),
(108, 'KRUNAL PANDYA', 'LSG', 'All Rounder', 'No', 'India'),
(109, 'KYLE MAYERS', 'LSG', 'All Rounder', 'No', 'West India'),
(110, 'MARCUS STOINIS', 'LSG', 'All Rounder', 'No', 'Australia'),
(111, 'MOHD. ARSHAD KHAN', 'LSG', 'All Rounder', 'No', 'India'),
(112, 'PRERAK MANKAD', 'LSG', 'All Rounder', 'No', 'India'),
(113, 'YUDHVIR SINGH', 'LSG', 'All Rounder', 'No', 'India'),
(114, 'ARSHIN KULKARNI', 'LSG', 'All Rounder', 'No', 'India'),
(115, 'DAVID WILLEY', 'LSG', 'All Rounder', 'No', 'England'),
(116, 'SHIVAM MAVI', 'LSG', 'Bowler', 'No', 'India'),
(117, 'SHAMAR JOSEPH', 'LSG', 'Bowler', 'No', 'West India'),
(118, 'MATT HENRY', 'LSG', 'Bowler', 'No', 'New Zealander'),
(119, 'MAYANK YADAV', 'LSG', 'Bowler', 'No', 'India'),
(120, 'MOHSIN KHAN', 'LSG', 'Bowler', 'No', 'India'),
(121, 'RAVI BISHNOI', 'LSG', 'Bowler', 'No', 'India'),
(122, 'YASH THAKUR', 'LSG', 'Bowler', 'No', 'India'),
(123, 'AMIT MISHRA', 'LSG', 'Bowler', 'No', 'India'),
(124, 'NAVEEN UL HAQ', 'LSG', 'Bowler', 'No', 'Afghanistan'),
(125, 'M. SIDDHARTH', 'LSG', 'Bowler', 'No', 'India'),
(126, 'ROHIT SHARMA', 'MI', 'Batter', 'No', 'India'),
(127, 'DEWALD BREVIS', 'MI', 'Batter', 'No', 'South African'),
(128, 'SURYAKUMAR YADAV', 'MI', 'Batter', 'No', 'India'),
(129, 'ISHAN KISHAN', 'MI', 'WK Keeper - Batter', 'No', 'India'),
(130, 'N. TILAK VARMA', 'MI', 'Batter', 'No', 'India'),
(131, 'TIM DAVID', 'MI', 'Batter', 'No', 'Singaporean'),
(132, 'VISHNU VINOD', 'MI', 'Batter', 'No', 'India'),
(133, 'HARDIK PANDYA', 'MI', 'All Rounder', 'Yes', 'India'),
(134, 'ARJUN TENDULKAR', 'MI', 'All Rounder', 'No', 'India'),
(135, 'MOHAMMAD NABI', 'MI', 'All Rounder', 'No', 'Afghanistan'),
(136, 'ROMARIO SHEPHERD', 'MI', 'All Rounder', 'No', 'West India'),
(137, 'SHAMS MULANI', 'MI', 'All Rounder', 'No', 'India'),
(138, 'NEHAL WADHERA', 'MI', 'All Rounder', 'No', 'India'),
(139, 'GERALD COETZEE', 'MI', 'All Rounder', 'No', 'South African'),
(140, 'ANSHUL KAMBOJ', 'MI', 'All Rounder', 'No', 'India'),
(141, 'NAMAN DHIR', 'MI', 'All Rounder', 'No', 'India'),
(142, 'SHIVALIK SHARMA', 'MI', 'All Rounder', 'No', 'India'),
(143, 'KWENA MAPHAKA', 'MI', 'Bowler', 'No', 'South African'),
(144, 'JASPRIT BUMRAH', 'MI', 'Bowler', 'No', 'India'),
(145, 'PIYUSH CHAWLA', 'MI', 'Bowler', 'No', 'India'),
(146, 'KUMAR KARTIKEYA SINGH', 'MI', 'Bowler', 'No', 'India'),
(147, 'AKASH MADHWAL', 'MI', 'Bowler', 'No', 'India'),
(148, 'LUKE WOOD', 'MI', 'Bowler', 'No', 'England'),
(149, 'DILSHAN MADUSHANKA', 'MI', 'Bowler', 'No', 'Sri Lanka'),
(150, 'SHREYAS GOPAL', 'MI', 'Bowler', 'No', 'India'),
(151, 'NUWAN THUSHARA', 'MI', 'Bowler', 'No', 'Sri Lanka'),
(152, 'SHIKHAR DHAWAN', 'PBKS', 'Batter', 'Yes', 'India'),
(153, 'JITESH SHARMA', 'PBKS', 'WK Keeper - Batter', 'No', 'India'),
(154, 'JONNY BAIRSTOW', 'PBKS', 'Batter', 'No', 'England'),
(155, 'PRABHSIMRAN SINGH', 'PBKS', 'Batter', 'No', 'India'),
(156, 'LIAM LIVINGSTONE', 'PBKS', 'Batter', 'No', 'England'),
(157, 'HARPREET BHATIA', 'PBKS', 'Batter', 'No', 'India'),
(158, 'RILEE ROSSOUW', 'PBKS', 'Batter', 'No', 'South African'),
(159, 'SHASHANK SINGH', 'PBKS', 'Batter', 'No', 'India'),
(160, 'CHRIS WOAKES', 'PBKS', 'All Rounder', 'No', 'England'),
(161, 'VISHWANATH PRATAP SINGH', 'PBKS', 'All Rounder', 'No', 'India'),
(162, 'ASHUTOSH SHARMA', 'PBKS', 'All Rounder', 'No', 'India'),
(163, 'TANAY THYAGARAJANN', 'PBKS', 'All Rounder', 'No', 'India'),
(164, 'ATHARVA TAIDE', 'PBKS', 'All Rounder', 'No', 'India'),
(165, 'RISHI DHAWAN', 'PBKS', 'All Rounder', 'No', 'India'),
(166, 'SAM CURRAN', 'PBKS', 'All Rounder', 'No', 'England'),
(167, 'SIKANDAR RAZA', 'PBKS', 'All Rounder', 'No', 'Zimbabwean'),
(168, 'SHIVAM SINGH', 'PBKS', 'All Rounder', 'No', 'India'),
(169, 'PRINCE CHOUDHARY', 'PBKS', 'Bowler', 'No', 'India'),
(170, 'HARPREET BRAR', 'PBKS', 'Bowler', 'No', 'India'),
(171, 'ARSHDEEP SINGH', 'PBKS', 'Bowler', 'No', 'India'),
(172, 'KAGISO RABADA', 'PBKS', 'Bowler', 'No', 'South African'),
(173, 'NATHAN ELLIS', 'PBKS', 'Bowler', 'No', 'Australia'),
(174, 'RAHUL CHAHAR', 'PBKS', 'Bowler', 'No', 'India'),
(175, 'VIDWATH KAVERAPPA', 'PBKS', 'Bowler', 'No', 'India'),
(176, 'HARSHAL PATEL', 'PBKS', 'Bowler', 'No', 'India'),
(177, 'SANJU SAMSON', 'RR', 'WK Keeper - Batter', 'Yes', 'India'),
(178, 'JOS BUTTLER', 'RR', 'Batter', 'No', 'England'),
(179, 'SHIMRON HETMYER', 'RR', 'Batter', 'No', 'West India'),
(180, 'YASHASVI JAISWAL', 'RR', 'Batter', 'No', 'India'),
(181, 'DHRUV JUREL', 'RR', 'Batter', 'No', 'India'),
(182, 'RIYAN PARAG', 'RR', 'Batter', 'No', 'India'),
(183, 'KUNAL RATHORE', 'RR', 'Batter', 'No', 'India'),
(184, 'DONOVAN FERREIRA', 'RR', 'Batter', 'No', 'India'),
(185, 'ROVMAN POWELL', 'RR', 'Batter', 'No', 'West India'),
(186, 'SHUBHAM DUBEY', 'RR', 'Batter', 'No', 'India'),
(187, 'TOM KOHLER-CADMORE', 'RR', 'Batter', 'No', 'England'),
(188, 'RAVICHANDRAN ASHWIN', 'RR', 'All Rounder', 'No', 'India'),
(189, 'TANUSH KOTIAN', 'RR', 'All Rounder', 'No', 'India'),
(190, 'ABID MUSHTAQ', 'RR', 'All Rounder', 'No', 'India'),
(191, 'AVESH KHAN', 'RR', 'Bowler', 'No', 'India'),
(192, 'KULDEEP SEN', 'RR', 'Bowler', 'No', 'India'),
(193, 'NAVDEEP SAINI', 'RR', 'Bowler', 'No', 'India'),
(194, 'KESHAV MAHARAJ', 'RR', 'Bowler', 'No', 'South African'),
(195, 'SANDEEP SHARMA', 'RR', 'Bowler', 'No', 'India'),
(196, 'TRENT BOULT', 'RR', 'Bowler', 'No', 'New Zealander'),
(197, 'YUZVENDRA CHAHAL', 'RR', 'Bowler', 'No', 'India'),
(198, 'NANDRE BURGER', 'RR', 'Bowler', 'No', 'South African'),
(199, 'FAF DU PLESSIS', 'RCB', 'Batter', 'Yes', 'South African'),
(200, 'RAJAT PATIDAR', 'RCB', 'Batter', 'No', 'India'),
(201, 'VIRAT KOHLI', 'RCB', 'Batter', 'No', 'India'),
(202, 'ANUJ RAWAT', 'RCB', 'WK Keeper - Batter', 'No', 'India'),
(203, 'DINESH KARTHIK', 'RCB', 'Batter', 'No', 'India'),
(204, 'SUYASH S PRABHUDESSAI', 'RCB', 'Batter', 'No', 'India'),
(205, 'WILL JACKS', 'RCB', 'Batter', 'No', 'England'),
(206, 'SAURAV CHUAHAN', 'RCB', 'Batter', 'No', 'India'),
(207, 'GLENN MAXWELL', 'RCB', 'All Rounder', 'No', 'Australia'),
(208, 'MAHIPAL LOMROR', 'RCB', 'All Rounder', 'No', 'India'),
(209, 'KARN SHARMA', 'RCB', 'All Rounder', 'No', 'India'),
(210, 'CAMERON GREEN', 'RCB', 'All Rounder', 'No', 'Australia'),
(211, 'SWAPNIL SINGH', 'RCB', 'All Rounder', 'No', 'India'),
(212, 'MAYANK DAGAR', 'RCB', 'All Rounder', 'No', 'India'),
(213, 'MANOJ BHANDAGE', 'RCB', 'All Rounder', 'No', 'India'),
(214, 'AKASH DEEP', 'RCB', 'Bowler', 'No', 'India'),
(215, 'ALZARRI JOSEPH', 'RCB', 'Bowler', 'No', 'West India'),
(216, 'LOCKIE FERGUSON', 'RCB', 'Bowler', 'No', 'New Zealander'),
(217, 'MOHAMMED SIRAJ', 'RCB', 'Bowler', 'No', 'India'),
(218, 'YASH DAYAL', 'RCB', 'Bowler', 'No', 'India'),
(219, 'TOM CURRAN', 'RCB', 'Bowler', 'No', 'England'),
(220, 'REECE TOPLEY', 'RCB', 'Bowler', 'No', 'England'),
(221, 'HIMANSHU SHARMA', 'RCB', 'Bowler', 'No', 'India'),
(222, 'RAJAN KUMAR', 'RCB', 'Bowler', 'No', 'India'),
(223, 'VYSHAK VIJAY KUMAR', 'RCB', 'Bowler', 'No', 'India'),
(224, 'ABDUL SAMAD', 'SRH', 'Batter', 'No', 'India'),
(225, 'AIDEN MARKRAM', 'SRH', 'Batter', 'No', 'South African'),
(226, 'RAHUL TRIPATHI', 'SRH', 'Batter', 'No', 'India'),
(227, 'GLENN PHILLIPS', 'SRH', 'Batter', 'No', 'New Zealander'),
(228, 'MAYANK AGARWAL', 'SRH', 'Batter', 'No', 'India'),
(229, 'HEINRICH KLAASEN', 'SRH', 'WK Keeper - Batter', 'No', 'South African'),
(230, 'ANMOLPREET SINGH', 'SRH', 'Batter', 'No', 'India'),
(231, 'UPENDRA SINGH YADAV', 'SRH', 'Batter', 'No', 'India'),
(232, 'NITISH KUMAR REDDY', 'SRH', 'Batter', 'No', 'India'),
(233, 'TRAVIS HEAD', 'SRH', 'Batter', 'No', 'Australia'),
(234, 'ABHISHEK SHARMA', 'SRH', 'All Rounder', 'No', 'India'),
(235, 'MARCO JANSEN', 'SRH', 'All Rounder', 'No', 'South African'),
(236, 'WASHINGTON SUNDAR', 'SRH', 'All Rounder', 'No', 'India'),
(237, 'SANVIR SINGH', 'SRH', 'All Rounder', 'No', 'India'),
(238, 'WANINDU HASARANGA', 'SRH', 'All Rounder', 'No', 'Sri Lanka'),
(239, 'PAT CUMMINS', 'SRH', 'Bowler', 'Yes', 'Australia'),
(240, 'AKASH SINGH', 'SRH', 'Bowler', 'No', 'India'),
(241, 'SHAHBAZ AHAMAD', 'SRH', 'Bowler', 'No', 'India'),
(242, 'BHUVNESHWAR KUMAR', 'SRH', 'Bowler', 'No', 'India'),
(243, 'FAZALHAQ FAROOQI', 'SRH', 'Bowler', 'No', 'Afghanistan'),
(244, 'JAYDEV UNADKAT', 'SRH', 'Bowler', 'No', 'India'),
(245, 'T NATARAJAN', 'SRH', 'Bowler', 'No', 'India'),
(246, 'UMRAN MALIK', 'SRH', 'Bowler', 'No', 'India'),
(247, 'MAYANK MARKANDE', 'SRH', 'Bowler', 'No', 'India'),
(248, 'JHATHAVEDH SUBRAMANYAN', 'SRH', 'Bowler', 'No', 'India');

-- --------------------------------------------------------

--
-- Table structure for table `points_table`
--

CREATE TABLE `points_table` (
  `Season` year(4) DEFAULT NULL,
  `Rank` int(4) DEFAULT NULL,
  `Team` varchar(27) DEFAULT NULL,
  `Abbreviation` varchar(4) DEFAULT NULL,
  `Matches Played` int(4) DEFAULT NULL,
  `Matches Won` int(4) DEFAULT NULL,
  `Matches Lost` int(4) DEFAULT NULL,
  `No Result` int(4) DEFAULT NULL,
  `Match Points` int(4) DEFAULT NULL,
  `NRR` float DEFAULT NULL,
  `For` varchar(10) DEFAULT NULL,
  `Against` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `points_table`
--

INSERT INTO `points_table` (`Season`, `Rank`, `Team`, `Abbreviation`, `Matches Played`, `Matches Won`, `Matches Lost`, `No Result`, `Match Points`, `NRR`, `For`, `Against`) VALUES
('2023', 1, 'Gujarat Titans', 'GT', 14, 10, 4, 0, 20, 0.809, '2450/268.1', '2326/279.2'),
('2023', 2, 'Chennai Super Kings', 'CSK', 14, 8, 5, 1, 17, 0.652, '2369/254.3', '2232/257.5'),
('2023', 3, 'Lucknow Super Giants', 'LSG', 14, 8, 5, 1, 17, 0.284, '2253/255.2', '2216/259.3'),
('2023', 4, 'Mumbai Indians', 'MI', 14, 8, 6, 0, 16, -0.04, '2592/270.3', '2620/272.1'),
('2023', 5, 'Rajasthan Royals', 'RR', 14, 7, 7, 0, 14, 0.148, '2419/272.1', '2389/273.2'),
('2023', 6, 'Royal Challengers Bangalore', 'RCB', 14, 7, 7, 0, 14, 0.135, '2502/275.4', '2435/272.2'),
('2023', 7, 'Kolkata Knight Riders', 'KKR', 14, 6, 8, 0, 12, -0.23, '2463/274.3', '2432/264.0'),
('2023', 8, 'Punjab Kings', 'PBKS', 14, 6, 8, 0, 12, -0.3, '2518/275.3', '2564/271.3'),
('2023', 9, 'Delhi Capitals', 'DC', 14, 5, 9, 0, 10, -0.8, '2182/276.0', '2424/278.1'),
('2023', 10, 'Sunrisers Hyderabad', 'SRH', 14, 4, 10, 0, 8, -0.59, '2376/277.1', '2486/271.2'),
('2022', 1, 'Gujarat Titans', 'GT', 14, 10, 4, 0, 20, 0.316, '2339/278.1', '2216/273.5'),
('2022', 2, 'Rajasthan Royals', 'RR', 14, 9, 5, 0, 18, 0.298, '2464/279.2', '2351/275.5'),
('2022', 3, 'Lucknow Super Giants', 'LSG', 14, 9, 5, 0, 18, 0.251, '2355/279.1', '2289/279.4'),
('2022', 4, 'Royal Challengers Bangalore', 'RCB', 14, 8, 6, 0, 16, -0.25, '2268/275.4', '2260/266.3'),
('2022', 5, 'Delhi Capitals', 'DC', 14, 7, 7, 0, 14, 0.204, '2341/266.0', '2397/278.5'),
('2022', 6, 'Punjab Kings', 'PBKS', 14, 7, 7, 0, 14, 0.126, '2343/270.1', '2252/263.3'),
('2022', 7, 'Kolkata Knight Riders', 'KKR', 14, 6, 8, 0, 12, 0.146, '2223/268.1', '2249/276.1'),
('2022', 8, 'Sunrisers Hyderabad', 'SRH', 14, 6, 8, 0, 12, -0.37, '2197/261.3', '2416/275.1'),
('2022', 9, 'Chennai Super Kings', 'CSK', 14, 4, 10, 0, 8, -0.2, '2288/280.0', '2254/269.1'),
('2022', 10, 'Mumbai Indians', 'MI', 14, 4, 10, 0, 8, -0.5, '2217/273.2', '2351/272.5'),
('2021', 1, 'Delhi Capitals', 'DC', 14, 10, 4, 0, 20, 0.481, '2180/267.0', '2136/278.0'),
('2021', 2, 'Chennai Super Kings', 'CSK', 14, 9, 5, 0, 18, 0.455, '2368/272.0', '2218/268.5'),
('2021', 3, 'Royal Challengers Bangalore', 'RCB', 14, 9, 5, 0, 18, -0.14, '2165/273.4', '2159/268.1'),
('2021', 4, 'Kolkata Knight Riders', 'KKR', 14, 7, 7, 0, 14, 0.587, '2119/259.5', '2080/274.5'),
('2021', 5, 'Mumbai Indians', 'MI', 14, 7, 7, 0, 14, 0.116, '2117/265.5', '2128/271.1'),
('2021', 6, 'Punjab Kings', 'PBKS', 14, 6, 8, 0, 12, -0, '2150/270.1', '2117/266.0'),
('2021', 7, 'Rajasthan Royals', 'RR', 14, 5, 9, 0, 10, -0.99, '2196/276.0', '2318/259.0'),
('2021', 8, 'Sunrisers Hyderabad', 'SRH', 14, 3, 11, 0, 6, -0.54, '2077/277.1', '2216/275.4'),
('2020', 1, 'Mumbai Indians', 'MI', 14, 9, 5, 0, 18, 1.107, '2378/262.2', '2187/274.5'),
('2020', 2, 'Delhi Capitals', 'DC', 14, 8, 6, 0, 16, -0.1, '2289/278.5', '2271/273.0'),
('2020', 3, 'Sunrisers Hyderabad', 'SRH', 14, 7, 7, 0, 14, 0.608, '2225/269.3', '2125/277.5'),
('2020', 4, 'Royal Challengers Bangalore', 'RCB', 14, 7, 7, 0, 14, -0.17, '2147/272.2', '2183/271.0'),
('2020', 5, 'Kolkata Knight Riders', 'KKR', 14, 7, 7, 0, 14, -0.21, '2219/278.0', '2206/269.1'),
('2020', 6, 'Kings XI Punjab', 'PBKS', 14, 6, 8, 0, 12, -0.16, '2335/277.5', '2343/273.3'),
('2020', 7, 'Chennai Super Kings', 'CSK', 14, 6, 8, 0, 12, -0.45, '2191/274.3', '2275/269.4'),
('2020', 8, 'Rajasthan Royals', 'RR', 14, 6, 8, 0, 12, -0.56, '2288/272.4', '2482/277.0'),
('2019', 1, 'Mumbai Indians', 'MI', 14, 9, 5, 0, 18, 0.421, '2380/275.1', '2282/277.2'),
('2019', 2, 'Chennai Super Kings', 'CSK', 14, 9, 5, 0, 18, 0.131, '2043/274.1', '2012/274.5'),
('2019', 3, 'Delhi Capitals', 'DC', 14, 9, 5, 0, 18, 0.044, '2207/272.5', '2238/278.1'),
('2019', 4, 'Sunrisers Hyderabad', 'SRH', 14, 6, 8, 0, 12, 0.577, '2288/269.2', '2200/277.5'),
('2019', 5, 'Kolkata Knight Riders', 'KKR', 14, 6, 8, 0, 12, 0.028, '2466/270.4', '2419/266.2'),
('2019', 6, 'Kings XI Punjab', 'PBKS', 14, 6, 8, 0, 12, -0.25, '2429/276.3', '2503/277.0'),
('2019', 7, 'Rajasthan Royals', 'RR', 14, 5, 8, 1, 11, -0.44, '2153/257.0', '2192/248.2'),
('2019', 8, 'Royal Challengers Bangalore', 'RCB', 14, 5, 8, 1, 11, -0.6, '2146/258.4', '2266/254.3'),
('2018', 1, 'Sunrisers Hyderabad', 'SRH', 14, 9, 5, 0, 18, 0.284, '2230/273.3', '2193/278.4'),
('2018', 2, 'Chennai Super Kings', 'CSK', 14, 9, 5, 0, 18, 0.253, '2488/275.3', '2433/277.1'),
('2018', 3, 'Kolkata Knight Riders', 'KKR', 14, 8, 6, 0, 16, -0.07, '2363/265.1', '2425/270.0'),
('2018', 4, 'Rajasthan Royals', 'RR', 14, 7, 7, 0, 14, -0.25, '2130/255.3', '2141/249.2'),
('2018', 5, 'Mumbai Indians', 'MI', 14, 6, 8, 0, 12, 0.317, '2380/278.4', '2282/277.3'),
('2018', 6, 'Royal Challengers Bangalore', 'RCB', 14, 6, 8, 0, 12, 0.129, '2322/264.4', '2383/275.4'),
('2018', 7, 'Kings XI Punjab', 'PBKS', 14, 6, 8, 0, 12, -0.5, '2210/268.4', '2259/258.5'),
('2018', 8, 'Delhi Capitals', 'DC', 14, 5, 9, 0, 10, -0.22, '2297/258.0', '2304/252.3'),
('2017', 1, 'Mumbai Indians', 'MI', 14, 10, 4, 0, 20, 0.784, '2407/272.1', '2242/278.1'),
('2017', 2, 'Rising Pune Supergiant', 'RPS', 14, 9, 5, 0, 18, 0.176, '2180/271.0', '2165/275.1'),
('2017', 3, 'Sunrisers Hyderabad', 'SRH', 14, 8, 5, 1, 17, 0.599, '2221/252.0', '2118/257.5'),
('2017', 4, 'Kolkata Knight Riders', 'KKR', 14, 8, 6, 0, 16, 0.641, '2329/260.5', '2300/277.3'),
('2017', 5, 'Kings XI Punjab', 'PBKS', 14, 7, 7, 0, 14, -0, '2207/261.2', '2229/263.4'),
('2017', 6, 'Delhi Capitals', 'DC', 14, 6, 8, 0, 12, -0.51, '2219/276.2', '2255/264.0'),
('2017', 7, 'Gujarat Lions', 'GL', 14, 4, 10, 0, 8, -0.41, '2406/269.5', '2472/265.0'),
('2017', 8, 'Royal Challengers Bangalore', 'RCB', 14, 3, 10, 1, 7, -1.29, '1845/260.0', '2033/242.1'),
('2016', 1, 'Gujarat Lions', 'GL', 14, 9, 5, 0, 18, -0.37, '2130/264.3', '2285/271.1'),
('2016', 2, 'Royal Challengers Bangalore', 'RCB', 14, 8, 6, 0, 16, 0.932, '2613/270.2', '2345/268.3'),
('2016', 3, 'Sunrisers Hyderabad', 'SRH', 14, 8, 6, 0, 16, 0.245, '2082/259.5', '2078/267.3'),
('2016', 4, 'Kolkata Knight Riders', 'KKR', 14, 8, 6, 0, 16, 0.106, '2123/253.2', '2121/256.2'),
('2016', 5, 'Mumbai Indians', 'MI', 14, 7, 7, 0, 14, -0.14, '2194/272.2', '2190/267.0'),
('2016', 6, 'Delhi Capitals', 'DC', 14, 7, 7, 0, 14, -0.15, '2040/259.1', '2107/262.3'),
('2016', 7, 'Rising Pune Supergiant', 'RPS', 14, 5, 9, 0, 10, 0.015, '2025/244.5', '1991/241.1'),
('2016', 8, 'Kings XI Punjab', 'PBKS', 14, 4, 10, 0, 8, -0.64, '2134/269.4', '2224/259.5'),
('2015', 1, 'Chennai Super Kings', 'CSK', 14, 9, 5, 0, 18, 0.709, '2262/273.3', '2073/274.1'),
('2015', 2, 'Mumbai Indians', 'MI', 14, 8, 6, 0, 16, -0.04, '2345/272.4', '2371/274.2'),
('2015', 3, 'Royal Challengers Bangalore', 'RCB', 14, 7, 5, 2, 16, 1.037, '1790/191.1', '1693/203.2'),
('2015', 4, 'Rajasthan Royals', 'RR', 14, 7, 5, 2, 16, 0.062, '2028/237.3', '2002/236.1'),
('2015', 5, 'Kolkata Knight Riders', 'KKR', 14, 7, 6, 1, 15, 0.253, '2044/236.1', '2022/240.4'),
('2015', 6, 'Sunrisers Hyderabad', 'SRH', 14, 7, 7, 0, 14, -0.23, '2096/255.2', '2126/251.4'),
('2015', 7, 'Delhi Capitals', 'DC', 14, 5, 8, 1, 11, -0.04, '1981/250.2', '1976/248.1'),
('2015', 8, 'Kings XI Punjab', 'PBKS', 14, 3, 11, 0, 6, -1.43, '2003/270.0', '2286/258.1'),
('2014', 1, 'Kings XI Punjab', 'PBKS', 14, 11, 3, 0, 22, 0.968, '2427/268.3', '2229/276.1'),
('2014', 2, 'Kolkata Knight Riders', 'KKR', 14, 9, 5, 0, 18, 0.418, '2125/264.0', '2110/276.3'),
('2014', 3, 'Chennai Super Kings', 'CSK', 14, 9, 5, 0, 18, 0.385, '2272/272.0', '2178/273.2'),
('2014', 4, 'Mumbai Indians', 'MI', 14, 7, 7, 0, 14, 0.095, '2180/271.3', '2170/273.3'),
('2014', 5, 'Rajasthan Royals', 'RR', 14, 7, 7, 0, 14, 0.06, '2155/269.5', '2164/273.0'),
('2014', 6, 'Sunrisers Hyderabad', 'SRH', 14, 6, 8, 0, 12, -0.39, '2102/263.4', '2136/255.1'),
('2014', 7, 'Royal Challengers Bangalore', 'RCB', 14, 5, 9, 0, 10, -0.42, '2093/273.5', '2163/268.0'),
('2014', 8, 'Delhi Capitals', 'DC', 14, 2, 12, 0, 4, -1.18, '1980/263.2', '2184/251.0'),
('2013', 1, 'Chennai Super Kings', 'CSK', 16, 11, 5, 0, 22, 0.53, '2461/303.5', '2310/305.1'),
('2013', 2, 'Mumbai Indians', 'MI', 16, 11, 5, 0, 22, 0.441, '2514/318.1', '2350/315.0'),
('2013', 3, 'Rajasthan Royals', 'RR', 16, 10, 6, 0, 20, 0.322, '2405/310.5', '2326/313.4'),
('2013', 4, 'Sunrisers Hyderabad', 'SRH', 16, 10, 6, 0, 20, 0.003, '2166/308.5', '2206/314.4'),
('2013', 5, 'Royal Challengers Bangalore', 'RCB', 16, 9, 7, 0, 18, 0.457, '2571/301.0', '2451/303.1'),
('2013', 6, 'Kings XI Punjab', 'PBKS', 16, 8, 8, 0, 16, 0.226, '2428/305.2', '2417/312.5'),
('2013', 7, 'Kolkata Knight Riders', 'KKR', 16, 6, 10, 0, 12, -0.09, '2290/313.4', '2316/313.1'),
('2013', 8, 'Pune Warriors', 'PWI', 16, 4, 12, 0, 8, -1, '2262/318.4', '2519/310.5'),
('2013', 9, 'Delhi Capitals', 'DC', 16, 3, 13, 0, 6, -0.84, '2234/314.5', '2436/306.4'),
('2012', 1, 'Delhi Capitals', 'DC', 16, 11, 5, 0, 22, 0.617, '2365/283.5', '2361/306.0'),
('2012', 2, 'Kolkata Knight Riders', 'KKR', 16, 10, 5, 1, 21, 0.561, '2150/285.1', '2032/291.1'),
('2012', 3, 'Mumbai Indians', 'MI', 16, 10, 6, 0, 20, -0.1, '2313/312.3', '2343/312.2'),
('2012', 4, 'Chennai Super Kings', 'CSK', 16, 8, 7, 1, 17, 0.1, '2232/293.3', '2144/285.4'),
('2012', 5, 'Royal Challengers Bangalore', 'RCB', 16, 8, 7, 1, 17, -0.02, '2472/296.2', '2505/299.3'),
('2012', 6, 'Kings XI Punjab', 'PBKS', 16, 8, 8, 0, 16, -0.21, '2390/313.3', '2455/313.1'),
('2012', 7, 'Rajasthan Royals', 'RR', 16, 7, 9, 0, 14, 0.201, '2516/316.0', '2402/309.3'),
('2012', 8, 'Deccan Chargers', 'SRH', 16, 4, 11, 1, 9, -0.5, '2312/298.4', '2405/291.3'),
('2012', 9, 'Pune Warriors', 'PWI', 16, 4, 12, 0, 8, -0.55, '2321/319.2', '2424/310.0'),
('2011', 1, 'Royal Challengers Bangalore', 'RCB', 14, 9, 4, 1, 19, 0.326, '1962/237.0', '2000/251.3'),
('2011', 2, 'Chennai Super Kings', 'CSK', 14, 9, 5, 0, 18, 0.443, '2118/265.1', '1978/262.1'),
('2011', 3, 'Mumbai Indians', 'MI', 14, 9, 5, 0, 18, 0.04, '1998/275.2', '1951/270.2'),
('2011', 4, 'Kolkata Knight Riders', 'KKR', 14, 8, 6, 0, 16, 0.433, '1888/249.2', '1861/260.4'),
('2011', 5, 'Kings XI Punjab', 'PBKS', 14, 7, 7, 0, 14, -0.05, '2224/275.4', '2173/267.4'),
('2011', 6, 'Rajasthan Royals', 'RR', 14, 6, 7, 1, 13, -0.69, '1687/242.2', '1801/235.2'),
('2011', 7, 'Deccan Chargers', 'SRH', 14, 6, 8, 0, 12, 0.222, '2140/279.2', '2037/273.5'),
('2011', 8, 'Kochi Tuskers Kerala', 'KOCH', 14, 6, 8, 0, 12, -0.21, '1901/256.2', '1989/260.4'),
('2011', 9, 'Pune Warriors', 'PWI', 14, 4, 9, 1, 9, -0.13, '1775/247.3', '1858/254.2'),
('2011', 10, 'Delhi Capitals', 'DC', 14, 4, 9, 1, 9, -0.44, '2031/258.2', '2076/249.5'),
('2010', 1, 'Mumbai Indians', 'MI', 14, 10, 4, 0, 20, 1.084, '2408/277.0', '2100/276.0'),
('2010', 2, 'Deccan Chargers', 'SRH', 14, 8, 6, 0, 16, -0.29, '2188/277.4', '2254/275.4'),
('2010', 3, 'Chennai Super Kings', 'CSK', 14, 7, 7, 0, 14, 0.274, '2285/271.1', '2257/276.5'),
('2010', 4, 'Royal Challengers Bangalore', 'RCB', 14, 7, 7, 0, 14, 0.219, '2166/260.4', '2245/277.3'),
('2010', 5, 'Delhi Capitals', 'DC', 14, 7, 7, 0, 14, 0.021, '2155/275.4', '2166/277.5'),
('2010', 6, 'Kolkata Knight Riders', 'KKR', 14, 7, 7, 0, 14, -0.34, '2144/273.0', '2192/267.3'),
('2010', 7, 'Rajasthan Royals', 'RR', 14, 6, 8, 0, 12, -0.51, '2179/270.4', '2224/259.4'),
('2010', 8, 'Kings XI Punjab', 'PBKS', 14, 4, 10, 0, 8, -0.47, '2278/276.2', '2365/271.1'),
('2009', 1, 'Delhi Capitals', 'DC', 14, 10, 4, 0, 20, 0.311, '1978/255.2', '1953/262.4'),
('2009', 2, 'Chennai Super Kings', 'CSK', 14, 8, 5, 1, 17, 0.951, '2086/255.3', '1855/257.1'),
('2009', 3, 'Royal Challengers Bangalore', 'RCB', 14, 8, 6, 0, 16, -0.19, '1994/276.0', '2027/273.2'),
('2009', 4, 'Deccan Chargers', 'SRH', 14, 7, 7, 0, 14, 0.203, '2111/272.4', '2097/278.1'),
('2009', 5, 'Kings XI Punjab', 'PBKS', 14, 7, 7, 0, 14, -0.48, '1787/251.2', '1887/248.3'),
('2009', 6, 'Rajasthan Royals', 'RR', 14, 6, 7, 1, 13, -0.35, '1688/253.1', '1810/257.5'),
('2009', 7, 'Mumbai Indians', 'MI', 14, 5, 8, 1, 11, 0.297, '1897/256.2', '1802/253.4'),
('2009', 8, 'Kolkata Knight Riders', 'KKR', 14, 3, 10, 1, 7, -0.78, '1757/248.5', '1867/237.5'),
('2008', 1, 'Rajasthan Royals', 'RR', 14, 11, 3, 0, 22, 0.632, '2245/261.1', '2153/270.2'),
('2008', 2, 'Kings XI Punjab', 'PBKS', 14, 10, 4, 0, 20, 0.509, '2352/259.5', '2271/265.5'),
('2008', 3, 'Chennai Super Kings', 'CSK', 14, 8, 6, 0, 16, -0.19, '2241/264.2', '2195/253.1'),
('2008', 4, 'Delhi Capitals', 'DC', 14, 7, 6, 1, 15, 0.342, '2001/233.2', '2031/246.4'),
('2008', 5, 'Mumbai Indians', 'MI', 14, 7, 7, 0, 14, 0.57, '2080/249.1', '2096/269.3'),
('2008', 6, 'Kolkata Knight Riders', 'KKR', 14, 6, 7, 1, 13, -0.14, '1845/242.4', '1718/221.4'),
('2008', 7, 'Royal Challengers Bangalore', 'RCB', 14, 4, 10, 0, 8, -1.16, '1983/272.4', '2205/261.3'),
('2008', 8, 'Deccan Chargers', 'SRH', 14, 2, 12, 0, 4, -0.46, '2229/270.0', '2307/264.3'),
('2024', 1, 'Rajasthan Royals', 'RR', 4, 4, 0, 0, 8, 1.12, '694/74.4', '654/80.0'),
('2024', 2, 'Kolkata Knight Riders', 'KKR', 4, 3, 1, 0, 6, 1.528, '803/76.5', '693/77.4'),
('2024', 3, 'Lucknow Super Giants', 'LSG', 4, 3, 1, 0, 6, 0.775, '716/80.0', '654/80.0'),
('2024', 4, 'Chennai Super Kings', 'CSK', 5, 3, 2, 0, 6, 0.666, '859/96.2', '810/98.1'),
('2024', 5, 'Sunrisers Hyderabad', 'SRH', 5, 3, 2, 0, 6, 0.344, '991/98.1', '967/99.1'),
('2024', 6, 'Punjab Kings', 'PBKS', 5, 2, 3, 0, 4, -0.196, '911/99.1', '932/99.2'),
('2024', 7, 'Gujarat Titans', 'GT', 5, 2, 3, 0, 4, -0.797, '808/99.1', '893/99.5'),
('2024', 8, 'Mumbai Indians', 'MI', 4, 1, 3, 0, 2, -0.704, '767/80.0', '777/75.3'),
('2024', 9, 'Royal Challengers Bangalore', 'RCB', 5, 1, 4, 0, 2, -0.843, '869/99.2', '908/94.4'),
('2024', 10, 'Delhi Capitals', 'DC', 5, 1, 4, 0, 2, -1.37, '909/100.0', '1039/99.2');

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `Team` varchar(27) DEFAULT NULL,
  `Year` varchar(28) DEFAULT NULL,
  `Owner` varchar(40) DEFAULT NULL,
  `Coach` varchar(18) DEFAULT NULL,
  `Home Ground` varchar(45) DEFAULT NULL,
  `Captain` varchar(25) DEFAULT NULL,
  `Abbreviation` varchar(4) NOT NULL,
  `links` varchar(2048) DEFAULT NULL,
  `logo` varchar(2048) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`Team`, `Year`, `Owner`, `Coach`, `Home Ground`, `Captain`, `Abbreviation`, `links`, `logo`) VALUES
('Chennai Super Kings', '2010, 2011, 2018, 2021, 2023', 'Chennai Super Kings Cricket Ltd.', 'Stephen Fleming', 'M. A. Chidambaram Stadium', 'Ruturaj Gaikwad', 'CSK', 'https://www.chennaisuperkings.com', 'https://www.chennaisuperkings.com/assets/images/csk_logo_withOutGradient.png'),
('Delhi Capitals', '-', 'GMR Sports Pvt. Ltd & JSW Sports Pvt Ltd', 'Ricky Ponting', 'Arun Jaitley Stadium', 'Rishabh Pant', 'DC', 'https://www.delhicapitals.in', 'https://bcciplayerimages.s3.ap-south-1.amazonaws.com/ipl/DC/Logos/LogoOutline/DCoutline.png'),
('Gujarat Lions', '-', 'Keshav Bansal (Intex Technologies)', 'Brad Hodge', 'Saurashtra Cricket Association Stadium', 'Suresh Raina', 'GL', 'https://www.gujaratlions.org/', 'https://upload.wikimedia.org/wikipedia/en/c/c4/Gujarat_Lions.png'),
('Gujarat Titans', '2022', 'CVC Capital Partners', 'Ashish Nehra', 'Narendra Modi Stadium', 'Shubman Gill', 'GT', 'https://www.gujarattitansipl.com', 'https://bcciplayerimages.s3.ap-south-1.amazonaws.com/ipl/GT/Logos/Logooutline/GToutline.png'),
('Kolkata Knight Riders', '2012, 2014', 'Knight Riders Sports Private Ltd', 'Chandrakant Pandit', 'Eden Gardens', 'Shreyas Iyer', 'KKR', 'https://www.kkr.in', 'https://bcciplayerimages.s3.ap-south-1.amazonaws.com/ipl/KKR/Logos/Logooutline/KKRoutline.png'),
('Kochi Tuskers Kerala', '-', 'Kochi Cricket Pvt Ltd', 'Geoff Lawson', 'Jawaharlal Nehru International Stadium', 'Mahela Jayawardene', 'KOCH', 'https://www.google.com/url?esrc=s&q=&rct=j&sa=U&url=https://twitter.com/kochituskersktk%3Flang%3Den&ved=2ahUKEwirrcD5_MaFAxWYcWwGHbZGCScQFnoECAoQAg&usg=AOvVaw3dydF5rmlxedmRWlYDgVIT', 'https://upload.wikimedia.org/wikipedia/en/thumb/9/96/Kochi_Tuskers_Kerala_Logo.svg/375px-Kochi_Tuskers_Kerala_Logo.svg.png'),
('Lucknow Super Giants', '-', 'RPSG Group', 'Justin Langer', 'BRSABV Ekana Cricket Stadium', 'KL Rahul', 'LSG', 'https://www.lucknowsupergiants.in', 'https://bcciplayerimages.s3.ap-south-1.amazonaws.com/ipl/LSG/Logos/Logooutline/LSGoutline.png'),
('Mumbai Indians', '2013, 2015, 2017, 2019, 2020', 'Indiawin Sports Pvt. Ltd', 'Mark Boucher', 'Wankhede Stadium', 'Hardik Pandya', 'MI', 'https://www.mumbaiindians.com', 'https://bcciplayerimages.s3.ap-south-1.amazonaws.com/ipl/MI/Logos/Logooutline/MIoutline.png'),
('Punjab Kings', '-', 'KPH Dream Cricket Private Limited', 'Trevor Bayliss', 'PCA New Stadium', 'Shikhar Dhawan', 'PBKS', 'https://www.punjabkingsipl.in', 'https://bcciplayerimages.s3.ap-south-1.amazonaws.com/ipl/PBKS/Logos/Logooutline/PBKSoutline.png'),
('Pune Warriors India', '-', 'Subrata Roy', 'Geoff Marsh', 'DY Patil Stadium', 'Sourav Ganguly', 'PWI', 'https://twitter.com/punewarriorsipl?lang=en', 'https://upload.wikimedia.org/wikipedia/en/thumb/4/4a/Pune_Warriors_India_IPL_Logo.png/300px-Pune_Warriors_India_IPL_Logo.png'),
('Royal Challengers Bengaluru', '-', 'United Spirits Limited (USL)', 'Andy Flower', 'M. Chinnaswamy Stadium', 'Faf du Plessis', 'RCB', 'https://www.royalchallengers.com', 'https://bcciplayerimages.s3.ap-south-1.amazonaws.com/ipl/RCB/Logos/Logooutline/RCBoutline.png'),
('Rising Pune Supergiant', '-', ' RP-Sanjiv Goenka Group', 'Stephen Fleming', 'Maharashtra Cricket Association Stadium', 'Steve Smith', 'RPS', 'https://www.rpsg.in/business/rpsgsports', 'https://upload.wikimedia.org/wikipedia/en/thumb/9/9a/Rising_Pune_Supergiant.png/200px-Rising_Pune_Supergiant.png'),
('Rajasthan Royals', '2008', 'The Royals Sports Group', 'Kumar Sangakkara', 'Sawai Mansingh Stadium', 'Sanju Samson', 'RR', 'https://www.rajasthanroyals.com', 'https://bcciplayerimages.s3.ap-south-1.amazonaws.com/ipl/RR/Logos/Logooutline/RRoutline.png'),
('Sunrisers Hyderabad', '2016', 'SUN TV Network', 'Daniel Vettori', 'Rajiv Gandhi Intl. Cricket Stadium', 'Pat Cummins', 'SRH', 'https://www.sunrisershyderabad.in', 'https://bcciplayerimages.s3.ap-south-1.amazonaws.com/ipl/SRH/Logos/Logooutline/SRHoutline.png?hgghhg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `batstats`
--
ALTER TABLE `batstats`
  ADD KEY `Team` (`Team`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`S.No`),
  ADD UNIQUE KEY `S.No` (`S.No`),
  ADD KEY `Team` (`Team`);

--
-- Indexes for table `points_table`
--
ALTER TABLE `points_table`
  ADD KEY `Abbreviation` (`Abbreviation`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`Abbreviation`),
  ADD UNIQUE KEY `Abbreviation` (`Abbreviation`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `players`
--
ALTER TABLE `players`
  MODIFY `S.No` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=249;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `batstats`
--
ALTER TABLE `batstats`
  ADD CONSTRAINT `batstats_ibfk_1` FOREIGN KEY (`Team`) REFERENCES `teams` (`Abbreviation`);

--
-- Constraints for table `players`
--
ALTER TABLE `players`
  ADD CONSTRAINT `players_ibfk_1` FOREIGN KEY (`Team`) REFERENCES `teams` (`Abbreviation`);

--
-- Constraints for table `points_table`
--
ALTER TABLE `points_table`
  ADD CONSTRAINT `points_table_ibfk_1` FOREIGN KEY (`Abbreviation`) REFERENCES `teams` (`Abbreviation`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
