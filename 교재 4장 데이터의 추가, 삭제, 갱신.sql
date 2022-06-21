#날짜 : 2022/06/21
#이름 : 강원우
#내용 : 교재 4장 데이텅의 추가, 삭제, 갱신

#####################################
#  16강 행 추가하기
#####################################
#테이블 생성/데이터 저장
CREATE TABLE `sample41`(
	`no` INT(11),
	`a`  VARCHAR(30) DEFAULT NULL,
	`b`  date DEFAULT NULL
);
#p153

INSERT INTO `sample41` VALUES(1, 'ABC', '2014-01-25');
#p154

#no열과 a열만  지정해 행 추가하기
INSERT INTO `sample41`(a, NO) VALUES('XYZ', 2);

SELECT * FROM `sample41`;
#p155

#no열에 3을 지정해 행 추가
INSERT INTO `sample41`(NO, a, b) VALUES(3, NULL, NULL);

SELECT * FROM `sample41`;
#p156

#테이블 생성/데이터 저장
CREATE TABLE `sample411`(
	`no` INT AUTO_INCREMENT PRIMARY KEY,
	`d`  INT DEFAULT 0
);
#p157

INSERT INTO `sample411`(NO, d) VALUES(1, 1);

SELECT * FROM `sample411`;

INSERT INTO `sample411`(NO, d) VALUES(2, DEFAULT);

SELECT * FROM `sample411`;
#p158

INSERT INTO `sample411`(NO) VALUES(3);

SELECT * FROM `sample411`;
#p159

#####################################
#  17강 삭제하기
#####################################
SELECT * FROM `sample41`;
#p161

DELETE FROM `sample41` WHERE NO = 3;

SELECT * FROM `sample41`;
#p162

#####################################
#  18강 데이터 갱신하기
#####################################
SELECT * FROM `sample41`;
#p165

UPDATE `sample41` SET b = '2014-09-07' WHERE NO = 2;

SELECT * FROM `sample41`;
#p166

UPDATE `sample41` SET NO = NO + 1;

SELECT * FROM `sample41`;
#p168

UPDATE `sample41` SET NO = NO + 1, a = NO;

SELECT * FROM `sample41`;
#p170

UPDATE `sample41` SET a = NO, NO = NO + 1;

SELECT * FROM `sample41`;

#oracle에서 UPDATE 명령 실행(p168 까지 해놓은 상태에서 진행)
DROP TABLE `sample41`;

UPDATE `sample41` SET NO = NO - 1, a = NO;

SELECT * FROM `sample41`;
#p171

UPDATE `sample41` SET a = NULL;

SELECT * FROM `sample41`;
#p173

