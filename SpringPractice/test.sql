create table board(
	id int primary key,
	title varchar(30),
	writer varchar(15),
	content varchar(100),
	wdate date default sysdate
);

create table member2(
	id varchar(15) primary key,
	password varchar(30),
	name varchar(15),
	role varchar(15)
)

INSERT INTO member2 VALUES('oh','1234','����','USER');
INSERT INTO member2 VALUES('admin','1234','������','ADMIN');
SELECT * FROM member2;
INSERT INTO board (id, title, writer, content) values (20,'�˻���','����','�� ����');
delete from board;
SELECT * FROM board;