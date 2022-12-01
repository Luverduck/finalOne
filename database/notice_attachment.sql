-- 공지게시판 첨부파일(notice_attachment) 테이블
-- 테이블 생성
create table notice_attachment(
notice_origin_no references notice(notice_no) on delete cascade not null,
notice_attachment_no references attachment(attachment_no) on delete cascade not null
);

-- 테이블 삭제
drop table notice_attachment;