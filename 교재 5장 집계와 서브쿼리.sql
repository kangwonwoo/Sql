#날짜 : 2022/06/21
#이믈 : 강원우
#내용 : 교재 5장 집계와 서브쿼리

##################################
#  20강 행 개수 구하기
##################################
#데이터 생성/데이터 저장
CREATE TABLE `sample51`(
	`no`       INT, 
	`name`     VARCHAR(1) DEFAULT NULL,
	`quantity` INT        DEFAULT NULL
);
DROP TABLE `sample51`;

INSERT INTO `sample51` VALUES (1, 'A', 1);
INSERT INTO `sample51` VALUES (2, 'A', 2);
INSERT INTO `sample51` VALUES (3, 'B', 10);
INSERT INTO `sample51` VALUES (4, 'C', 3);
INSERT INTO `sample51` VALUES (5, 0 ,0);

SELECT COUNT(*) FROM `sample51`;
#p183

SELECT * FROM `sample51` WHERE NAME='A';

SELECT COUNT(*) FROM `sample51` WHERE NAME='A';
#p185

SELECT COUNT(NO), COUNT(NAME) FROM `sample51`;
#p186 

SELECT * FROM `sample51`;
#p187 

SELECT ALL NAME FROM `sample51`;

SELECT DISTINCT NAME FROM `sample51`;
#p188 

SELECT COUNT(ALL NAME), COUNT(DISTINCT NAME) FROM `sample51`;
#p189


###################################
#  21강 COUNT 이외의 집계합수
###################################
#데이터 생성/데이터 저장
SELECT * FROM `sample51`;

SELECT SUM(quantity) FROM `sample51`;
#p191

SELECT AVG(quantity), SUM(quantity)/COUNT(quantity) FROM `sample51`;
#p192

SELECT 
AVG(case when quantity IS NULL then 0 ELSE quantity END) 
AS avgnull0 
FROM `sample51`;

SELECT * FROM `sample51`;

SELECT 
	MIN(quantity), 
	MAX(quantity), 
	MIN(NAME), 
	MAX(NAME) 
FROM `sample51`;
#p193

###############################
#22강 그룹화-GROUP BY
###############################
SELECT * FROM `sample51`;

SELECT NAME FROM `sample51` GROUP BY NAME;
#p195

SELECT NAME, 
	COUNT(NAME), 
	SUM(quantity) 
FROM `sample51` 
GROUP BY NAME;
#p197

SELECT NAME, COUNT(NAME) FROM `sample51` GROUP BY NAME;

SELECT NAME, COUNT(NAME) FROM `sample51` 
GROUP BY NAME HAVING COUNT(NAME) = 1;
#p199

SELECT NAME, COUNT(NAME), SUM(quantity) 
FROM `sample51` 
GROUP BY NAME
ORDER BY SUM(quantity) DESC;
#p202

###############################
#23강 서브쿼리
###############################
#테이블 생성/데이터 저장
CREATE TABLE `sample54` (
	`no` INT,
	`a`  INT
);
DROP TABLE `sample54`;

INSERT INTO `sample54`VALUES (1, 100);
INSERT INTO `sample54`VALUES (2, 900);
INSERT INTO `sample54`VALUES (3, 20);
INSERT INTO `sample54`VALUES (4, 80);

SELECT MIN(a) FROM `sample54`;
#p205

DELETE FROM `sample54` WHERE a = (SELECT MIN(a) FROM `sample54`);

SELECT * FROM `sample54`;
#p206

SELECT MIN(a) FROM `sample54`;

SELECT NO FROM `sample54`;

SELECT MIN(a), MAX(no) FROM `sample54`;
#p207

SELECT NO, a FROM `sample54`;
#p208

SELECT
	(SELECT COUNT(*) FROM `sample51`) AS sq1,
	(SELECT COUNT(*) FROM `sample54`) AS sq2;
	
SELECT
	(SELECT COUNT(*) FROM `sample51`) AS sq1,
	(SELECT COUNT(*) FROM `sample54`) AS sq2 FROM DUAL;
#p210

UPDATE `sample54` SET a = (SELECT MAX(a) FROM `sample54`);
#p211

SELECT * FROM (SELECT * FROM `sample54`) sq; 

SELECT * FROM (SELECT * FROM `sample54`) AS sq;
#p212

SELECT * FROM (SELECT * FROM(SELECT * FROM `sample54`) sq1) sq2;
#p213

#테이블 생성/데이터 저장
CREATE TABLE `sample541` (
	`a` INT,
	`b` INT
);

INSERT INTO `sample541` VALUES (
	(SELECT COUNT(*) FROM `sample51`),
	(SELECT COUNT(*) FROM `sample54`)
);

SELECT * FROM `sample541`;

INSERT INTO `sample541` SELECT 1, 2;

SELECT * FROM `sample541`;
#p214

INSERT INTO `sample541` SELECT * FROM `sample543`;
#p215

###############################
#24강 상관 서브쿼리
###############################
#테이블 생성/데이터 저장
CREATE TABLE `sample551` (
	`no` INT,
	`a`  VARCHAR(10) DEFAULT NULL
);
DROP TABLE

INSERT INTO `sample551` VALUES (1, NULL);
INSERT INTO `sample551` VALUES (2, NULL);
INSERT INTO `sample551` VALUES (3, NULL);
INSERT INTO `sample551` VALUES (4, NULL);
INSERT INTO `sample551` VALUES (5, NULL);

SELECT * FROM `sample551`;

CREATE TABLE `sample552` (
	`no 2` INT
);

INSERT INTO `sample552` VALUES (3);
INSERT INTO `sample552` VALUES (5);

SELECT * FROM `sample552`;
#p217

UPDATE `sample551` SET a = '있음' 
WHERE
	EXISTS(SELECT * FROM `sample552` WHERE `no 2` = NO);
	
SELECT * FROM `sample551`;
#p218

UPDATE `sample551` SET a = '없음' 
WHERE
	not EXISTS(SELECT * FROM `sample552` WHERE `no 2` = NO);
	
SELECT * FROM `sample551`;
#p219

UPDATE `sample551` SET a = '있음' 
WHERE
	EXISTS
	(SELECT * FROM `sample552` WHERE `sample552`.`no 2`=`sample551`.`no`);
#p221

SELECT * FROM `sample551` WHERE NO IN (3, 5);

SELECT * FROM `sample551` WHERE NO IN
	(SELECT `no 2` FROM `sample552`);
#p222