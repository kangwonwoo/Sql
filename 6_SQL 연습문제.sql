#날짜 : 2022/06/20
#이름 : 강원우
#내용 : SQL 연습문제

#문제1
CREATE TABLE `Book` (
		`bookid`     INT PRIMARY KEY,
		`bookname`   VARCHAR(20),
		`publisher`  VARCHAR(20),
		`price`      INT
);

INSERT INTO `Book` VALUES (1, '축구의 역사',        '굿스포츠',    7000);
INSERT INTO `Book` VALUES (2, '축구아는 여자',      '나무수',     13000);
INSERT INTO `Book` VALUES (3, '축구의 이해',        '대한미디어', 22000);
INSERT INTO `Book` VALUES (4, '골프 바이블',        '대한미디어', 35000);
INSERT INTO `Book` VALUES (5, '피겨 교본',          '굿스포츠',    8000);
INSERT INTO `Book` VALUES (6, '역도 단계별기술',    '굿스포츠',    6000);
INSERT INTO `Book` VALUES (7, '야구의 추억',        '이상미디어', 20000);
INSERT INTO `Book` VALUES (8, '야구를 부탁해',      '이상미디어', 13000);
INSERT INTO `Book` VALUES (9, '올림픽 이야기',      '삼성당',      7500);
INSERT INTO `Book` VALUES (10, 'Olympic Champions', 'Pearson',    13000);

#문제2
CREATE TABLE `Customer`(
		`custid`  INT AUTO_INCREMENT PRIMARY KEY,
		`name`    VARCHAR(5)
		`address` VARCHAR(20),
		`phone`   VARCHAR(30)
);

INSERT INTO `Customer`(`name`, `address`, `phone`) VALUES ('박지성', '영국 맨체스터',   '000-5000-0001');
INSERT INTO `Customer`(`name`, `address`, `phone`) VALUES ('김연아', '대한민구 서울',   '000-6000-0001');
INSERT INTO `Customer`(`name`, `address`, `phone`) VALUES ('장미란', '대한민국 강원도', '000-7000-0001');
INSERT INTO `Customer`(`name`, `address`, `phone`) VALUES ('추신수', '미국 클리블랜드', '000-8000-0001');
INSERT INTO `Customer`(`name`, `address`) VALUES ('박세리', '대한민국 대전');

#문제3
CREATE TABLE `Orders`(
		`orderid`   INT AUTO_INCREMENT PRIMARY KEY,
		`custid`    INT,
		`bookid`    INT,
		`saleprice` INT,
		`orderdate` DATE
);

INSERT INTO `Orders`(`custid`, `bookid`, `saleprice`, `orderdate`) VALUES (1, 1,   6000, '2014-07-01');
INSERT INTO `Orders`(`custid`, `bookid`, `saleprice`, `orderdate`) VALUES (1, 3,  21000, '2014-07-03');
INSERT INTO `Orders`(`custid`, `bookid`, `saleprice`, `orderdate`) VALUES (2, 5,   8000, '2014-07-03');
INSERT INTO `Orders`(`custid`, `bookid`, `saleprice`, `orderdate`) VALUES (3, 6,   6000, '2014-07-04');
INSERT INTO `Orders`(`custid`, `bookid`, `saleprice`, `orderdate`) VALUES (4, 7,  20000, '2014-07-05');
INSERT INTO `Orders`(`custid`, `bookid`, `saleprice`, `orderdate`) VALUES (1, 2,  12000, '2014-07-07');
INSERT INTO `Orders`(`custid`, `bookid`, `saleprice`, `orderdate`) VALUES (4, 8,  13000, '2014-07-07');
INSERT INTO `Orders`(`custid`, `bookid`, `saleprice`, `orderdate`) VALUES (3, 10, 12000, '2014-07-08');
INSERT INTO `Orders`(`custid`, `bookid`, `saleprice`, `orderdate`) VALUES (2, 10,  7000, '2014-07-09');
INSERT INTO `Orders`(`custid`, `bookid`, `saleprice`, `orderdate`) VALUES (3, 8,  13000, '2014-07-10');

#문제4
SELECT `custid`, `name`, `address`, FROM `Customer`;

#문제5
SELECT `bookname`, `price` FROM `Book`;

#문제6
SELECT `price`, `bookname` FROM `Book`;

#문제7
SELECT * FROM `Book`;

#문제8
SELECT `publisher`, FROM `Book`;

#문제9
SELECT DISTINCT `publisher`, FROM `Book`;

#문제10
SELECT * FROM `Book` WHERE `price` >= 20000;

#문제11
SELECT * FROM `Book` WHERE `price` < 20000;

#문제12
SELECT * FROM `Book` WHERE `price` >= 10000 AND `price` <= 20000;
SELECT * FROM `Book` WHERE `price` BETWEEN 10000 AND 20000;

#문제13
SELECT `bookid`, `bookname`, `price` FROM `Book` WHERE `price` >= 15000 AND `price` <= 30000;

#문제14
SELECT * FROM `Book` WHERE `bookid`= 2 OR `bookid`= 3 OR `bookid`= 5;
SELECT * FROM `Book` WHERE `bookid`= 2 OR `bookid` IN(2, 3, 5);

#문제15
SELECT * FROM `Book` WHERE `bookid` % 2 = 0;

#문제16
SELECT * FROM `Customer` WHERE `name` LIKE '박%';

#문제17
SELECT * FROM `Customer` WHERE `address` LIKE '%대한민국%';

#문제18
SELECT * FROM `Customer` WHERE NOT `phone` IS NULL;

#문제19
SELECT * FROM `Book` WHERE `publisher` = '굿스포츠' OR `publisher`='대한미디어';
SELECT * FROM `Book` WHERE `publisher` IN('굿스포츠', '대한미디어');

#문제20
SELECT `publisher` FROM `Book` WHERE `bookname`='축구의 역사';

#문제21
SELECT `publisher` FROM `Book` WHERE `bookname` LIKE '%축구%';

#문제22
SELECT * FROM `Book` WHERE `bookname` LIKE '_구%';

#문제23
SELECT * FROM `Book` WHERE `bookname` LIKE '%축구%' AND `price` >= 20000;

#문제24
SELECT * FROM `Book` ORDER BY `bookname`;

#문제25
SELECT * FROM `Book` ORDER BY `price`, `bookname`;

#문제26
SELECT * FROM `Book` ORDER BY `price` DESC, `bookname` ASC;

#문제27
SELECT * FROM `Book` ORDER BY `price` DESC LIMIT 3;

#문제28
SELECT * FROM `Book` ORDER BY `price` ASC LIMIT 3;

#문제29
#문제30

#문제31
#문제32
#문제33
#문제34
#문제35
#문제36
#문제37
#문제38
#문제39
#문제40

#문제41
#문제42
#문제43
#문제44
#문제45
#문제46