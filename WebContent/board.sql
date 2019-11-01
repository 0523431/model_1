create table board (
	num int primary key,
	name varchar(30),
	pass varchar(20),
	title varchar(100),
	content varchar(4000),
	file1 varchar(100),
	regdate datetime, /* 등록일 */
	readcnt int(10), /* 조회수 */
	grp int, /* 댓글용 */
	grplevel int(3), /* 댓글용 */
	grpstep int(5) /* 댓글용 */
)