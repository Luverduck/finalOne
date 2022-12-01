-- 소모임 프로필 첨부파일(ahzit_attachment)
-- 테이블 생성
create table ahzit_attachment(
ahzit_origin_no references ahzit(ahzit_no) on delete cascade not null,
ahzit_attachment_no references attachment(attachment_no) on delete cascade not null
);

-- 테이블 삭제
drop table ahzit_attachment;