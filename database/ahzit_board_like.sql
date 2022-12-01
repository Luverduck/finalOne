-- 소모임 게시글 좋아요(board_member_like)
-- 테이블 생성
create table ahzit_board_like (
board_like_no references ahzit_board(board_no) on delete cascade,
board_like_nick references ahzit_member(member_nick) on delete cascade,
board_like_date date default sysdate not null
);

-- 테이블 삭제
drop table ahzit_board_like;