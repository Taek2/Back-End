
create table profile(
	id varchar(50) primary key,
	pw varchar(50),
	name varchar(50),
	image varchar(300) default 'defaultImage.jpg',
	email varchar(100),
	phone varchar(100),
	message varchar(300)
);

create table postInfo(
	pnum int primary key,
	content varchar(1000),
	writer varchar(30),
	plike int default 0,
	pdate date default sysdate,
	p_user varchar(50),
	foreign key (p_user) references profile(id) on delete cascade
);


select * from profile;
delete from profile;
select * from postInfo;

drop table profile CASCADE CONSTRAINTS;
