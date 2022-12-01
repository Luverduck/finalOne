-- 소모임 회원 프로필 첨부파일(member_attachment)
-- 테이블 생성
create table member_attachment (
member_origin_nick references ahzit_member(member_nick) on delete cascade not null,
member_attachment_no references attachment(attachment_no) on delete cascade not null
);

-- 테이블 삭제
drop table member_attachment;