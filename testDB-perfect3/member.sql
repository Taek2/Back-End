create table memberA(
	pk int,
	userID varchar(10),
	userPW varchar(10),
	userName varchar(10)
);
insert into memberA values(1,'����','���','�浿');
insert into memberA values(2,'id','pw','name');
insert into memberA values(3,'kim','1234','Ƽ��');
select * from memberA;

delete from memberA;

drop table member;