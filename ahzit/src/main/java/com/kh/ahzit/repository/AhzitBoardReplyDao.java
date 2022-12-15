package com.kh.ahzit.repository;

import java.util.List;

import com.kh.ahzit.vo.AhzitBoardReplyRestRequestVO;
import com.kh.ahzit.vo.AhzitBoardReplyRestResponseVO;

public interface AhzitBoardReplyDao {

	// 추상 메소드 - 다음 댓글 번호 반환
	public int nextReplyNo();
	
	// 추상 메소드 - 댓글 등록
	public void insertReply(AhzitBoardReplyRestRequestVO ahzitBoardReplyRestRequestVO);
	
	// 추상 메소드 - 댓글 수정
	public boolean editReply(AhzitBoardReplyRestRequestVO ahzitBoardReplyRestRequestVO);
	
	// 추상 메소드 - 댓글 삭제
	public boolean deleteReply(AhzitBoardReplyRestRequestVO ahzitBoardReplyRestRequestVO);
	
	// 추상 메소드 - 댓글 목록
	public List<AhzitBoardReplyRestResponseVO> selectReplyList(AhzitBoardReplyRestRequestVO ahzitBoardReplyRestRequestVO);
}
