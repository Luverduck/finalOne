package com.kh.ahzit.repository;

public interface AhzitBoardReplyDao {

	// 추상 메소드 - 게시글에 달린 댓글 갯수
	public int replyCount(int boardNo);
}
