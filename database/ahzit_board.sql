-- 소모임 게시글(ahzit_board) 테이블
-- 테이블 생성
create table ahzit_board (
board_no number primary key,
board_writer references ahzit_member(member_nick) on delete set null,
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

-- 게시글 번호 반환
select ahzit_board_seq.nextval from dual;

-- 게시글 등록
insert into ahzit_board(board_no, board_writer, board_content) values (ahzit_board_seq.nextval, '테스터222', '테스트게시글');
