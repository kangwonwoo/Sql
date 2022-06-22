#날짜 : 2022/06/22
#이름 : 강원우
#내용 : 교재 7장 복수의 테이블 다루기

###############################
#31강 집합 연산
###############################
#테이블 생성/데이터 저장
CREATE TABLE `sample71_a` (
	`a` INT
);

INSERT INTO `sample71_a` VALUES (1);
INSERT INTO `sample71_a` VALUES (2);
INSERT INTO `sample71_a` VALUES (3);

SELECT * FROM `sample71_a`;

CREATE TABLE `sample71_b` (
	`a` INT
);

INSERT INTO `sample71_b` VALUES (2);
INSERT INTO `sample71_b` VALUES (10);
INSERT INTO `sample71_b` VALUES (11);

SELECT * FROM `sample71_b`;
#p277

SELECT * FROM `sample71_a`
UNION
SELECT * FROM `sample71_b`;
#p278

SELECT * FROM `sample71_a`
UNION ALL
SELECT * FROM `sample71_b`;
#p281


###############################
#32강 테이블 결합
###############################
#테이블 생성/데이터 저장
CREATE TABLE `sample72_x` (
	`x` VARCHAR(20)
);

INSERT INTO `sample72_x` VALUES ('A');
INSERT INTO `sample72_x` VALUES ('B');
INSERT INTO `sample72_x` VALUES ('C');

SELECT * FROM `sample72_x`;

CREATE TABLE `sample72_y` (
	`y` INT
);

INSERT INTO `sample72_y` VALUES (1);
INSERT INTO `sample72_y` VALUES (2);
INSERT INTO `sample72_y` VALUES (3);

SELECT * FROM `sample72_y`;
#p286

SELECT * FROM `sample72_x`, `sample72_y`;
#p287

CREATE TABLE `상품`(
	`상품코드` CHAR(4) NOT NULL,
	`상품명`   VARCHAR(30),
	`메이커명` VARCHAR(30),
	`가격`     INTEGER,
	`상품분류` VARCHAR(30),
	PRIMARY KEY (`상품코드`)
);

INSERT INTO `상품` VALUES(0001, '상품00', '00메이커', 100, '식료품');
INSERT INTO `상품` VALUES(0002, '상품11', '00메이커', 200, '식료품');
INSERT INTO `상품` VALUES(0003, '상품22', '22메이커', 1980, '생활용품');
INSERT INTO `상품` VALUES(0001, '상품00', '00메이커', 100, '식료품');
INSERT INTO `상품` VALUES(0002, '상품11', '00메이커', 200, '식료품');
INSERT INTO `상품` VALUES(0003, '상품22', '22메이커', 1980, '생활용품');
INSERT INTO `상품` VALUES(0001, '상품00', '00메이커', 100, '식료품');
INSERT INTO `상품` VALUES(0002, '상품11', '00메이커', 200, '식료품');
INSERT INTO `상품` VALUES(0003, '상품22', '22메이커', 1980, '생활용품');
#p289

CREATE TABLE `재고수`(
	`상품코드` CHAR(4),
	`입고날짜` DATE,
	`재고수`   INTEGER
);

INSERT INTO `재고수` VALUES(0001, '2014-01-03', 200);
INSERT INTO `재고수` VALUES(0002, '2014-02-10', 500);
INSERT INTO `재고수` VALUES(0003, '2014-02-14', 10);
#p290

SELECT * FROM `상품`, `재고수`;
#p292

SELECT * FROM `상품`, `재고수`
WHERE 상품.`상품코드` = 재고수.상품코드;
#p293

SELECT 상품.`상품명`, 재고수.`재고수` FROM `상품`, `재고수`
WHERE 상품.`상품코드`= 재고수.`상품코드`
AND 상품.`상품분류`='식료품';
#p294

CREATE TABLE `메이커`(
	`메이커코드` CHAR(4) NOT NULL,
	`메이커명`   VARCHAR(30),
	PRIMARY KEY (`메이커코드`)
);

INSERT INTO `메이커` VALUES('M001', '00메이커');
INSERT INTO `메이커` VALUES('M002', '22메이커');
#p296

CREATE TABLE `상품2`(
	`상품코드`   CHAR(4) NOT NULL,
	`상품명`     VARCHAR(30),
	`메이커코드` VARCHAR(30),
	`가격`       INTEGER,
	`상품분류`   VARCHAR(30),
	PRIMARY KEY (`상품코드`)
);

INSERT INTO `상품2` VALUES(0001, '상품00', 'M001', 100, '식료품');
INSERT INTO `상품2` VALUES(0002, '상품11', 'M001', 200, '식료품');
INSERT INTO `상품2` VALUES(0003, '상품22', 'M002', 1980, '생활용품');


SELECT s.상품명, m.메이커명
FROM `상품2` s INNER JOIN `메이커` M
ON s.메이커코드= M.메이커코드;
#p297

SELECT s1.상품명, s2.상품명
FROM `상품` s1 INNER JOIN `상품` s2
ON s1.상품코드= s2.상품코드;
#p299

CREATE TABLE `상품3`(
	`상품코드`   CHAR(4) NOT NULL,
	`상품명`     VARCHAR(30),
	`메이커코드` VARCHAR(30),
	`가격`       INTEGER,
	`상품분류`   VARCHAR(30),
	PRIMARY KEY (`상품코드`)
);

INSERT INTO `상품3` VALUES(0001, '상품00', 'M001', 100, '식료품');
INSERT INTO `상품3` VALUES(0002, '상품11', 'M001', 200, '식료품');
INSERT INTO `상품3` VALUES(0003, '상품22', 'M002', 1980, '생활용품');
INSERT INTO `상품3` VALUES(0009, '추가상품', 'M001', 300, '식료품');

SELECT 상품3.상품명, 재고수.`재고수`
FROM `상품3` INNER JOIN `재고수`
ON 상품3.상품코드 = 재고수.상품코드
WHERE 상품3.상품분류='식료품';
#p300

SELECT 상품3.상품명, 재고수.`재고수`
FROM `상품3` LEFT JOIN `재고수`
ON 상품3.상품코드 = 재고수.상품코드
WHERE 상품3.상품분류='식료품';
#p301

SELECT 상품3.상품명, 재고수.`재고수`
FROM `상품3`, `재고수`
WHERE 상품3.상품코드=재고수.상품코드(+)
AND 상품3.상품분류='식료품';
#p302
