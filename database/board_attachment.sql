-- 소모임 게시글 첨부파일(board_attachment) 테이블
-- 테이블 생성
create table board_attachment(
board_origin_no references ahzit_board(board_no) on delete cascade not null,
board_attachment_no references attachment(attachment_no) on delete cascade not null
);

-- 테이블 삭제
drop table board_attachment;
