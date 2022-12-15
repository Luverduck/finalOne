package com.kh.ahzit.vo;

import lombok.Data;

@Data
public class AhzitBoardReplyRestRequestVO {

	// 필드
	private int ahzitNo;
	private int memberNo;
	private int replyNo;
	private int boardNo;
	
	// 댓글 등록 관련
	private String replyContent;
	
	// 페이징 관련
	private int rp = 1; // 조회할 댓글 페이지 번호
	private int cntRow = 5;  // 한 게시글에 표시할 댓글 갯수 (고정값)
	
	// 메소드
	// - 현재 페이지 열 시작 번호 반환
	public int rownumStart() {
		return (rownumEnd() - cntRow) + 1;
	}
	
	// - 현재 페이지 열 끝 번호 반환
	public int rownumEnd() {
		return rp * cntRow;
	}
}
