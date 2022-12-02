-- 소모임 신고(ahzit_report) 테이블
-- 테이블 생성
create table ahzit_report(
report_no number primary key,
report_group references ahzit(ahzit_no) on delete cascade not null,
report_id references ahzit_user(user_id) on delete set null,
report_type varchar(60) not null,
report_content varchar(300) not null,
report_state char(1) not null check(report_state in('Y','N'))
);

-- 테이블 삭제
drop table ahzit_report;

-- 시퀀스 생성
create sequence ahzit_report_seq;

-- 시퀀스 삭제
drop sequence ahzit_report_seq;
