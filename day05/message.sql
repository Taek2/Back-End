create table message(
	mnum int primary key,
	writer varchar(15) not null,
	title varchar(15) not null,
	content varchar(100) not null,
	wdate date default sysdate
);
select * from message;
insert into message values(1,'너구리','졸려죽겠다','제곧내',sysdate);
insert into message values(2,'고양이','냥냥','냐랴냐랴냥냥냥',sysdate);
/* 샘플데이터 : 일반적으로 서비스 될때에는 샘플데이터 有! */