SELECT * FROM all_tables;

create table test(
   name varchar(20),
   email varchar(30)
);
insert into test values('kim','coding_helper@naver.com');
insert into test values('ari','ari@naver.com');
insert into test values('timo','teemo@naver.com');
select * from test;

drop table test;