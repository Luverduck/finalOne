-- 자유게시판 (freeboard) 테이블
-- 테이블 생성
create table freeboard(
freeboard_no number primary key,
freeboard_id references ahzit_user(user_id) on delete set null,
freeboard_title varchar(300) not null,
freeboard_content varchar(4000) not null,
freeboard_read number default 0 not null check(freeboard_read > = 0),
freeboard_like number default 0 not null check(freeboard_like > = 0),
freeboard_writedate date default sysdate not null,
freeboard_updatedate date,
freeboard_state char(1) default 'N' check(freeboard_state in('Y','N')) not null
);

-- 테이블 삭제
drop table freeboard;

-- 시퀀스 생성
create sequence freeboard_seq;

-- 시퀀스 삭제
drop sequence freeboard_seq;
