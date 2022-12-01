-- 1:1문의 게시판(inquire) 테이블
-- 테이블 생성
create table inquire(
inquire_no number primary key,
inquire_id references ahzit_user(user_id) on delete cascade not null,
inquire_title varchar(300) not null,
inquire_content varchar(4000) not null,
inquire_writedate date default sysdate not null,
inquire_updatedate date,
inquire_state char(1) default 'N' not null check(inquire_state in('Y','N'))
);

-- 테이블 삭제
drop table inquire;

-- 시퀀스 생성
create sequence inquire_seq;

-- 시퀀스 삭제
drop sequence inquire_seq;