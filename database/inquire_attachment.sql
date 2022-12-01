-- 1:1문의 첨부파일(inquire_attachment) 테이블
-- 테이블 생성
create table inquire_attachment(
inquire_origin_no references inquire(inquire_no) on delete cascade not null,
inquire_attachment_no references attachment(attachment_no) on delete cascade not null
);

-- 테이블 삭제
drop table inquire_attachment;
