-- 인증키(certification) 테이블
-- 테이블 생성
create table certification(
certification_id references ahzit_user(user_id) on delete cascade not null,
certification_key varchar(20) not null,
certification_issuedate date default sysdate not null
);

-- 테이블 삭제
drop table certification;