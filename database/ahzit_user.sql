-- 회원(ahzit_user) 테이블
-- 테이블 생성
create table ahzit_user(
user_id varchar2(20) primary key check(regexp_like(user_id,'^[a-z][a-z0-9_-]{7,19}$')),
user_pw char(60) not null,
user_nick varchar2(30) not null check(regexp_like(user_nick, '^[가-힣][가-힣0-9]{2,9}$')),
user_email varchar2(320) not null check(regexp_like(user_email,'@')),
user_interest varchar2(9) not null check(user_interest in('취미','스터디','일상','팬클럽','음악','스포츠','여행','맛집')),
user_grade varchar2(9) default '일반' not null check(user_grade in('일반','관리자')),
user_joindate date default sysdate not null,
user_logindate date,
user_state char(1) default 'N' check(user_state in('Y','N')) not null 
);

-- 테이블 삭제
drop table ahzit_user;