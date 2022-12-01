-- QnA 첨부파일(qna_attachment) 테이블
-- 테이블 생성
create table qna_attachment(
qna_origin_no references qna(qna_no) on delete cascade not null,
qna_attachment_no references attachment(attachment_no) on delete cascade not null
);

-- 테이블 삭제
drop table qna_attachment;
