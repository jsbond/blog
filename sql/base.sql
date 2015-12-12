create database site default character set utf8 DEFAULT COLLATE utf8_general_ci;

use site;

CREATE TABLE `photos` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
)
  ENGINE = innoDB
  DEFAULT CHAR SET = utf8;

ALTER TABLE `photos` ADD COLUMN `text` VARCHAR(100);
ALTER TABLE `photos` ADD COLUMN `enabled` int not null DEFAULT 1;
ALTER TABLE `photos` ADD COLUMN `created_at` DATETIME;

ALTER TABLE photos change enabled status int(2) DEFAULT 1;

insert into `photos` (status) values (0);

ALTER TABLE photos change status status int(2) default 1;

CREATE TABLE `pages` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(30) not NULL ,
  `status` int(2) not NULL,
  `titul_photo_id` BIGINT(20),
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
ALTER TABLE `pages` ADD COLUMN `enabled` int not null DEFAULT 0;
ALTER TABLE `pages` ADD COLUMN `created_at` DATETIME;
ALTER TABLE `pages` ADD COLUMN `category` int(2) NOT NULL DEFAULT 0;


