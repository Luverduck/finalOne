-- QnA 게시글(qna) 테이블
-- 테이블 생성
create table qna(
qna_no number primary key,
qna_writer references ahzit_user(user_id) on delete set null,
qna_title varchar(300) not null,
qna_content varchar(4000) not null,
qna_read number default 0 not null check(qna_read >= 0),
qna_writedate date default sysdate not null,
qna_updatedate date,
qna_state char(1) default 'N' check(qna_state in('Y','N')) not null 
);

-- 테이블 삭제
drop table qna;

-- 시퀀스 생성
create sequence qna_seq;

-- 시퀀스 삭제
drop sequence qna_seq;
