package com.kh.ahzit.vo;

import lombok.Data;

@Data
public class AhzitBoardListRestRequestVO {

	// 필드
	private int ahzitNo;
	private int memberNo;
	
	// 게시글 등록 관련
	private String boardContent;
	
	// 검색 관련
	private String keyword;
	
	// 페이징 관련
	private int p = 1; // 페이지 번호(페이지 로드시 초기 페이지를 1로 하기 위해 초기값을 1로 설정)
	private int cntRow = 10;  // 한 페이지에 표시할 열 갯수 (고정값)
	
	// 메소드
	// - 게시글 열 시작 번호
	public int rownumStart() {
		return (rownumEnd() - cntRow) + 1;
	}
	
	// - 게시글 열 끝 번호
	public int rownumEnd() {
		return p * cntRow;
	}
	
	// 마지막 페이지 블럭을 구하기 위한 게시글 총 수
	private int total;
	
	// 마지막 페이지 블럭
	public int blockLast() {
		return (total + (cntRow - 1)) / cntRow;
	}
}
