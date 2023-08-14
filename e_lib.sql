/*
SQLyog Community v13.2.0 (64 bit)
MySQL - 8.0.30 : Database - e_lib
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`e_lib` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `e_lib`;

/*Table structure for table `authors` */

DROP TABLE IF EXISTS `authors`;

CREATE TABLE `authors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `author_name` varchar(50) DEFAULT NULL,
  `author_url` varchar(50) DEFAULT NULL,
  `active` int DEFAULT '1',
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `authors` */

insert  into `authors`(`id`,`author_name`,`author_url`,`active`,`timestamp`) values 
(1,'Author 1','author_1',1,'2023-08-13 11:36:44'),
(2,'Author 2','author_2',1,'2023-08-13 13:00:32'),
(3,'Author 3','author_3',1,'2023-08-13 13:00:32'),
(4,'Author 4','author_4',1,'2023-08-13 13:00:33');

/*Table structure for table `books` */

DROP TABLE IF EXISTS `books`;

CREATE TABLE `books` (
  `id` int NOT NULL AUTO_INCREMENT,
  `author_id` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `publisher_id` int DEFAULT NULL,
  `book_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `book_price` varchar(50) DEFAULT NULL,
  `book_image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `book_description` text,
  `book_url` varchar(50) DEFAULT NULL,
  `book_file` varchar(100) DEFAULT NULL,
  `is_downloadable` int DEFAULT '0',
  `read_online` int DEFAULT '1',
  `active` int DEFAULT '1',
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `books` */

insert  into `books`(`id`,`author_id`,`category_id`,`publisher_id`,`book_name`,`book_price`,`book_image`,`stock`,`book_description`,`book_url`,`book_file`,`is_downloadable`,`read_online`,`active`,`timestamp`) values 
(1,1,1,1,'The Beautiful Invisible Vignale Giovanni ',NULL,'the_beautiful_invisible_vignale_giovanni.png',NULL,'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Enim cum saepe tenetur ducimus eius sapiente vero odio laboriosam maxime numquam inventore et dolores nobis, tempore praesentium ipsam, repellat deserunt porro omnis doloribus! Doloremque voluptatibus reiciendis eum! Amet et quam laborum quae alias at, minima incidunt voluptates sequi voluptate, vero possimus!','the-beautiful-invisible-vignale-giovanni','the_beautiful_invisible_vignale_giovanni.pdf',0,1,1,'2023-08-09 23:33:58'),
(2,1,1,1,'Concepts Of Physics Part 1',NULL,'concepts_of_physics_part_1_h_c_verma.png',NULL,'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Enim cum saepe tenetur ducimus eius sapiente vero odio laboriosam maxime numquam inventore et dolores nobis, tempore praesentium ipsam, repellat deserunt porro omnis doloribus! Doloremque voluptatibus reiciendis eum! Amet et quam laborum quae alias at, minima incidunt voluptates sequi voluptate, vero possimus!','concepts-of-physics','concepts_of_physics_part_1_h_c_verma.pdf',0,1,1,'2023-08-09 23:34:00'),
(3,1,1,1,'Psychology',NULL,'psychology.png',NULL,'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Enim cum saepe tenetur ducimus eius sapiente vero odio laboriosam maxime numquam inventore et dolores nobis, tempore praesentium ipsam, repellat deserunt porro omnis doloribus! Doloremque voluptatibus reiciendis eum! Amet et quam laborum quae alias at, minima incidunt voluptates sequi voluptate, vero possimus!','psychology','psychology_daniel_l_schacter.pdf',0,1,1,'2023-08-09 23:34:00'),
(4,1,1,1,'How To Write Better Essays',NULL,'how_to_write_better_essays.png',NULL,'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Enim cum saepe tenetur ducimus eius sapiente vero odio laboriosam maxime numquam inventore et dolores nobis, tempore praesentium ipsam, repellat deserunt porro omnis doloribus! Doloremque voluptatibus reiciendis eum! Amet et quam laborum quae alias at, minima incidunt voluptates sequi voluptate, vero possimus!','how-to-write-better-essays','how_to_write_better_essays_bryan_greetham.pdf',0,1,1,'2023-08-09 23:34:01'),
(5,1,1,1,'Nuclear Physics',NULL,'nuclear_physics.png',NULL,'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Enim cum saepe tenetur ducimus eius sapiente vero odio laboriosam maxime numquam inventore et dolores nobis, tempore praesentium ipsam, repellat deserunt porro omnis doloribus! Doloremque voluptatibus reiciendis eum! Amet et quam laborum quae alias at, minima incidunt voluptates sequi voluptate, vero possimus!','nuclear-physics','nuclear_physics_werner_heisenberg.pdf',0,1,1,'2023-08-09 23:34:03'),
(6,1,1,1,'Physical Chemistry',NULL,'physical_chemistry.png',NULL,'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Enim cum saepe tenetur ducimus eius sapiente vero odio laboriosam maxime numquam inventore et dolores nobis, tempore praesentium ipsam, repellat deserunt porro omnis doloribus! Doloremque voluptatibus reiciendis eum! Amet et quam laborum quae alias at, minima incidunt voluptates sequi voluptate, vero possimus!','physical-chemistry','physical_chemistry_donald_a_mcquarrie.pdf',0,1,1,'2023-08-09 23:34:03'),
(7,1,1,1,'Physics In Minutes',NULL,'physics_in_minutes.png',NULL,'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Enim cum saepe tenetur ducimus eius sapiente vero odio laboriosam maxime numquam inventore et dolores nobis, tempore praesentium ipsam, repellat deserunt porro omnis doloribus! Doloremque voluptatibus reiciendis eum! Amet et quam laborum quae alias at, minima incidunt voluptates sequi voluptate, vero possimus!','physics-in-minutes','physics_in_minutes_giles_sparrow.pdf',0,1,1,'2023-08-09 23:34:04'),
(8,1,1,1,'Neural Netwroks And Deep Learning',NULL,'neural_networks_and_deep_learning.png',NULL,'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Enim cum saepe tenetur ducimus eius sapiente vero odio laboriosam maxime numquam inventore et dolores nobis, tempore praesentium ipsam, repellat deserunt porro omnis doloribus! Doloremque voluptatibus reiciendis eum! Amet et quam laborum quae alias at, minima incidunt voluptates sequi voluptate, vero possimus!','neural-networks-and-deep-leaning','neural_networks_and_deep_learning_charu_c_aggarwal.pdf',0,1,1,'2023-08-09 23:34:04'),
(9,2,2,2,'Computer Networks',NULL,'computer_networks.png',NULL,'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Enim cum saepe tenetur ducimus eius sapiente vero odio laboriosam maxime numquam inventore et dolores nobis, tempore praesentium ipsam, repellat deserunt porro omnis doloribus! Doloremque voluptatibus reiciendis eum! Amet et quam laborum quae alias at, minima incidunt voluptates sequi voluptate, vero possimus!','computer-networks','computer_networks_andrew_s_tanenbaum.pdf',0,1,1,'2023-08-12 01:08:58'),
(10,2,2,2,'Cracking The Coding Interview',NULL,'cracking_the_coding_interview.png',NULL,'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Enim cum saepe tenetur ducimus eius sapiente vero odio laboriosam maxime numquam inventore et dolores nobis, tempore praesentium ipsam, repellat deserunt porro omnis doloribus! Doloremque voluptatibus reiciendis eum! Amet et quam laborum quae alias at, minima incidunt voluptates sequi voluptate, vero possimus!','cracking-the-coding-interview','cracking_the_coding_interview_gayle_laakmann_mcdowell.pdf',0,1,1,'2023-08-12 01:08:59'),
(11,2,2,2,'Cybersecurity Public Policy',NULL,'cybersecurity_public_policy.png',NULL,'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Enim cum saepe tenetur ducimus eius sapiente vero odio laboriosam maxime numquam inventore et dolores nobis, tempore praesentium ipsam, repellat deserunt porro omnis doloribus! Doloremque voluptatibus reiciendis eum! Amet et quam laborum quae alias at, minima incidunt voluptates sequi voluptate, vero possimus!','cybersecurity-public-policy','cybersecurity_public_policy_bradley_fowler_kennedy_maranga.pdf',0,1,1,'2023-08-12 01:09:00'),
(12,2,2,2,'How Linux Works',NULL,'how_linux_works.png',NULL,'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Enim cum saepe tenetur ducimus eius sapiente vero odio laboriosam maxime numquam inventore et dolores nobis, tempore praesentium ipsam, repellat deserunt porro omnis doloribus! Doloremque voluptatibus reiciendis eum! Amet et quam laborum quae alias at, minima incidunt voluptates sequi voluptate, vero possimus!','how-linux-works','how_linux_works_3rd_edition_brian_ward.pdf',0,1,1,'2023-08-12 01:09:01'),
(13,2,2,2,'Modern Javascript For The Impatient',NULL,'modern_javascript_for_the_impatien.png',NULL,'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Enim cum saepe tenetur ducimus eius sapiente vero odio laboriosam maxime numquam inventore et dolores nobis, tempore praesentium ipsam, repellat deserunt porro omnis doloribus! Doloremque voluptatibus reiciendis eum! Amet et quam laborum quae alias at, minima incidunt voluptates sequi voluptate, vero possimus!','modern-javascript-for-the-impatient','modern_javascript_for_the_impatient_cay_horstmann.pdf',0,1,1,'2023-08-12 01:09:01'),
(14,2,2,2,'Modern PHP',NULL,'modern_php.png',NULL,'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Enim cum saepe tenetur ducimus eius sapiente vero odio laboriosam maxime numquam inventore et dolores nobis, tempore praesentium ipsam, repellat deserunt porro omnis doloribus! Doloremque voluptatibus reiciendis eum! Amet et quam laborum quae alias at, minima incidunt voluptates sequi voluptate, vero possimus!','modern-php','modern_php_new_features_and_good_practices_josh_lockhart.pdf',0,1,1,'2023-08-12 01:09:02'),
(15,2,2,2,'Object-Oriented Programing In C++',NULL,'object_oriented_programming_in_c.png',NULL,'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Enim cum saepe tenetur ducimus eius sapiente vero odio laboriosam maxime numquam inventore et dolores nobis, tempore praesentium ipsam, repellat deserunt porro omnis doloribus! Doloremque voluptatibus reiciendis eum! Amet et quam laborum quae alias at, minima incidunt voluptates sequi voluptate, vero possimus!','object-oriented-programming-in-c','object_oriented_programming_in_c_robert_lafore.pdf',0,1,1,'2023-08-12 01:09:02'),
(16,2,2,2,'The Book Of CSS3',NULL,'the_book_of_css3.png',NULL,'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Enim cum saepe tenetur ducimus eius sapiente vero odio laboriosam maxime numquam inventore et dolores nobis, tempore praesentium ipsam, repellat deserunt porro omnis doloribus! Doloremque voluptatibus reiciendis eum! Amet et quam laborum quae alias at, minima incidunt voluptates sequi voluptate, vero possimus!','the-book-of-css3','the_book_of_css3_2nd_edition_peter_gasston.pdf',0,1,1,'2023-08-12 01:09:03'),
(17,3,3,3,'Quranan Ajaba Para 01',NULL,'quranan_ajabaa_para_01.png',NULL,'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Enim cum saepe tenetur ducimus eius sapiente vero odio laboriosam maxime numquam inventore et dolores nobis, tempore praesentium ipsam, repellat deserunt porro omnis doloribus! Doloremque voluptatibus reiciendis eum! Amet et quam laborum quae alias at, minima incidunt voluptates sequi voluptate, vero possimus!','quranan-ajabaa-para-01','quranan_ajabaa_para_01_final.pdf',0,1,1,'2023-08-12 01:22:03'),
(18,3,3,3,'Quranan Ajaba Para 02',NULL,'quranan_ajabaa_para_02.png',NULL,'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Enim cum saepe tenetur ducimus eius sapiente vero odio laboriosam maxime numquam inventore et dolores nobis, tempore praesentium ipsam, repellat deserunt porro omnis doloribus! Doloremque voluptatibus reiciendis eum! Amet et quam laborum quae alias at, minima incidunt voluptates sequi voluptate, vero possimus!','quranan-ajabaa-para-02','quranan_ajabaa_para_02_final.pdf',0,1,1,'2023-08-12 01:22:03'),
(19,3,3,3,'Quranan Ajaba Para 03',NULL,'quranan_ajabaa_para_03.png',NULL,'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Enim cum saepe tenetur ducimus eius sapiente vero odio laboriosam maxime numquam inventore et dolores nobis, tempore praesentium ipsam, repellat deserunt porro omnis doloribus! Doloremque voluptatibus reiciendis eum! Amet et quam laborum quae alias at, minima incidunt voluptates sequi voluptate, vero possimus!','quranan-ajabaa-para-03','quranan_ajabaa_para_03_final.pdf',0,1,1,'2023-08-12 01:22:04'),
(20,3,3,3,'Quranan Ajaba Para 04',NULL,'quranan_ajabaa_para_04.png',NULL,'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Enim cum saepe tenetur ducimus eius sapiente vero odio laboriosam maxime numquam inventore et dolores nobis, tempore praesentium ipsam, repellat deserunt porro omnis doloribus! Doloremque voluptatibus reiciendis eum! Amet et quam laborum quae alias at, minima incidunt voluptates sequi voluptate, vero possimus!','quranan-ajabaa-para-04','quranan_ajabaa_para_04_final.pdf',0,1,1,'2023-08-12 01:22:05'),
(21,3,3,3,'Quranan Ajaba Para 05',NULL,'quranan_ajabaa_para_05.png',NULL,'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Enim cum saepe tenetur ducimus eius sapiente vero odio laboriosam maxime numquam inventore et dolores nobis, tempore praesentium ipsam, repellat deserunt porro omnis doloribus! Doloremque voluptatibus reiciendis eum! Amet et quam laborum quae alias at, minima incidunt voluptates sequi voluptate, vero possimus!','quranan-ajabaa-para-05','quranan_ajabaa_para_05_final.pdf',0,1,1,'2023-08-12 01:22:06'),
(22,3,3,3,'Quranan Ajaba Para 06',NULL,'quranan_ajabaa_para_06.png',NULL,'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Enim cum saepe tenetur ducimus eius sapiente vero odio laboriosam maxime numquam inventore et dolores nobis, tempore praesentium ipsam, repellat deserunt porro omnis doloribus! Doloremque voluptatibus reiciendis eum! Amet et quam laborum quae alias at, minima incidunt voluptates sequi voluptate, vero possimus!','quranan-ajabaa-para-06','quranan_ajabaa_para_06_final.pdf',0,1,1,'2023-08-12 01:22:07'),
(23,3,3,3,'Quranan Ajaba Para 07',NULL,'quranan_ajabaa_para_07.png',NULL,'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Enim cum saepe tenetur ducimus eius sapiente vero odio laboriosam maxime numquam inventore et dolores nobis, tempore praesentium ipsam, repellat deserunt porro omnis doloribus! Doloremque voluptatibus reiciendis eum! Amet et quam laborum quae alias at, minima incidunt voluptates sequi voluptate, vero possimus!','quranan-ajabaa-para-07','quranan_ajabaa_para_07_final.pdf',0,1,1,'2023-08-12 01:22:07'),
(24,3,3,3,'Quranan Ajaba Para 08',NULL,'quranan_ajabaa_para_08.png',NULL,'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Enim cum saepe tenetur ducimus eius sapiente vero odio laboriosam maxime numquam inventore et dolores nobis, tempore praesentium ipsam, repellat deserunt porro omnis doloribus! Doloremque voluptatibus reiciendis eum! Amet et quam laborum quae alias at, minima incidunt voluptates sequi voluptate, vero possimus!','quranan-ajabaa-para-08','quranan_ajabaa_para_08_final.pdf',0,1,1,'2023-08-12 01:22:08'),
(25,4,4,4,'Batman Begins',NULL,'batman_begins.png',NULL,'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Enim cum saepe tenetur ducimus eius sapiente vero odio laboriosam maxime numquam inventore et dolores nobis, tempore praesentium ipsam, repellat deserunt porro omnis doloribus! Doloremque voluptatibus reiciendis eum! Amet et quam laborum quae alias at, minima incidunt voluptates sequi voluptate, vero possimus!','batman-begins','batman_begins_dennis_oneil.pdf',0,1,1,'2023-08-12 01:25:59'),
(26,4,4,4,'How To Tell If Your Cat Is Plotting To Kill You',NULL,'how_to_tell_if_your_cat_is_plotting_to_kill_you.png',NULL,'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Enim cum saepe tenetur ducimus eius sapiente vero odio laboriosam maxime numquam inventore et dolores nobis, tempore praesentium ipsam, repellat deserunt porro omnis doloribus! Doloremque voluptatibus reiciendis eum! Amet et quam laborum quae alias at, minima incidunt voluptates sequi voluptate, vero possimus!','how-to-tell-if-your-cat-is-plotting-to-kill-you','how_to_tell_if_your_cat_is_plotting_to_kill_you_the_oatmeal.pdf',0,1,1,'2023-08-12 01:30:47'),
(27,4,4,4,'Minions',NULL,'minions.png',NULL,'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Enim cum saepe tenetur ducimus eius sapiente vero odio laboriosam maxime numquam inventore et dolores nobis, tempore praesentium ipsam, repellat deserunt porro omnis doloribus! Doloremque voluptatibus reiciendis eum! Amet et quam laborum quae alias at, minima incidunt voluptates sequi voluptate, vero possimus!','minions','minions_renaud_collin.pdf',0,1,1,'2023-08-12 01:30:48'),
(28,4,4,4,'The Flash Hocus Pocus',NULL,'the_flash_hocus_pocus.png',NULL,'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Enim cum saepe tenetur ducimus eius sapiente vero odio laboriosam maxime numquam inventore et dolores nobis, tempore praesentium ipsam, repellat deserunt porro omnis doloribus! Doloremque voluptatibus reiciendis eum! Amet et quam laborum quae alias at, minima incidunt voluptates sequi voluptate, vero possimus!','the-flash-hocus-pocus','the_flash__hocus_pocus_barry_lyga.pdf',0,1,1,'2023-08-12 01:30:48'),
(29,4,4,4,'The Flash The Tornado Twins The Flash',NULL,'the_flash_the_tornado_twins_the_flash.png',NULL,'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Enim cum saepe tenetur ducimus eius sapiente vero odio laboriosam maxime numquam inventore et dolores nobis, tempore praesentium ipsam, repellat deserunt porro omnis doloribus! Doloremque voluptatibus reiciendis eum! Amet et quam laborum quae alias at, minima incidunt voluptates sequi voluptate, vero possimus!','the-flash-the-tornado-twins-the-flash','the_flash_the_tornado_twins_the_flash_bo_barry_lyga.pdf',0,1,1,'2023-08-12 01:30:49'),
(30,4,4,4,'The Flash 2 Johnny Quick',NULL,'the_flash_2_johnny_quick.png',NULL,'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Enim cum saepe tenetur ducimus eius sapiente vero odio laboriosam maxime numquam inventore et dolores nobis, tempore praesentium ipsam, repellat deserunt porro omnis doloribus! Doloremque voluptatibus reiciendis eum! Amet et quam laborum quae alias at, minima incidunt voluptates sequi voluptate, vero possimus!','the-flash-2-johnny-quick','the_flash_2_johnny_quick_barry_lyga.pdf',0,1,1,'2023-08-12 01:30:50'),
(31,4,4,4,'The Incredible Hulk',NULL,'the_incredible_hulk.png',NULL,'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Enim cum saepe tenetur ducimus eius sapiente vero odio laboriosam maxime numquam inventore et dolores nobis, tempore praesentium ipsam, repellat deserunt porro omnis doloribus! Doloremque voluptatibus reiciendis eum! Amet et quam laborum quae alias at, minima incidunt voluptates sequi voluptate, vero possimus!','the-incredible-hulk','the_incredible_hulk_greg_pak.pdf',0,1,1,'2023-08-12 01:30:51'),
(32,4,4,4,'Avatar',NULL,'avatar.png',NULL,'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Enim cum saepe tenetur ducimus eius sapiente vero odio laboriosam maxime numquam inventore et dolores nobis, tempore praesentium ipsam, repellat deserunt porro omnis doloribus! Doloremque voluptatibus reiciendis eum! Amet et quam laborum quae alias at, minima incidunt voluptates sequi voluptate, vero possimus!','avatar','avatar_bryan_konietzko.pdf',0,1,1,'2023-08-12 01:30:51'),
(33,2,1,1,'Dummy Book Name 123',NULL,'dummy_book_name.png',NULL,'This is book description that is just dummy data','dummy-book-name-123','dummy_book_name.pdf',1,1,1,'2023-08-14 10:29:18');

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) DEFAULT NULL,
  `category_img` varchar(50) DEFAULT NULL,
  `category_url` varchar(50) DEFAULT NULL,
  `category_description` text,
  `active` int DEFAULT '1',
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `category` */

insert  into `category`(`id`,`category_name`,`category_img`,`category_url`,`category_description`,`active`,`timestamp`) values 
(1,'Academics',NULL,'academics','This is academics description',1,'2023-08-05 19:10:12'),
(2,'Information Technology',NULL,'information-technology','This is Information Technology Details',1,'2023-08-05 19:11:31'),
(3,'Islamic',NULL,'islamic','This is islamic description',1,'2023-08-05 19:11:47'),
(4,'Stories',NULL,'stories','This is stories description',1,'2023-08-05 19:12:28');

/*Table structure for table `contact_us` */

DROP TABLE IF EXISTS `contact_us`;

CREATE TABLE `contact_us` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `message` text,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `contact_us` */

insert  into `contact_us`(`id`,`name`,`email`,`phone`,`message`,`timestamp`) values 
(1,'klmkm','kmklm@fjf.cuy','6769','dfcb.m  n ','2023-08-12 17:19:50');

/*Table structure for table `publishers` */

DROP TABLE IF EXISTS `publishers`;

CREATE TABLE `publishers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `publisher_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `publisher_url` varchar(50) DEFAULT NULL,
  `active` int DEFAULT '1',
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `publishers` */

insert  into `publishers`(`id`,`publisher_name`,`publisher_url`,`active`,`timestamp`) values 
(1,'Publisher 1','publisher_1',1,'2023-08-13 13:00:50'),
(2,'Publisher 2','publisher_2',1,'2023-08-13 13:01:14'),
(3,'Publisher 3','publisher_3',1,'2023-08-13 13:01:16'),
(4,'Publisher 4','publisher_4',1,'2023-08-13 13:01:28');

/*Table structure for table `subscribed_email` */

DROP TABLE IF EXISTS `subscribed_email`;

CREATE TABLE `subscribed_email` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(50) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `subscribed_email` */

insert  into `subscribed_email`(`id`,`email`,`timestamp`) values 
(1,'test@gmail.com','2023-08-12 17:20:29');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` text,
  `role` int DEFAULT '1',
  `active` int DEFAULT '1',
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`email`,`password`,`phone`,`address`,`role`,`active`,`timestamp`) values 
(1,'test','test@gmail.com','cc03e747a6afbbcbf8be7668acfebee5','0123456789',NULL,1,1,'2023-08-13 18:39:52'),
(2,'Admin','admin@gmail.com','0192023a7bbd73250516f069df18b500','0123456789',NULL,0,1,'2023-08-13 20:57:18');

/*Table structure for table `videos` */

DROP TABLE IF EXISTS `videos`;

CREATE TABLE `videos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int DEFAULT NULL,
  `video_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `active` int DEFAULT '1',
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `videos` */

insert  into `videos`(`id`,`category_id`,`video_name`,`active`,`timestamp`) values 
(1,1,'category_1.mp4',1,'2023-08-13 20:28:00'),
(2,2,'category_2.mp4',1,'2023-08-13 20:28:02'),
(3,3,'category_3.mp4',1,'2023-08-13 20:28:06'),
(4,4,'category_4.mp4',1,'2023-08-13 20:28:08'),
(5,2,'information_technology.mp4',1,'2023-08-14 10:57:33');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
