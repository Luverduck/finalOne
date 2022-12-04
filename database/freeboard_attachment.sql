-- 자유게시판 첨부파일(freeboard_attachment) 테이블
-- 테이블 생성
create table freeboard_attachment(
freeboard_origin_no references freeboard(freeboard_no) on delete cascade not null,
freeboard_attachment_no references attachment(attachment_no) on delete cascade not null
);

-- 테이블 삭제
drop table freeboard_attachment;

-- 게시글 첨부파일 등록
-- insert into freeboard_attachment(freeboard_origin_no, freeboard_attachment_no) values(#{freeboardOriginNo}, #{freeboardAttachmentNo})

-- 게시글 원본 번호와 연결된 첨부파일 전체 조회
select * from freeboard_attachment fa inner join attachment a on fa.freeboard_attachment_no = a.attachment_no;
select faa.attachment_no, faa.attachment_name, faa.attachment_type, faa.attachment_size, faa.attachment_date from freeboard f left outer join (select * from freeboard_attachment fa inner join attachment a on fa.freeboard_attachment_no = a.attachment_no) faa on f.freeboard_no = faa.freeboard_origin_no where f.freeboard_no = 186; 
-- select faa.attachment_no, faa.attachment_name, faa.attachment_type, faa.attachment_size, faa.attachment_date from freeboard f left outer join (select * from freeboard_attachment fa inner join attachment a on fa.freeboard_attachment_no = a.attachment_no) faa on f.freeboard_no = faa.freeboard_origin_no where f.freeboard_no = #{freeboardNo}

-- 게시글 단일조회 + 첨부파일
select f.freeboard_no, f.freeboard_writer, f.freeboard_title, f.freeboard_read, f.freeboard_like, f.freeboard_writedate, fa.freeboard_attachment_no from (select * from freeboard where freeboard_no = 150)f left outer join freeboard_attachment fa on f.freeboard_no = fa.freeboard_origin_no;
-- select f.freeboard_no, f.freeboard_writer, f.freeboard_title, f.freeboard_read, f.freeboard_like, f.freeboard_writedate, fa.freeboard_attachment_no from (select * from freeboard where freeboard_no = #{freeboardNo})f left outer join freeboard_attachment fa on f.freeboard_no = fa.freeboard_origin_no
