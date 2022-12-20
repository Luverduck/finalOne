-- 회원(ahzit_user) 테이블
-- 테이블 생성
create table ahzit_user(
user_id varchar2(20) primary key,
user_pw char(60) not null,
user_nick varchar2(30) not null check(regexp_like(user_nick, '^[가-힣][가-힣0-9]{2,9}$')),
user_email varchar2(320) not null check(regexp_like(user_email, '^[A-Za-z0-9]{6,30}@[0-9a-z]{4,252}.[a-z]{2,3}$')),
user_grade varchar2(9) default '일반' not null check(user_grade in('일반','관리자', '운영자')),
user_joindate date default sysdate not null,
user_logindate date,
user_state char(1) default 'N' check(user_state in('Y','N')) not null 
);

-- 테이블 삭제
drop table ahzit_user;

-- 회원 더미 데이터
insert into ahzit_user(user_id, user_pw, user_nick, user_email, user_grade) values('admin123', 'admin123', '관리자', 'admin123@gmail.com', '관리자');
insert into ahzit_user(user_id, user_pw, user_nick, user_email, user_grade) values('tester111', 'tester111', '테스터111', 'admin123@gmail.com', '일반');
insert into ahzit_user(user_id, user_pw, user_nick, user_email, user_grade) values('tester222', 'tester222', '테스터222', 'admin123@gmail.com', '일반');

-- 운영자 시퀀스 생성
create sequence manager_sqe;

-- 운영자 시퀀스 삭제
drop sequence manager_sqe;
