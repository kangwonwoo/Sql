#날짜 : 2022/06/16
#이름 : 강원우
#내용 : 교재 3장 정렬과 연산

#테이블 생성/데이터 저장
CREATE TABLE `sample31`(
	`name`    VARCHAR(10),
	`age`     TINYINT,
	`address` VARCHAR(255)
);

INSERT INTO `sample31` VALUES ('A씨', 36, '대구광역시 중구');
INSERT INTO `sample31` VALUES ('B씨', 18, '부산광역시 연제구');
INSERT INTO `sample31` VALUES ('C씨', 25, '서울특별시 중구');

SELECT * FROM `sample31`;

SELECT * FROM `sample31` ORDER BY `age`;
#95

SELECT * FROM `sample31`;
SELECT * FROM `sample31` ORDER BY `address`;
#96

SELECT * FROM `sample31` ORDER BY `age` DESC;
SELECT * FROM `sample31` ORDER BY `age` ASC;
#98

DROP TABLE `sample33`;
#테이블 생성/데이터 저장
CREATE TABLE `sample32` (
	`a` VARCHAR(10),
	`b` INTEGER
);

INSERT INTO `sample32` VALUES (1, 1);
INSERT INTO `sample32` VALUES (2, 2);
INSERT INTO `sample32` VALUES (10, 10);
INSERT INTO `sample32` VALUES (11, 11);

SELECT * FROM `sample32`;

SELECT * FROM `sample32` ORDER BY a;

SELECT * FROM `sample32` ORDER BY b;
#100


#테이블 생성/데이터 저장
CREATE TABLE `sample33` (
	`a` INTEGER,
	`b` INTEGER
);

INSERT INTO `sample33` VALUES (1, 1);
INSERT INTO `sample33` VALUES (2, 1);
INSERT INTO `sample33` VALUES (2, 2);
INSERT INTO `sample33` VALUES (1, 3);
INSERT INTO `sample33` VALUES (1, 2);
#103

SELECT * FROM `sample33` ORDER BY a;
#104

SELECT * FROM `sample33` ORDER BY a, b;
SELECT * FROM `sample33` ORDER BY b, a;
#105

SELECT * FROM `sample33` ORDER BY a ASC, b DESC;
#106


#테이블 생성/데이터 저장
CREATE TABLE `sample34` (
	`no` INT
);

INSERT INTO `sample34` VALUE (1);
INSERT INTO `sample34` VALUE (2);
INSERT INTO `sample34` VALUE (3);
INSERT INTO `sample34` VALUE (4);
INSERT INTO `sample34` VALUE (5);
INSERT INTO `sample34` VALUE (6);
INSERT INTO `sample34` VALUE (7);

SELECT * FROM `sample34`;
#109

SELECT * FROM `sample34` LIMIT 3;
#110

SELECT * FROM `sample34` ORDER BY NO DESC	LIMIT 3;
#111

SELECT * FROM `sample34` LIMIT 3 OFFSET 0;
SELECT * FROM `sample34` LIMIT 3 OFFSET 3;
#113


#테이블 생성/데이터 저장
CREATE TABLE `sample341` (
	`no`	 	 INT AUTO_INCREMENT PRIMARY KEY,
	`price`   INT,
	`quantity`INT
);

DROP TABLE `sample35`;
INSERT INTO `sample341` VALUE (1, 100, 10);
INSERT INTO `sample341` VALUE (2, 230, 24);
INSERT INTO `sample341` VALUE (3, 1980, 1);

SELECT * FROM `sample341`;
#117

SELECT *, price * quantity FROM `sample341`;
SELECT *, price * quantity AS amount FROM `sample341`;
#118

SELECT *, price * quantity as amount FROM `sample341`;
SELECT *, price * quantity as amount FROM `sample341`
WHERE price * quantity >= 2000;
#121

SELECT *, price * quantity as amount FROM `sample341`;
SELECT *, price * quantity as amount FROM `sample341` 
ORDER BY price * quantity DESC;
#124

SELECT *, price * quantity as amount FROM `sample341`;
SELECT *, price * quantity as amount FROM `sample341`
ORDER BY amount DESC;
#125


#테이블 생성/데이터 저장
CREATE TABLE `sample35` (
	`no`       INT,
	`price`    INT,
	`quantity` INTEGER,
	`unit`     VARCHAR(10)
);

INSERT INTO `sample35` VALUE (1, 100, 10, '개');
INSERT INTO `sample35` VALUE (2, 230, 24, '캔');
INSERT INTO `sample35` VALUE (3, 1980, 1, '장');

SELECT * FROM `sample35`;
SELECT CONCAT(quantity, unit) FROM `sample35`;
#132

SELECT CURRENT_TIMESTAMP;
#137

SELECT CURRENT_DATE + INTERVAL 1 DAY;
#139


#테이블 생성/데이터 저장
CREATE TABLE `sample37` (
	`a` INT DEFAULT NULL
);

INSERT INTO `sample37` VALUE (1);
INSERT INTO `sample37` VALUE (2);
INSERT INTO `sample37` VALUE ();

SELECT a FROM `sample37`;

SELECT a, case when a IS NULL then 0 ELSE a END "a(null=0)" FROM `sample37`;

SELECT a, COALESCE(a, 0) FROM `sample37`;
#142

SELECT a AS "코드",
case
	when a = 1 then '남자'
	when a = 2 then '여자'
	ELSE '미지정'
END AS "성별" FROM `sample37`;
#144

SELECT a AS "코드",
case a
	when 1 then '남자'
	when 2 then '여자'
	ELSE '미지정'
END AS "성별" FROM `sample37`;
#145


case a
	when a=1 then '남자'
	when a=2 then '여자'
	when a IS NULL then '데이터 없음'
	ELSE '미지정'
END;
#147