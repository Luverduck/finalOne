-- 자유 게시글 좋아요(freeboard_like)
-- 테이블 생성
create table freeboard_like (
freeboard_like_no references freeboard(freeboard_no) on delete cascade,
freeboard_like_id references ahzit_user(user_id) on delete set null
);