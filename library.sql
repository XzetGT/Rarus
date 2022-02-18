/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.4.21-MariaDB : Database - library
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `authors` */

CREATE TABLE `authors` (
  `authorID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  PRIMARY KEY (`authorID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `authors` */

insert  into `authors`(`authorID`,`name`,`surname`) values (1,'Имя1','Фамилия1');
insert  into `authors`(`authorID`,`name`,`surname`) values (2,'Имя2','Фамилия2');
insert  into `authors`(`authorID`,`name`,`surname`) values (3,'Имя3','Фамилия3');
insert  into `authors`(`authorID`,`name`,`surname`) values (4,'Имя4','Фамилия4');
insert  into `authors`(`authorID`,`name`,`surname`) values (5,'Имя5','Фамилия5');
insert  into `authors`(`authorID`,`name`,`surname`) values (6,'Имя6','Фамилия6');
insert  into `authors`(`authorID`,`name`,`surname`) values (7,'Имя7','Фамилия7');

/*Table structure for table `books` */

CREATE TABLE `books` (
  `bookID` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `ISBN` varchar(20) NOT NULL,
  `pages` int(11) NOT NULL,
  `publication_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`bookID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `books` */

insert  into `books`(`bookID`,`title`,`ISBN`,`pages`,`publication_date`) values (1,'Название 1','978-5-699-12014-7',300,'2022-02-17 23:12:47');
insert  into `books`(`bookID`,`title`,`ISBN`,`pages`,`publication_date`) values (2,'Название 2','978-5-695-14037-2',320,'2022-02-17 23:12:52');
insert  into `books`(`bookID`,`title`,`ISBN`,`pages`,`publication_date`) values (3,'Название 3','528-5-543-15637-4',287,'2022-02-17 23:13:04');
insert  into `books`(`bookID`,`title`,`ISBN`,`pages`,`publication_date`) values (4,'Название 4','721-5-543-32459-2',405,'2022-02-17 23:13:08');
insert  into `books`(`bookID`,`title`,`ISBN`,`pages`,`publication_date`) values (5,'Название 5','721-5-545-23677-8',555,'2022-02-17 23:13:18');

/*Table structure for table `books_authors` */

CREATE TABLE `books_authors` (
  `book_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  PRIMARY KEY (`book_id`,`author_id`),
  KEY `fk_authors` (`author_id`),
  CONSTRAINT `fk_authors` FOREIGN KEY (`author_id`) REFERENCES `authors` (`authorID`) ON DELETE CASCADE,
  CONSTRAINT `fk_book` FOREIGN KEY (`book_id`) REFERENCES `books` (`bookID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `books_authors` */

insert  into `books_authors`(`book_id`,`author_id`) values (1,3);
insert  into `books_authors`(`book_id`,`author_id`) values (1,4);
insert  into `books_authors`(`book_id`,`author_id`) values (2,1);
insert  into `books_authors`(`book_id`,`author_id`) values (3,1);
insert  into `books_authors`(`book_id`,`author_id`) values (3,2);
insert  into `books_authors`(`book_id`,`author_id`) values (4,3);
insert  into `books_authors`(`book_id`,`author_id`) values (5,2);
insert  into `books_authors`(`book_id`,`author_id`) values (5,3);

/*Table structure for table `books_genre` */

CREATE TABLE `books_genre` (
  `book_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL,
  PRIMARY KEY (`book_id`,`genre_id`),
  KEY `fk_genres` (`genre_id`),
  CONSTRAINT `fk_book_genres` FOREIGN KEY (`book_id`) REFERENCES `books` (`bookID`) ON DELETE CASCADE,
  CONSTRAINT `fk_genres` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`genreID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `books_genre` */

insert  into `books_genre`(`book_id`,`genre_id`) values (1,1);
insert  into `books_genre`(`book_id`,`genre_id`) values (1,3);
insert  into `books_genre`(`book_id`,`genre_id`) values (2,2);
insert  into `books_genre`(`book_id`,`genre_id`) values (2,4);
insert  into `books_genre`(`book_id`,`genre_id`) values (3,3);
insert  into `books_genre`(`book_id`,`genre_id`) values (4,1);
insert  into `books_genre`(`book_id`,`genre_id`) values (4,4);
insert  into `books_genre`(`book_id`,`genre_id`) values (5,1);

/*Table structure for table `genres` */

CREATE TABLE `genres` (
  `genreID` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`genreID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `genres` */

insert  into `genres`(`genreID`,`title`) values (1,'Фантастика');
insert  into `genres`(`genreID`,`title`) values (2,'Фентези');
insert  into `genres`(`genreID`,`title`) values (3,'Детектив');
insert  into `genres`(`genreID`,`title`) values (4,'Приключения');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
