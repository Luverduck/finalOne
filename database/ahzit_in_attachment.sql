-- 소모임 첨부파일(ahzit_in_attachment)
-- 테이블 생성
create table ahzit_in_attachment (
ahzit_in_attachment_no references attachment(attachment_no) on delete cascade not null
ahzit_in_member_no references ahzit_member(member_no) on delete cascade not null
);

-- 테이블 삭제
drop table ahzit_in_attachment;
