package com.kh.ahzit.repository;

import com.kh.ahzit.entity.FreeboardLikeDto;

public interface FreeboardLikeDao {

	// 추상 메소드 - 자유 게시글 좋아요 등록
	public void insertFreeboardLike(FreeboardLikeDto freeboardLikeDto);
	
	// 추상 메소드 - 자유 게시글 좋아요 여부를 위한 갯수 조회
	public boolean checkFreeboardLike(int freeboardLikeNo, String freeboardLikeId);
	
	// 추상 메소드 - 자유 게시글 좋아요 삭제
	public boolean deleteFreeboardLike(FreeboardLikeDto freeboardLikeDto);
	
	// 추상 메소드 - 자유 게시글 좋아요 총 갯수 갱신
	public boolean updateFreeboardLikeCount(int freeboardNo);
}
