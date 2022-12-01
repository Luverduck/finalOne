-- 자유게시판 첨부파일(freeboard_attachment) 테이블
-- 테이블 생성
create table freeboard_attachment(
freeboard_origin_no references freeboard(freeboard_no) on delete cascade not null,
freeboard_attachment_no references attachment(attachment_no) on delete cascade not null
);

-- 테이블 삭제
drop table freeboard_attachment;
