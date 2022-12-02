-- FAQ 게시판 (FAQ) 테이블
-- 테이블 생성
create table faq(
faq_no number primary key,
faq_writer references ahzit_user(user_id) on delete set null,
faq_title varchar(300) not null,
faq_content varchar(4000) not null,
faq_writedate date default sysdate not null,
faq_updatedate date
);

-- 테이블 삭제
drop table faq;

-- 시퀀스 생성
create sequence faq_seq;

-- 시퀀스 삭제
drop sequence faq_seq;
