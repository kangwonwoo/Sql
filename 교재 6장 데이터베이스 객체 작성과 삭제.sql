#날짜 : 2022/06/22
#이름 : 강원우
#내용 : 교재 6장 데이터베이스 설계

###############################
#26강 테이블 작성,삭제,변경
###############################

CREATE TABLE `sample62`(
	`no` INTEGER NOT NULL,
	`a`  VARCHAR(30),
	`b`  DATE
);

DESC `sample62`;
#p234

ALTER TABLE `sample62` ADD newcol INTEGER;

DESC `sample62`;
#p237

ALTER TABLE `sample62` modify newcol VARCHAR(20);

DESC `sample62`;
#p238

ALTER TABLE `sample62` CHANGE newcol c VARCHAR(20);

DESC `sample62`;

ALTER TABLE `sample62` DROP c;

DESC `sample62`;
#p239

###############################
#27강 제약
###############################

CREATE TABLE `sample631`(
	`a` INTEGER NOT NULL,
	`b` INTEGER NOT NULL UNIQUE,
	`c` VARCHAR(30)
);

CREATE TABLE `sample632`(
	`no` INTEGER NOT NULL,
	`sub_no` INTEGER NOT NULL,
	`name` VARCHAR(30),
	PRIMARY KEY (`no`, `sub_no`)
);
#p243

CREATE TABLE `sample632`(
	`no` INTEGER NOT NULL,
	`sub_no` INTEGER NOT NULL,
	`name` VARCHAR(30),
	constraint pkey_sample PRIMARY KEY (`no`, `sub_no`)
);

#C열에 not null 제약걸기
ALTER TABLE `sample631` MODIFY c VARCHAR(30) NOT NULL; 
#p244

#기본키 제약 추가하기
ALTER TABLE `sample631` ADD CONSTRAINT pkey_sample631 PRIMARY KEY(a);

#C열의 not null 제약 없애기
ALTER TABLE `sample631` MODIFY c VARCHAR(30);

#pkey_sample631 제약 삭제하기
ALTER TABLE `sample631` DROP CONSTRAINT pkey_sample631;

#기본키 제약 삭제하기
ALTER TABLE `sample631` DROP PRIMARY KEY;
#p245

CREATE TABLE `sample634`(
	`p` INTEGER NOT NULL,
	`a` VARCHAR(30),
	constraint pkey_sample634 PRIMARY KEY (p)
);
#p246

INSERT INTO `sample634` VALUES (1, '첫째줄');
INSERT INTO `sample634` VALUES (2, '둘째줄');
INSERT INTO `sample634` VALUES (3, '셋째줄');

INSERT INTO `sample634` VALUES (2, '넷째줄');

ERROR 1062 (23000): DUPLICATE entry '2' for key 'PRIMARY'

UPDATE `sample634` SET `p`=2 WHERE `p`=3;
#p247

CREATE TABLE `sample635` (
	`a`  INT NOT NULL,
	`b`  INT NOT NULL
);

INSERT INTO `sample635` VALUES (1, 1);
INSERT INTO `sample635` VALUES (1, 2);
INSERT INTO `sample635` VALUES (1, 3);
INSERT INTO `sample635` VALUES (2, 1);
INSERT INTO `sample635` VALUES (2, 2);

SELECT a, b FROM `sample635`;
#p248

###############################
#29강 인덱스 작성과 삭제
###############################

CREATE INDEX `isample65` ON `sample62`(NO);
#p258

DROP INDEX `isample65` ON `sample62`;
#p259

EXPLAIN SELECT * FROM `sample62` WHERE `a`='a';
#p260

EXPLAIN SELECT * FROM `sample62` WHERE NO > 10;
#p261

###############################
#30강 뷰 작성과 삭제
###############################

CREATE VIEW `sample_view_67` AS SELECT * FROM `sample54`;

SELECT * FROM `sample_view_67;
#p266

CREATE VIEW `sample_view_67`(n, v, v2) AS
 SELECT NO, a, a*2 FROM `sample54`;
 SELECT * FROM `sample_view_672` WHERE n=1;
 
 DROP VIEW `sample_view_67;
#p267
