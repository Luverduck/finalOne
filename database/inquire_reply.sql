-- 1:1문의 댓글(inquire_reply) 테이블
-- 테이블 생성
create table inquire_reply(
inquire_reply_no number primary key,
inquire_origin_no references inquire(inquire_no) on delete cascade not null,
inquire_reply_writer references ahzit_user(user_id) on delete cascade not null,
inquire_reply_content varchar(900) not null,
inquire_reply_writedate date default sysdate not null,
inquire_reply_updatedate date,
inquire_reply_state char(1) default 'N' check(inquire_reply_state in('Y','N')) not null
);

-- 테이블 삭제
drop table inquire_reply;

-- 시퀀스 생성
create sequence inquire_reply_seq;

-- 시퀀스 삭제
drop sequence inquire_reply_seq;
