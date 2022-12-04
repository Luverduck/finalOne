-- 인증키(certification) 테이블
-- 테이블 생성
create table certification(
certification_no number primary key,
certification_id varchar(20) not null,
certification_key varchar(20) not null,
certification_issuedate date default sysdate not null
);

create SEQUENCE certification_seq;

-- 테이블 삭제
drop table certification;
