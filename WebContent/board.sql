create table board (
	num int primary key,
	name varchar(30),
	pass varchar(20),
	title varchar(100),
	content varchar(4000),
	file1 varchar(100),
	regdate datetime, /* ����� */
	readcnt int(10), /* ��ȸ�� */
	grp int, /* ��ۿ� */
	grplevel int(3), /* ��ۿ� */
	grpstep int(5) /* ��ۿ� */
)