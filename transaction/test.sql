select * from all_tables;

create table test(
	name varchar(20),
	email varchar(30)
);
insert into test values('kim','coding_helper@naver.com');
insert into test values('ari','ari@naver.com');
insert into test values('timo','teemo@naver.com');
select * from test;

create table bank1(
	bid int primary key,
	balance int,
	name varchar(20)
);
create table bank2(
	bid int primary key,
	balance int,
	name varchar(20)
);

insert into bank1 values(1, 5000, 'mumu');
insert into bank2 values(1, 1000, 'garen');

create table bank(
	bid int primary key,
	balance int,
	name varchar(20)
);

insert into bank values(1, 5000, '아무무');
insert into bank values(2, 1000, '가렌');
insert into bank values(3, 3000, '아리');