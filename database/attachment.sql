-- 첨부파일(attachment) 테이블
-- 테이블 생성
create table attachment (
attachment_no number primary key,
attachment_name varchar2(256) not null,
attachment_type varchar2(30) not null,
attachment_size number not null check(attachment_size >= 0),
attachment_date date default sysdate not null
);

-- 테이블 삭제
drop table attachment;

-- 시퀀스 생성
create sequence attachment_seq;

-- 시퀀스 삭제
drop sequence attachment_seq;

-- 다음 첨부파일 번호 반환
select attachment_seq.nextval from dual;

-- 첨부파일 등록
-- insert into attachment(attachment_no, attachment_name, attachment_type, attachment_size) values(#{attachmentNo}, #{attachmentName}, #{attachmentSize})

-- 첨부파일 조회
-- select * from attachment where attachmen_no = #{attachmentNo}
select * from attachment where attachment_no = 4;
