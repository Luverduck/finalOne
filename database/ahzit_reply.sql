-- 소모임 게시글 댓글(ahzit_reply)
-- 테이블 생성
create table ahzit_reply (
reply_no number primary key,
reply_writer references ahzit_member(member_nick) on delete cascade,
reply_origin_no references ahzit_board(board_no) on delete cascade,
reply_content varchar2(300) not null,
reply_writedate date default sysdate not null,
reply_updatedate date not null,
reply_state char(1) default 'N' check(reply_state in ('Y', 'N')) not null
);

-- 테이블 삭제
drop table ahzit_reply;

-- 시퀀스 생성
create sequence reply_no;

-- 시퀀스 삭제
drop sequence reply_no;