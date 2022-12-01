-- 소모임(ahzit) 테이블
-- 테이블 생성
create table ahzit(
ahzit_no number primary key,
ahzit_leader references ahzit_user(user_id) on delete cascade not null,
ahzit_sort varchar2(9) not null check(ahzit_sort in('취미','스터디','일상','팬클럽','음악','스포츠','여행','맛집')),
ahzit_name varchar2(60) not null,
ahzit_inforo varchar(300) not null,
ahzit_head number default 1 not null check(ahzit_head >= 1),
ahzit_region varchar2(12) not null,
ahzit_like number default 0 not null check(ahzit_like >= 0),
ahzit_score number default 0 not null check(ahzit_score >= 0),
ahzit_ispublic char(1) not null check(ahzit_ispublic in('Y','N'))
);

-- 테이블 삭제
drop table ahzit;

-- 시퀀스 생성
create sequence ahzit_seq;

-- 시퀀스 삭제
drop sequence ahzit_seq;