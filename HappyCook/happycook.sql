-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 06, 2014 at 01:36 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `happycook`
--

-- Create Database --
CREATE DATABASE if not exists `happycook`;
USE `happycook`;

-- --------------------------------------------------------

--
-- Table structure for table `ingredient`
--

CREATE TABLE IF NOT EXISTS `ingredient` (
  `name` varchar(70) NOT NULL,
  `amount` double NOT NULL,
  `measurement` varchar(70) NOT NULL,
  `recipe_id` int(11) NOT NULL,
  KEY `ingredient_fk` (`recipe_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ingredient`
--

INSERT INTO `ingredient` (`name`, `amount`, `measurement`, `recipe_id`) VALUES
('chicken breasts', 2, '', 1),
('butter milk', 1, 'cup', 1),
('fry powder', 1, 'cup', 1),
('flour', 2, 'cups', 1),
('salt', 0, '', 1),
('whole chicken', 2, '', 2),
('ginger', 1, 'piece', 2),
('Shaoxing wine', 1, 'cup', 2),
('Chicken broth', 1, 'cup', 2),
('salt', 0, '', 3),
('yoghurt', 2, 'cups', 3),
('garlic cloves', 2, '', 3),
('lemon juice', 1, 'cup', 3),
('chicken leg', 1, '', 3),
('butter', 1, '', 3),
('vegetable oil', 3, '', 4),
('water', 2, '', 4),
('soy sauce', 1, '', 4),
('lemon pepper', 1, 'tbsp', 4),
('hot pepper sauce', 4, 'drops', 4),
('flank steak', 2, 'lbs', 4),
('beef tenderloin', 3, 'lbs', 5),
('tomato paste', 1, 'cup', 5),
('red pepper', 1, 'cup', 5),
('dried oregano', 3, 'tbsp', 5),
('pepper', 0, '', 5),
('chili powder', 2, 'tbsp', 6),
('minced garlic', 2, 'tbsp', 6),
('pork tenderloin', 2, 'lbs', 6),
('cilantro', 1, 'tbsp', 6);

-- --------------------------------------------------------

--
-- Table structure for table `recipe`
--

CREATE TABLE IF NOT EXISTS `recipe` (
  `recipe_id` int(11) NOT NULL,
  `name` varchar(70) NOT NULL,
  `cuisine` varchar(70) NOT NULL,
  `prep_time` double NOT NULL,
  `diet` varchar(70) NOT NULL,
  `cookingType` varchar(70) NOT NULL,
  `allergy` varchar(70) NOT NULL,
  `imagePath` varchar(70) NOT NULL,
  `rating` int(11) NOT NULL,
  PRIMARY KEY (`recipe_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `recipe`
--

INSERT INTO `recipe` (`recipe_id`, `name`, `cuisine`, `prep_time`, `diet`, `cookingType`, `allergy`, `imagePath`, `rating`) VALUES
(1, 'Popcorn Chicken', 'Western', 70, '', 'Lunch', '', 'images/popcornChicken.jpg', 3),
(2, 'Drunken Chicken', 'Western', 60, '', 'Dinner', '', 'images/drukenChicken.jpg', 3),
(3, 'Crispy Yogurt Chicken', 'Western', 80, '', 'Lunch', '', 'images/crispyYogurtChicken.jpg', 2),
(4, 'Beef Pin Wheels', 'Western', 25, '', 'Lunch', '', 'images/beefPinWheels.jpg', 4),
(5, 'Beef Kebab', 'Western', 60, '', 'Dinner', '', 'images/beefKebab.jpg', 4),
(6, 'Chile Pork', 'Western', 25, '', 'Lunch', '', 'images/pork.jpg', 4);

-- --------------------------------------------------------

--
-- Table structure for table `recipedetails`
--

CREATE TABLE IF NOT EXISTS `recipedetails` (
  `recipe_id` int(11) NOT NULL,
  `instruction` varchar(1000) NOT NULL,
  `nutrition` varchar(1000) NOT NULL,
  KEY `reciepdetails_fk` (`recipe_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `recipedetails`
--

INSERT INTO `recipedetails` (`recipe_id`, `instruction`, `nutrition`) VALUES
(1, '    Cut chicken breasts into 1 ½-inch pieces. Place in mixing bowl and cover with buttermilk and pureed chipotle chilis. \r\n    Cover and refrigerate overnight. Once the chicken has had time to sit in buttermilk, dredge the chicken in seasoned flour and fry in a 350 degree fryer. \r\n    Once out of fryer, season with salt, pepper and chopped cilantro.\r\n', '\r\nAmount Per Serving\r\nCalories 430 	Calories from Fat 100\r\n% Daily Value *\r\nTotal Fat 11g 	17%\r\nSaturated Fat 2.5g 	13%\r\nTrans Fat 	\r\nCholesterol 45mg 	15%\r\nSodium 6490mg 	270%\r\nPotassium 490mg 	14%\r\nTotal Carbohydrate 58g 	19%\r\nDietary Fiber 2g 	8%\r\nSugars 4g 	\r\nProtein 22g\r\nVitamin A 	10%\r\nVitamin C 	10%\r\nCalcium 	15%\r\nIron 	25%\r\n* Percent Daily Values are based on a 2,000 calorie diet. Your Daily Values may be higher or lower depending on your calorie needs.\r\n');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ingredient`
--
ALTER TABLE `ingredient`
  ADD CONSTRAINT `ingredient_fk` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`recipe_id`);

--
-- Constraints for table `recipedetails`
--
ALTER TABLE `recipedetails`
  ADD CONSTRAINT `reciepdetails_fk` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`recipe_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
