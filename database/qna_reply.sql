-- QnA 댓글(qna_reply) 테이블
-- 테이블 생성
create table qna_reply(
qna_reply_no number primary key,
qna_origin_no references qna(qna_no) on delete cascade not null,
qna_reply_writer references ahzit_user(user_id) on delete set null,
qna_reply_content varchar(900) not null,
qna_reply_writedate date default sysdate not null,
qna_reply_updatedate date
);

-- 테이블 삭제
drop table qna_reply;

-- 시퀀스 생성
create sequence qna_reply_seq;

-- 시퀀스 삭제
drop sequence qna_reply_seq;
