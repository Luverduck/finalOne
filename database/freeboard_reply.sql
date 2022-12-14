-- 자유게시판 댓글 (freeboard_reply) 테이블
-- 테이블 생성
create table freeboard_reply(
freeboard_reply_no number primary key,
freeboard_origin_no references freeboard(freeboard_no) on delete cascade not null,
freeboard_reply_writer references ahzit_user(user_id) on delete set null,
freeboard_reply_content varchar(900) not null,
freeboard_reply_writedate date default sysdate not null,
freeboard_reply_updatedate date,
freeboard_reply_state char(1) default 'N' check(freeboard_reply_state in('Y','N')) not null
);

-- 테이블 삭제
drop table freeboard_reply;

-- 시퀀스 생성
create sequence freeboard_reply_seq;

-- 시퀀스 삭제
drop sequence freeboard_reply_seq;

-- 댓글 작성
insert into freeboard_reply(freeboard_reply_no, freeboard_origin_no, freeboard_reply_writer, freeboard_reply_content) values(freeboard_reply_seq.nextval, 301, 'test1231', '댓글1');
-- insert into freeboard_reply(freeboard_reply_no, freeboard_origin_no, freeboard_reply_writer, freeboard_reply_content) values(#{freeboardReplyNo}, #{freeboardOriginNo}, #{freeboardReplyWriter}, #{freeboardReplyContent})

-- 댓글 조회 + 페이징
--select * from (select tmp.*, rownum rn from (select freeboard_reply_no, freeboard_reply_writer, freeboard_reply_content, freeboard_reply_writedate from freeboard_reply where freeboard_origin_no = #{freeboardOriginNo} order by freeboard_reply_no desc)tmp) where rn between #{rownumStart} and #{rownumEnd} 
select * from (select tmp.*, rownum rn from (select freeboard_reply_no, freeboard_reply_writer, freeboard_reply_content, freeboard_reply_writedate from freeboard_reply where freeboard_origin_no = 9 order by freeboard_reply_no desc)tmp) where rn between 1 and 5;

-- 특정 게시글에 달린 댓글의 총 수
-- select count(*) from freeboard_reply where freeboard_origin_no = #{freeboardOriginNo}
select count(*) from freeboard_reply where freeboard_origin_no = 301;

-- 댓글 비활성화
-- update freeboard_reply set freeboard_reply_state = 'Y' where freeboard_reply_no = #{freeboardReplyNo}
update freeboard_reply set freeboard_reply_state = 'Y' where freeboard_reply_no = 9;
