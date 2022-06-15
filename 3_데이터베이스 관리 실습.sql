#날짜 : 2022/06/14
#이름 : 강원우
#내용 : 데이터베이스 관리

DROP DATABASE `testdb`;

#실습하기  3-1
CREATE DATABASE `testDB`;

CREATE USER 'tester'@'%' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON testdb.* TO 'tester'@'%';
FLUSH PRIVILEGES;



#실습하기 3-2
SET PASSWORD FOR 'tester'@'%'=PASSWORD('1234');

DROP DATABASE `mydb`; 
CREATE DATABASE `mydb`;


DROP user 'tester'@'%';