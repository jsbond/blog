create database site default character set utf8 DEFAULT COLLATE utf8_general_ci;

use site;

CREATE TABLE `categories` (
  `id` bigint(20) not NULL AUTO_INCREMENT,
  `name` VARCHAR(30) not NULL ,
  PRIMARY KEY (`id`),
  UNIQUE (`name`)
)
  ENGINE = innoDB
  DEFAULT CHAR SET = utf8;

CREATE TABLE `photos` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `url` VARCHAR(50) not NULL ,
  PRIMARY KEY (`id`),
  UNIQUE (`url`)
)
  ENGINE = innoDB
  DEFAULT CHAR SET = utf8;

CREATE TABLE `series` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(30) not NULL ,
  `photo_id` BIGINT(20) NOT NULL,
  `category_id` bigint(20),
  PRIMARY KEY (`id`),
  CONSTRAINT `PHOTOS_SERIES` FOREIGN KEY (`photo_id`) REFERENCES `photos` (`id`),
  CONSTRAINT `CATEGORIES_SERIES` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
)
  ENGINE = innoDB
  DEFAULT CHAR SET = utf8;

CREATE TABLE `categories_photos` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) not NULL,
  `photo_id` BIGINT(20) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `PHOTOS_CATEGORIES_PHOTOS` FOREIGN KEY (`photo_id`) REFERENCES `photos` (`id`),
  CONSTRAINT `CATEGORIES_CATEGORIES_PHOTOS` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
)
  ENGINE = innoDB
  DEFAULT CHAR SET = utf8;

ALTER TABLE `photos` ADD COLUMN `text` VARCHAR(100);

CREATE TABLE `series_photos` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `series_id` bigint(20) not NULL,
  `photo_id` BIGINT(20) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `PHOTOS_SERIES_PHOTOS` FOREIGN KEY (`photo_id`) REFERENCES `photos` (`id`),
  CONSTRAINT `SERIES_SERIES_PHOTOS` FOREIGN KEY (`series_id`) REFERENCES `series` (`id`)
)
  ENGINE = innoDB
  DEFAULT CHAR SET = utf8;

ALTER TABLE `photos` ADD COLUMN `enabled` int not null DEFAULT 1;
ALTER TABLE `series` ADD COLUMN `enabled` int not null DEFAULT 0;
ALTER TABLE `categories` ADD COLUMN `enabled` int not null DEFAULT 0;

ALTER TABLE `photos` ADD COLUMN `created_at` DATETIME;
ALTER TABLE `photos` ADD COLUMN `titul` DATETIME;

ALTER TABLE photos change enabled status int(2) DEFAULT 1;

insert into `photos` (url, status) values ("test", 0);

ALTER TABLE photos change status status int(2) default 1;

CREATE TABLE `pages` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(30) not NULL ,
  `status` int(2) not NULL,
  `titul_photo_id` BIGINT(20) not NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `PHOTOS_PAGES` FOREIGN KEY (`titul_photo_id`) REFERENCES `photos` (`id`)
)
  ENGINE = innoDB
  DEFAULT CHAR SET = utf8;

CREATE TABLE `page_interactions` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `parent_page_id` BIGINT(20) NOT NULL,
  `child_page_id` BIGINT(20) NOT NULL,
  PRIMARY KEY (`id`)
)
  ENGINE = innoDB
  DEFAULT CHAR SET = utf8;

CREATE TABLE `pages_photos` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `page_id` bigint(20) not NULL,
  `photo_id` BIGINT(20) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `PHOTOS_PAGES_PHOTOS` FOREIGN KEY (`photo_id`) REFERENCES `photos` (`id`),
  CONSTRAINT `PAGES_PAGES_PHOTOS` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`)
)
  ENGINE = innoDB
  DEFAULT CHAR SET = utf8;

ALTER TABLE `pages` ADD COLUMN `type` int(2) not null DEFAULT 1;
ALTER TABLE `pages` ADD COLUMN `category` int(1) not null DEFAULT 0;
ALTER TABLE `pages` ADD COLUMN `enabled` int not null DEFAULT 0;
ALTER TABLE `pages` ADD COLUMN `created_at` DATETIME;


