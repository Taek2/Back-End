create table message(
	mnum int primary key,
	writer varchar(15) not null,
	title varchar(15) not null,
	content varchar(100) not null,
	wdate date default sysdate
);
select * from message;
insert into message values(1,'�ʱ���','�����װڴ�','����',sysdate);
insert into message values(2,'�����','�ɳ�','�ķ��ķ��ɳɳ�',sysdate);
/* ���õ����� : �Ϲ������� ���� �ɶ����� ���õ����� ��! */