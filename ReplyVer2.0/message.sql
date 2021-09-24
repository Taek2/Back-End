create table message(
	mnum int primary key,
	writer varchar(30) not null,
	title varchar(30) not null,
	content varchar(200) not null,
	wdate date default sysdate,
	member int,
	favor int default 0,
	reply int default 0,
	path varchar(1000),
	foreign key (member) references member(memnum) on delete cascade
);
SELECT * FROM message;

ALTER TABLE message ADD reply int default 0;
ALTER TABLE rreply ADD rrmnum int;
ALTER TABLE reply ADD rreply int defalut 0;
ALTER TABLE reply MODIFY(rreply int default 0);
select * from ( select * from message order by wdate desc ) where ROWNUM <= 3;

CREATE TABLE reply(
	rnum int primary key,
	rdate date default sysdate,
	rcontent varchar(200) not null,
	rwriter varchar(30) not null,
	rmember int,
	rmnum int,
	rreply int default 0,
	foreign key (rmnum) references message(mnum) on delete cascade
)
select * from reply;
drop table reply;
delete from reply;
delete from member;
delete from rreply;
select * from reply;
select * from message;
update message set reply=0 where mnum=1;
update message set reply=0 where mnum=2;

delete from reply where rnum=3;
CREATE TABLE rreply(
	rrpk int primary key,
	rrnum int,
	rrdate date default sysdate,
	rrcontent varchar(200) not null,
	rrwriter varchar(30) not null,
	rrmember int,
	rrmnum int,
	foreign key (rrnum) references reply(rnum) on delete cascade
)
drop table rreply;
drop table reply;
drop table message;
drop table member;
delete from rreply;
delete from reply;

select * from rreply where rrnum=3 order by rrdate;

create table member(
	memnum int primary key,
	mid varchar(30),
	mpw varchar(30),
	name varchar(30)
);


drop table message;
drop table member;
delete from message;
select * from message;
select * from member;
insert into member values(1,'gus3578','0000');
insert into member values(2,'garen','1234');
/* 샘플데이터 : 일반적으로 서비스 될때에는 샘플데이터 有! */