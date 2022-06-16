#날짜 : 2022/06/14
#이름 : 강원우
#내용 : SQL 고급실습

#실습하기 5-1
CREATE TABLE `Member` (
   `uid`    VARCHAR(10) PRIMARY KEY,
   `name`   VARCHAR(10) NOT NULL,
   `hp`     CHAR(13)    UNIQUE NOT NULL,
   `pos`    VARCHAR(10) NOT NULL DEFAULT '사원',
   `dep`    INT,
   `rdate`  DATETIME    NOT NULL
);

CREATE TABLE `Department` (
   `depNo`  INT         PRIMARY KEY,
   `name`   VARCHAR(10) NOT NULL,
   `tel`    CHAR(12)    NOT NULL
);

CREATE TABLE `Sales` (
   `seq`    INT         PRIMARY KEY AUTO_INCREMENT,
   `uid`    VARCHAR(10) NOT NULL,
   `year`   YEAR        NOT NULL,
   `month`  INT         NOT NULL,
   `sale`   INT         NOT NULL
);

DROP TABLE `Member`;
dROP TABLE `Department`;
dROP TABLE `Sales`;
#실습하기 5-2
INSERT INTO `Member` VALUE ('a101', '박혁거세', '010-1234-1001', '부장', 101, NOW());
INSERT INTO `Member` VALUE ('a102', '김유신',   '010-1234-1002', '차장', 101, NOW());
INSERT INTO `Member` VALUE ('a103', '김춘추',   '010-1234-1003', '사원', 101, NOW());
INSERT INTO `Member` VALUE ('a104', '장보고',   '010-1234-1004', '대리', 102, NOW());
INSERT INTO `Member` VALUE ('a105', '강감찬',   '010-1234-1005', '과장', 102, NOW());
INSERT INTO `Member` VALUE ('a106', '이성계',   '010-1234-1006', '차장', 103, NOW());
INSERT INTO `Member` VALUE ('a107', '정철',     '010-1234-1007', '차장', 103, NOW());
INSERT INTO `Member` VALUE ('a108', '이순신',   '010-1234-1008', '부장', 104, NOW());
INSERT INTO `Member` VALUE ('a109', '허균',     '010-1234-1009', '부장', 104, NOW());
INSERT INTO `Member` (`uid`, `name`, `hp`, `dep`, `rdate`)
                     VALUE ('a110', '정약용', '010-1234-1010', 105, NOW());
INSERT INTO `Member` (`uid`, `name`, `hp`, `dep`, `rdate`)
                     VALUE ('a111', '박지원', '010-1234-1011', 105, NOW());

INSERT INTO `Department` VALUE (101, '영업1부',    '051-512-1001');
INSERT INTO `Department` VALUE (102, '영업2부',    '051-512-1002');
INSERT INTO `Department` VALUE (103, '영업3부',    '051-512-1003');
INSERT INTO `Department` VALUE (104, '영업4부',    '051-512-1004');
INSERT INTO `Department` VALUE (105, '영업5부',    '051-512-1005');
INSERT INTO `Department` VALUE (106, '영업지원부', '051-512-1006');
INSERT INTO `Department` VALUE (107, '인사부',     '051-512-1007');

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUE ('a101', 2018, 1,  98100);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUE ('a102', 2018, 1, 136000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUE ('a103', 2018, 1,  80100);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUE ('a104', 2018, 1,  78000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUE ('a105', 2018, 1,  93000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUE ('a101', 2018, 2,  23500);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUE ('a102', 2018, 2, 126000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUE ('a103', 2018, 2,  18500);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUE ('a105', 2018, 2,  19000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUE ('a106', 2018, 2,  53000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUE ('a101', 2019, 1,  24000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUE ('a102', 2019, 1, 109000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUE ('a103', 2019, 1, 101000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUE ('a104', 2019, 1,  53500);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUE ('a107', 2019, 1,  24000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUE ('a102', 2019, 2, 160000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUE ('a103', 2019, 2, 101000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUE ('a104', 2019, 2,  43000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUE ('a105', 2019, 2,  24000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUE ('a106', 2019, 2, 109000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUE ('a102', 2020, 1, 201000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUE ('a104', 2020, 1,  63000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUE ('a105', 2020, 1,  74000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUE ('a106', 2020, 1, 122000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUE ('a107', 2020, 1, 111000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUE ('a102', 2020, 2, 120000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUE ('a103', 2020, 2,  93000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUE ('a104', 2020, 2,  84000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUE ('a105', 2020, 2, 180000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUE ('a108', 2020, 2,  76000);


#실습하기 5-3
SELECT * FROM `Member` WHERE `name`  ='김유신';
SELECT * FROM `Member` WHERE `pos`   ='차장' AND dep=101;
SELECT * FROM `Member` WHERE `pos`   ='차장' OR dep=101;
SELECT * FROM `Member` WHERE `name`  != '김춘추';
SELECT * FROM `Member` WHERE `name`  <> '김춘추';
SELECT * FROM `Member` WHERE `pos`   ='사원' OR `pos`='대리';
SELECT * FROM `Member` WHERE `pos`   IN('사원', '대리');
SELECT * FROM `Member` WHERE `dep`   IN(101, 102, 103);
SELECT * FROM `Member` WHERE `name`  LIKE '%신';
SELECT * FROM `Member` WHERE `name`  LIKE '김%';
SELECT * FROM `Member` WHERE `name`  LIKE '김__';
SELECT * FROM `Member` WHERE `name`  LIKE '_성_';
SELECT * FROM `Member` WHERE `name`  LIKE '정_';
SELECT * FROM `sales`  WHERE `sale`  > 50000;
SELECT * FROM `sales`  WHERE `sale`  >= 50000 AND `sale` < 100000 AND `month`=1;
SELECT * FROM `sales`  WHERE `sale`  BETWEEN 50000 AND 100000;
SELECT * FROM `sales`  WHERE `sale`  NOT BETWEEN 50000 AND 100000;
SELECT * FROM `sales`  WHERE `year`  IN(2020);
SELECT * FROM `sales`  WHERE `month` IN(1, 2);


#실습하기 5-4
SELECT * FROM `sales`  ORDER BY `sale`;
SELECT * FROM `sales`  ORDER BY `sale` ASC;
SELECT * FROM `sales`  ORDER BY `sale` DESC;
SELECT * FROM `Member` ORDER BY `name`;
SELECT * FROM `Member` ORDER BY `name` DESC;
SELECT * FROM `Member` ORDER BY `rdate` ASC;
SELECT * FROM `sales`  WHERE `sale` > 50000 
							  ORDER BY `sale` DESC;
SELECT * FROM `sales`  WHERE `sale` > 50000
                       ORDER BY `year`, `month`, `sale` DESC;


#실습하기 5-5
SELECT * FROM `sales` LIMIT 3;
SELECT * FROM `sales` LIMIT 0, 3;
SELECT * FROM `sales` LIMIT 1, 3;
SELECT * FROM `sales` LIMIT 4, 5;
SELECT * FROM `sales` ORDER BY `sale` DESC LIMIT 3, 5;
SELECT * FROM `sales` WHERE `sale` < 50000 
                      ORDER BY `sale` DESC LIMIT 3;
SELECT * FROM `sales` WHERE `sale` > 50000 
                      ORDER BY `year` DESC, `month`, `sale` DESC LIMIT 5;


#실습하기 5-6
SELECT SUM(sale) FROM `sales`;
SELECT SUM(sale)            AS `합계`            FROM `sales`;
SELECT AVG(sale)            AS `평균`            FROM `sales`;
SELECT MAX(sale)            AS `최대값`          FROM `sales`;
SELECT MIN(sale)            AS `최소값`          FROM `sales`;
SELECT COUNT(sale)          AS `갯수`            FROM `sales`;
SELECT COUNT(*)             AS `갯수`            FROM `sales`;
SELECT SUBSTRING(hp, 10 ,4) AS `전화번호 끝자리` FROM `Member`;
INSERT INTO `Member` 
       VALUE ('b101', '을지문덕', '010-5555-1234', '사장', 107, NOW());

#확인문제1 : 2018년 1월 매출 총합
SELECT 
    SUM(`sale`) AS `2018년 1월 총매출`  
FROM 
        `sales`
WHERE 
        `year`=2018 AND 
		  `month`=1 ;

#확인문제2 : 2019년 2월달에 5만원 이상 매출에 대한 총학과 평균
SELECT 
   SUM(`sale`) AS `총합`,
	AVG(`sale`) AS `평균`
FROM 
       `Sales` 
WHERE
       `year`=2019 AND 
		 `month`=2 AND 
		 `sale` > 50000;

#확인문제3 : 2020년 전체 매출 가운데 최저, 최고, 매출
SELECT 
   MIN(`sale`), 
	MAX(`sale`)
FROM 
       `sales` 
WHERE 
       `year`=2020;



#실습하기 5-7
SELECT * FROM `sales` GROUP BY `uid`;
SELECT * FROM `sales` GROUP BY `year`;
SELECT * FROM `sales` GROUP BY `uid`, `year`;
SELECT `uid` COUNT(*) AS `건수` FROM `sales` GROUP BY `uid`;
SELECT `uid` SUM(sale) AS `합계` FROM `sales` GROUP BY `uid`;
SELECT `uid` AVG(sale) AS `평균` FROM `sales` GROUP BY `uid`;

SELECT   `uid`, `year`, SUM(`sale`) AS `합계` 
FROM     `Sales`
GROUP BY `uid`,  `year`;

SELECT   `uid`, `year`, SUM(`sale`) AS `합계` 
FROM     `Sales`
GROUP BY `uid`,  `year`
ORDER BY `year` ASC, `합계`DESC;

SELECT   `uid`, `year`, SUM(`sale`) AS `합계` 
FROM     `Sales`
WHERE    `sale` >= 50000
GROUP BY `uid`,  `year`
ORDER BY `합계` DESC;


#실습하기 5-8
SELECT `uid`, SUM(`sale`) AS `합계` FROM `Sales`
GROUP BY `uid`
HAVING SUM(`sale`) >= 200000;

SELECT   `uid`, `year`, SUM(`sale`) AS `합계`
FROM     `Sales`
WHERE    `sale` >= 100000
GROUP BY `uid`,  `year`
HAVING   `합계` >= 200000
ORDER BY `합계` DESC;


#실습하기 5-9
CREATE TABLE `Sales2` LIKE `Sales`;
INSERT INTO `Sales2` SELECT * FROM `Sales`;
UPDATE `Sales2` SET `year` = `year` + 3;


SELECT * FROM `Sales` UNION SELECT * FROM `Sales2`;


SELECT `uid`, `year`, SUM(`sale`) AS `합계` 
FROM `Sales` 
GROUP BY `uid`, `year`
UNION
SELECT `uid`, `year`, SUM(`sale`) AS `합계` 
FROM `Sales2` 
GROUP BY `uid`, `year`
ORDER BY `year` ASC, `합계` DESC;


#실습하기 5-10
SELECT * FROM `Sales` UNION ALL SELECT * FROM `Sales2`;


#실습하기 5-11
SELECT * 
FROM `Sales` 
JOIN `Member` 
ON `Sales`.uid = `Member`.uid;

SELECT
		 a.seq,
		 a.uid,
		 a.year,
		 a.month,
		 a.sale,
		 b.name,
		 b.hp,
		 b.pos
FROM `Sales`  AS a
JOIN `Member` AS b
ON a.uid = b.uid;

SELECT * 
FROM `Sales`  AS a
JOIN `Member` AS b
USING(`uid`);

SELECT a.seq, a.uid, `sale`, `name`, `pos`
FROM `Sales`  AS a, `Member` AS b
WHERE a.uid = b.uid;

SELECT a.seq, a.uid, `sale`, `name`, `pos`
FROM `Sales`  AS a
JOIN `Member` AS b
USING(uid)
WHERE `sale` >= 100000;

SELECT a.seq, a.uid, b.name, b.pos, `year`, SUM(`sale`) AS `합계`
FROM `Sales`  AS a
JOIN `Member` AS b
ON a.uid = b.uid
GROUP BY a.uid, a.year
HAVING `합계` >= 100000
ORDER BY a.year ASC, `합계` DESC;

SELECT * 
FROM `Sales`      AS a
JOIN `Member`     AS b  ON a.uid = b.uid
JOIN `Department` AS c  ON b.dep = c.depNo;

SELECT a.seq, a.uid, a.sale, b.name, b.pos, c.name
FROM `Sales`      AS a
JOIN `Member`     AS b  USING(uid)
JOIN `Department` AS c  ON b.dep = c.depNo;

SELECT a.seq, a.uid, a.sale, b.name, b.pos, c.name
FROM `Sales`      AS a
JOIN `Member`     AS b  USING(uid)
JOIN `Department` AS c  ON b.dep = c.depNo
WHERE `sale` > 100000
ORDER BY `sale` DESC;


#실습하기 5-12
SELECT * 
FROM `Sales`  AS a
right JOIN `Member` AS b
ON a.uid = b.uid;

SELECT *
FROM `Sales`
left JOIN `Member`
ON `Sales`.uid = `Member`.uid;

SELECT *
FROM `Sales`
right JOIN `Member`
ON `sales`.uid = `member`.uid;

SELECT a.seq, a.uid, `sale`, `name`, `pos`
FROM `sales` AS a
RIGHT JOIN `Member` AS b USING(uid);

#확인문제1
SELECT 
	a.uid,
	a.name,
	a.pos,
	b.name
FROM `Member`     AS a
JOIN `Department` AS b
ON a.dep = b.depNo;


#확인문제2
SELECT a.uid, b.name, a.year, SUM(`sale`) `합계`
FROM `Sales`  AS a
JOIN `Member` AS b
ON a.uid = b.uid
WHERE 
	b.name = '김유신' AND
	a.year = 2019;


#확인문제3
SELECT 
	b.name,
	c.name,
	b.pos,
	a.year,
	SUM(`sale`) AS `합계`
FROM `Sales`      AS a
JOIN `Member`     AS b ON a.uid = b.uid
JOIN `Department` AS c ON b.dep = c.depNo
WHERE 
	`year` =2019 AND 
	`Sale` >= 50000
GROUP BY a.`uid`
HAVING `합계` >= 100000
ORDER BY `합계` DESC;


