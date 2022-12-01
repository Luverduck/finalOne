-- 소모임 좋아요(ahzit_like) 테이블
-- 테이블 생성
create table ahzit_like(
ahzit_like_no references ahzit(ahzit_no) on delete cascade not null,
ahzit_like_id references ahzit_user(user_id) on delete set null not null,
ahzit_like_date date default sysdate not null
);

-- 테이블 삭제
drop table ahzit_like;