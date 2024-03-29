-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
--
-- Host: 127.0.0.1
-- Generation Time: Mar 25, 2024 at 06:23 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jegna_quiz_web`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `quiz_id` int(11) DEFAULT NULL,
  `categorylist_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `category_list`
--

CREATE TABLE `category_list` (
  `id` int(11) NOT NULL,
  `category_name` varchar(50) DEFAULT NULL,
  `file_name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `path` varchar(255) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category_list`
--

INSERT INTO `category_list` (`id`, `category_name`, `file_name`, `path`) VALUES
(1, 'Teams', 'Teams.png', 'Teams.png'),
(2, 'Leagues', 'Leagues.png 	', 'Leagues.png'),
(3, 'Players', 'Players.png', 'Players.png');

-- --------------------------------------------------------

--
-- Table structure for table `leaderboard`
--

CREATE TABLE `leaderboard` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `result_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `quiz`
--

CREATE TABLE `quiz` (
  `id` int(11) NOT NULL,
  `category_list_id` int(11) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `question` varchar(255) DEFAULT NULL,
  `choice_1` varchar(255) DEFAULT NULL,
  `choice_2` varchar(255) DEFAULT NULL,
  `choice_3` varchar(255) DEFAULT NULL,
  `choice_4` varchar(255) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `quiz`
--

INSERT INTO `quiz` (`id`, `category_list_id`, `category`, `question`, `choice_1`, `choice_2`, `choice_3`, `choice_4`, `answer`) VALUES
(1, 1, 'Teams', 'Which football team won the FIFA World Cup in 2018?', 'Germany ', 'Brazil ', 'France ', 'Argentina', 'France '),
(2, 1, 'Teams', 'Which team has won the most UEFA Champions League titles?', 'Real Madrid ', 'Barcelona ', 'Manchester United ', 'Bayern Munich', 'Real Madrid '),
(3, 1, 'Teams', 'Which country\'s national team is nicknamed \"The Three Lions\"?', 'Germany ', ' Belgium', 'England ', 'Italy', 'England '),
(4, 1, 'Teams', 'Which team has won the most English Premier League titles?', 'Manchester City ', 'Liverpool ', 'Manchester United ', 'Chelsea', 'Manchester United '),
(5, 1, 'Teams', 'Which football club is known as \"The Red Devils\"?', 'Barcelona', 'Manchester United ', 'AC Milan ', 'Paris Saint-Germain', 'Manchester United '),
(6, 1, 'Teams', 'Which team has won the most FIFA World Cup titles?', 'Brazil ', 'Germany ', 'Italy ', 'Argentina', 'Brazil '),
(7, 1, 'Teams', 'Which football club plays its home matches at Camp Nou stadium?', 'Real Madrid ', 'Bayern Munich', 'Barcelona ', 'Juventus', 'Barcelona '),
(8, 1, 'Teams', 'Which team has won the most UEFA European Championship titles?', 'Germany', 'Spain ', 'Italy ', 'France', 'Germany & Spain '),
(9, 1, 'Teams', 'Which football team is associated with the nickname \"The Blues\"', 'Chelsea ', 'Manchester City', 'Arsenal ', 'Tottenham Hotspur', 'Chelsea '),
(10, 1, 'Teams', 'Which country has won the most Copa America titles?', 'Argentina ', 'Brazil ', 'Uruguay ', 'Colombia', 'Argentina '),
(11, 2, 'Leagues', 'Which league is considered the top-tier professional football league in England?', 'Premier League', 'Serie A', 'La Liga', 'Bundesliga', 'Premier League'),
(12, 2, 'Leagues', 'Which league is known for its \"El Cl?sico\" rivalry between Barcelona and Real Madrid?', 'Serie A', 'Premier League', 'La Liga', 'Ligue 1', 'La Liga'),
(13, 2, 'Leagues', 'Which league is home to the famous teams AC Milan and Juventus?', 'Bundesliga', 'Ligue 1', 'Serie A', 'Eredivisie', 'Serie A'),
(14, 2, 'Leagues', 'Which league is known for its fierce rivalry between Celtic and Rangers?', 'Ligue 1', 'Premier League', 'Scottish Premiership', 'Liga NOS', 'Scottish Premiership'),
(15, 2, 'Leagues', 'Which league is considered the top-tier professional football league in Germany?', 'Eredivisie', 'Bundesliga', 'Premier League', 'Serie A', 'Bundesliga'),
(16, 2, 'Leagues', 'Which league features the teams Paris Saint-Germain, Marseille, and Lyon?', 'Ligue 1', 'Serie A', 'La Liga', 'Premier League', 'Ligue 1'),
(17, 2, 'Leagues', 'Which league is known for its \"Derby della Madonnina\" rivalry between Inter Milan and AC Milan?', 'Bundesliga', 'Ligue 1', 'Serie A', 'Premier League', 'Serie A'),
(18, 2, 'Leagues', 'Which league features the teams Ajax, PSV Eindhoven, and Feyenoord?', 'Eredivisie', 'Premier League', 'La Liga', 'Bundesliga', 'Eredivisie'),
(19, 2, 'Leagues', 'Which league is considered the top-tier professional football league in Spain?', 'La Liga', 'Premier League', 'Serie A', 'Ligue 1', 'La Liga'),
(20, 2, 'Leagues', 'Which league is known for its \"Revierderby\" rivalry between Borussia Dortmund and Schalke 04?', 'Bundesliga', 'Serie A', 'Premier League', 'Ligue 1', 'Bundesliga'),
(21, 3, 'Players', 'Who is the all-time leading goal scorer for Barcelona?', 'Lionel Messi', 'Cristiano Ronaldo', 'Neymar', 'Ronaldinho', 'Lionel Messi'),
(22, 3, 'Players', 'Which player has won the most FIFA Ballon d\'Or awards?', 'Lionel Messi', 'Cristiano Ronaldo', 'Neymar', 'Ronaldinho', 'Lionel Messi'),
(23, 3, 'Players', 'Who is the all-time leading goal scorer for Real Madrid?', 'Lionel Messi', 'Cristiano Ronaldo', 'Neymar', 'Raul', 'Cristiano Ronaldo'),
(24, 3, 'Players', 'Which player is known as \"CR7\"?', 'Lionel Messi', 'Cristiano Ronaldo', 'Neymar', 'Ronaldinho', 'Cristiano Ronaldo'),
(25, 3, 'Players', 'Who is the all-time leading goal scorer for the Brazilian national team?', 'Ronaldinho\r\n', 'Ronaldo	', 'Neymar', 'Pelé', 'Neymar'),
(26, 3, 'Players', 'Which player is known as \"The King\"?', 'Ronaldinho', 'Ronaldo', 'Neymar', 'Pelé', 'Pelé'),
(27, 3, 'Players', 'Who is the all-time leading goal scorer for the German national team?', 'Miroslav Klose', 'Cristiano Ronaldo', 'Neymar', 'Pelé', 'Miroslav Klose'),
(28, 3, 'Players', 'Which player is known as \"The Phenomenon\"?', 'Ronaldo', 'Cristiano Ronaldo', 'Neymar', 'Pelé', 'Ronaldo'),
(29, 3, 'Players', 'Who is the all-time leading goal scorer for the French national team?', 'Thierry Henry', 'Olivier Giroud', 'Neymar', 'Michel Platini', 'Olivier Giroud'),
(30, 3, 'Players', 'Who is the all-time leading goal scorer for the English national team?', 'Thierry Henry', 'Wayne Rooney', 'Harry Kane', 'Michel Platini', 'Harry Kane');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_questions`
--

CREATE TABLE `quiz_questions` (
  `id` int(11) NOT NULL,
  `quiz_question_choice_id` int(11) DEFAULT NULL,
  `type_question_id` int(11) DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `quiz_questions_choice`
--

CREATE TABLE `quiz_questions_choice` (
  `id` int(11) NOT NULL,
  `iscorrect` tinyint(1) DEFAULT NULL,
  `choice_1` varchar(100) DEFAULT NULL,
  `choice_2` varchar(100) DEFAULT NULL,
  `choice_3` varchar(100) DEFAULT NULL,
  `choice_4` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `result`
--

CREATE TABLE `result` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `points` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `type_question`
--

CREATE TABLE `type_question` (
  `id` int(11) NOT NULL,
  `type_1` varchar(100) DEFAULT NULL,
  `type_2` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `type_quiz`
--

CREATE TABLE `type_quiz` (
  `id` int(11) NOT NULL,
  `type_1` varchar(100) DEFAULT NULL,
  `type_2` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `fullname` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `fullname`, `email`, `password`) VALUES
(1, 'yayashi', 'Yared Shisema', 'yaredshisema@gmail.com', 'passone1!'),
(3, 'sol', 'solomon assefa', 'solomonassefa@gmail.com', 'passtwo2@');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_list`
--
ALTER TABLE `category_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leaderboard`
--
ALTER TABLE `leaderboard`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quiz`
--
ALTER TABLE `quiz`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quiz_questions_choice`
--
ALTER TABLE `quiz_questions_choice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `result`
--
ALTER TABLE `result`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `type_question`
--
ALTER TABLE `type_question`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `type_quiz`
--
ALTER TABLE `type_quiz`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category_list`
--
ALTER TABLE `category_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `leaderboard`
--
ALTER TABLE `leaderboard`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quiz`
--
ALTER TABLE `quiz`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quiz_questions_choice`
--
ALTER TABLE `quiz_questions_choice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `result`
--
ALTER TABLE `result`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `type_question`
--
ALTER TABLE `type_question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `type_quiz`
--
ALTER TABLE `type_quiz`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
