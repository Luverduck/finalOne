-- 소모임 회원(ahzit_member)
-- 테이블 생성
create table ahzit_member(
member_no number primary key,
member_ahzit_no references ahzit(ahzit_no) on delete cascade,
member_id references ahzit_user(user_id) on delete set null,
member_grade varchar2(9) default '일반' check(member_grade in ('일반', '개설자')) not null,
member_score number default 0 check(member_score >= 0) not null,
member_joindate date not null
);

-- 테이블 삭제
drop table ahzit_member;

-- 시퀀스 생성
create sequence ahzit_member_seq;

-- 시퀀스 삭제
drop sequence ahzit_member_seq;

-- 소모임 회원 더미 데이터
-- 개설자
insert into ahzit_member(member_no, member_ahzit_no, member_id, member_grade, member_joindate) values ('테스터111', 5, 'tester111', '개설자', sysdate);
-- 회원
insert into ahzit_member(member_no, member_ahzit_no, member_id, member_joindate) values ('테스터222', 5, 'tester222', sysdate);
