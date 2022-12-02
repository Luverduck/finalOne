-- 자유게시판 댓글 (freeboard_reply) 테이블
-- 테이블 생성
create table freeboard_reply(
freeboard_reply_no number primary key,
freeboard_origin_no references freeboard(freeboard_no) on delete cascade not null,
freeboard_reply_writer references ahzit_user(user_id) on delete set null,
freeboard_reply_content varchar(900) not null,
freeboard_reply_writedate date default sysdate not null,
freeboard_reply_updatedate date
);

-- 테이블 삭제
drop table freeboard_reply;

-- 시퀀스 생성
create sequence freeboard_reply_seq;

-- 시퀀스 삭제
drop sequence freeboard_reply_seq;
