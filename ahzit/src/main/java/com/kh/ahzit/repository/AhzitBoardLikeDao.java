package com.kh.ahzit.repository;

public interface AhzitBoardLikeDao {

	// 추상 메소드 - 소모임 게시글 좋아요 갯수
	public int boardLikeCount(int boardLikeNo);
	
	// 추상 메소드 - 소모임 게시글 좋아요 여부
	public boolean isLike(int boardLikeNo, int boardLikeMemberNo);
	
	// 추상 메소드 - 소모임 게시글 좋아요 등록
	public void boardLikeInsert(int boardLikeNo, int boardLikeMemberNo);
	
	// 추상 메소드 - 소모임 게시글 좋아요 취소
	public boolean boardLikeDelete(int boardLikeNo, int boardLikeMemberNo);
}
