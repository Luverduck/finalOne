-- 자유 게시글 좋아요(freeboard_like)
-- 테이블 생성
create table freeboard_like (
freeboard_like_no references freeboard(freeboard_no) on delete cascade,
freeboard_like_id references ahzit_user(user_id) on delete set null
);

-- 자유 게시글 좋아요 등록
-- insert into freeboard_like(freeboard_like_no, freeboard_like_id) values(#{freeboardLikeNo}, #{freeboardLikeId})

-- 자유 게시글 좋아요 여부를 위한 갯수 조회
-- select count(*) from freeboard_like where freeboard_like_no = #{freeboardLikeNo} and freeboard_like_id = #{freeboardLikeId}

-- 자유 게시글 좋아요 삭제
-- delete freeboard_like where freeboard_like_no = #{freeboardLikeNo} and freeboard_like_id = #{freeboardLikeId}

-- 자유 게시글 좋아요 총 갯수
select count(*) from freeboard_like where freeboard_like_no = 187;
-- select count(*) from freeboard_like where freeboard_like_no = #{freeboardLikeNo}

-- 자유 게시글 좋아요 갱신
update freeboard set freeboard_like = #{freeboardLike} where freeboard_no = #{freeboardNo}
