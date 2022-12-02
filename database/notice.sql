-- 공지게시판 (notice) 테이블
-- 테이블 생성
create table notice(
notice_no number primary key,
notice_writer references ahzit_user(user_id) on delete set null,
notice_title varchar(300) not null,
notice_content varchar(4000) not null,
notice_read number default 0 not null check(notice_read >= 0),
notice_writedate date default sysdate not null,
notice_updatedate date
);

-- 테이블 삭제
drop table notice;

-- 시퀀스 생성
create sequence notice_seq;

-- 시퀀스 삭제
drop sequence notice_seq;
