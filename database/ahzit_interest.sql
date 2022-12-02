-- 소모임 관심사(ahzit_interest)
-- 테이블 생성
create table ahzit_interest (
ahzit_interest_no number primary key,
ahzit_interest_id references ahzit_user(user_id) on delete cascade,
ahzit_interest_sort varchar2(9) not null check(user_interest in('취미','스터디','일상','팬클럽','음악','스포츠','여행','맛집')) not null
);

-- 테이블 삭제
drop table ahzit_interest;

-- 시퀀스 생성
create sequence ahzit_interest_seq;

-- 시퀀스 삭제
drop sequence ahzit_interest_seq;