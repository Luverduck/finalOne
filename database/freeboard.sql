-- 자유게시판 (freeboard) 테이블
-- 테이블 생성
create table freeboard(
freeboard_no number primary key,
freeboard_writer references ahzit_user(user_id) on delete set null,
freeboard_title varchar2(300) not null,
freeboard_content varchar2(4000) not null,
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

-- 게시글 번호 반환
select freeboard_seq.nextval from dual;

-- 게시글 작성
insert into freeboard(freeboard_no, freeboard_writer, freeboard_title, freeboard_content) values(freeboard_seq.nextval, 'test1231', '테스트제목', '테스트내용');
--insert into freeboard(freeboard_no, freeboard_writer, freeboard_title, freeboard_content, freeboard_writedate) values(#{freeboardNo}, #{freeboardWriter}, #{freeboardTitle}, #{freeboardContent}, sysdate)

-- 게시글 전체 조회
select freeboard_no, freeboard_writer, freeboard_title, freeboard_read, freeboard_like, freeboard_writedate from freeboard where freeboard_state = 'N' order by freeboard_writedate desc;
-- 게시글 전체 조회 + 페이징
select * from (select tmp.*, rownum rn from (select freeboard_no, freeboard_writer, freeboard_title, freeboard_read, freeboard_like, freeboard_writedate from freeboard where freeboard_state = 'N' order by freeboard_writedate desc)TMP) where rn between 1 and 10;
--select * from (select tmp.*, rownum rn from (select freeboard_no, freeboard_writer, freeboard_title, freeboard_read, freeboard_like, freeboard_writedate from freeboard order by freeboard_writedate desc)TMP) where rn between #{rownStart} and #{rownEnd};

-- 게시글 검색 조회
select freeboard_no, freeboard_writer, freeboard_title, freeboard_read, freeboard_like, freeboard_writedate from freeboard where instr(freeboard_title, '9') > 0 and freeboard_state = 'N' order by freeboard_writedate desc;
--select freeboard_no, freeboard_writer, freeboard_title, freeboard_read, freeboard_like, freeboard_writedate from freeboard where instr(${type}, #{keyword}) > 0 and freeboard_state = 'N' order by freeboard_writedate desc

-- 게시글 단일 조회
select freeboard_no, freeboard_writer, freeboard_title, freeboard_read, freeboard_like, freeboard_writedate from freeboard where freeboard_no = 150;
--select freeboard_no, freeboard_writer, freeboard_title, freeboard_read, freeboard_like, freeboard_writedate from freeboard where freeboard_no = #{freeboardNo}

-- 게시글 수정
update freeboard set freeboard_title = '테스트 18', freeboard_content = '테스트 18', freeboard_updatedate = sysdate where freeboard_no = 150;
--update freeboard set freeboard_title = #{freeboardTitle}, freeboard_content = #{freeboardContent}, freeboard_updatedate = sysdate where freeboard_no = #{freeboardNo}

-- 게시글 삭제(비활성화)
update freeboard set freeboard_state = 'Y' where freeboard_no = 131;
--update freeboard set freeboard_state = 'Y' where freeboard_no = #{freeboardNo};
