#날짜 : 2022/06/15
#이름 : 강원우
#내용 : 교재 2장 테이블에서 데이터 검색

#테이블 생성
CREATE TABLE `sample21`(
   `no`       INT AUTO_INCREMENT PRIMARY KEY,
   `name`     VARCHAR(10),
   `birthday` CHAR(10),
   `address`  VARCHAR(100)
);


INSERT INTO `sample21` (`name`, `birthday`, `address`)
							  VALUES ('박준용', '1976-10-18', '대구광역시 수성구');
INSERT INTO `sample21` (`name`, `address`) 
                       VALUES ('김재진', '대구광역시 동구');
INSERT INTO `sample21` (`name`, `address`) 
                       VALUES ('홍길동', '서울특별시 마포구');
#p53
#p62
#p66
#p68
#p70
#p71
#p72
#p73

# 테이블 생성/데이터 저장
#p76
CREATE TABLE `sample24` (
   `no`  INT AUTO_INCREMENT PRIMARY KEY,
   `a`   INT DEFAULT 0,
   `b`   INT DEFAULT 0,
   `c`   INT DEFAULT 0
);

DROP TABLE `sample24`;

INSERT INTO `sample24` (`a`) VALUES (1);
INSERT INTO `sample24` (`b`) VALUES (1);
INSERT INTO `sample24` (`c`) VALUES (1);
INSERT INTO `sample24` (`a`, `b`) VALUES (2, 2);
INSERT INTO `sample24` (`b`, `c`) VALUES (2, 2);

#p77
SELECT * FROM `sample24` WHERE `a` <> 0 AND `b` <> 0;

#p78
SELECT * FROM `sample24` WHERE `a` <> 0 OR `b` <> 0;

#p80
SELECT * FROM `sample24` WHERE `a`=1 OR `a`=2 AND `b`=1 OR `b`=2;

#p82
SELECT * FROM `sample24` WHERE NOT (`a` <> 0 OR `b` <> 0);

# 테이블 생성/데이터 저장
CREATE TABLE `sample25` (
   `no`    INT AUTO_INCREMENT PRIMARY KEY,
   `text`  VARCHAR(255)
);

INSERT INTO `sample25` SET `text` = 'SQL은 RDBMS를 조직하는 언어이다';
INSERT INTO `sample25` SET `text` = 'LIKE에서는 메타문자 %와 _를 사용할 수 있다';
INSERT INTO `sample25` SET `text` = 'LIKE는 SQL에서 사용할 수 있는 술어 중 하나이다';
#응용으로 추가한 항목
INSERT INTO `sample25` SET `text` = 'LIKE에서는 메타문자 %%와 _를 사용할 수 있다';

#p85
SELECT * FROM `sample25` WHERE `text` LIKE 'SQL%'; 

#p86
SELECT * FROM `sample25` WHERE `text` LIKE '%SQL%';

#p88
SELECT * FROM `sample25` WHERE `text` LIKE '%\%%';
#p88 응용
SELECT * FROM `sample25` WHERE `text` LIKE '%\%\%%';