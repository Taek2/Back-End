create table message(
	mnum int primary key,
	writer varchar(30) not null,
	title varchar(30) not null,
	content varchar(200) not null,
	wdate date default sysdate,
	member int,
	path varchar(1000),
	foreign key (member) references member(memnum) on delete cascade
);

create table member(
	memnum int primary key,
	mid varchar(30),
	mpw varchar(30)
);

CREATE TABLE BBS(
	boardID int,
	bbsID int,
	bbsTitle varchar(1000),
	userID varchar(300),
	bbsDate varchar(300),
	bbsContent varchar(3000),
	map varchar(3000),
	bbsAvailable int
);



CREATE TABLE BBS_FILE(
FILENAME VARCHAR(20),
FILEREALNAME VARCHAR(20),
BBSID NUMBER);

select * from BBS_FILE;

drop table message;
drop table member;
delete from message;
select * from message;
select * from member;
insert into member values(1,'gus3578','0000');
insert into member values(2,'garen','1234');
/* 샘플데이터 : 일반적으로 서비스 될때에는 샘플데이터 有! */