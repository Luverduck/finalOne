-- 회원 관심사(ahzit_user_interest)
-- 테이블 생성
create table ahzit_user_interest (
user_interest_id references ahzit_user(user_id) on delete cascade,
user_interest_sort varchar2(300) not null
);

-- 테이블 삭제
drop table ahzit_user_interest;
