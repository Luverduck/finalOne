package com.kh.ahzit.repository;

import java.util.List;

import com.kh.ahzit.vo.AhzitBoardReplyRestRequestVO;
import com.kh.ahzit.vo.AhzitBoardReplyVO;

public interface AhzitBoardReplyDao {

	// 추상 메소드 - 다음 댓글 번호 반환
	public int nextReplyNo();
	
	// 추상 메소드 - 댓글 등록
	public void insertReply(AhzitBoardReplyRestRequestVO ahzitBoardReplyRestRequestVO);
	
	// 추상 메소드 - 댓글 등록 후 댓글 정보 조회
	AhzitBoardReplyVO selectReply(int replyNo);
	
	// 추상 메소드 - 댓글 수정
	public boolean editReply(AhzitBoardReplyRestRequestVO ahzitBoardReplyRestRequestVO);
	
	// 추상 메소드 - 댓글 삭제
	public boolean deleteReply(AhzitBoardReplyRestRequestVO ahzitBoardReplyRestRequestVO);
	
	// 추상 메소드 - 댓글 목록
	public List<AhzitBoardReplyVO> selectReplyList(AhzitBoardReplyRestRequestVO ahzitBoardReplyRestRequestVO);
	
	// 추상 메소드 - 특정 게시글에 달린 댓글의 총 수
	public int countReply(int replyOriginNo);
}
