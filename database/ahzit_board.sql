-- 소모임 게시글(ahzit_board) 테이블
-- 테이블 생성
create table ahzit_board (
board_no number primary key,
board_writer_no references ahzit_member(member_no) on delete set null,
board_ahzit_no references ahzit(ahzit_no) on delete cascade not null,
board_content varchar2(4000) not null,
board_read number default 0 check(board_read >= 0) not null,
board_like number default 0 check(board_like >= 0) not null,
board_writedate date default sysdate not null,
board_updatedate date,
board_state char(1) default 'N' check(board_state in ('Y', 'N')) not null
);

-- 테이블 삭제
drop table ahzit_board;

-- 시퀀스 생성
create sequence ahzit_board_seq;

-- 시퀀스 삭제
drop sequence ahzit_board_seq;
