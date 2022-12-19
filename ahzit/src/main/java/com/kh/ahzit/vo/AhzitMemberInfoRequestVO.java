package com.kh.ahzit.vo;

import lombok.Data;

@Data
public class AhzitMemberInfoRequestVO {

	// 필드
	private int ahzitNo;
	private int memberNo;
	
	// 검색 관련
	private String keyword;
	
	// 메소드
	// 검색 조회인지 여부 반환
	public boolean isSearch() {
		// 유형(type), 검색어(keyword) 둘다 null이 아니면 true를 반환
		return keyword != null;
	}
	
	// 페이징 관련
	private int p = 1; // 페이지 번호(페이지 로드시 초기 페이지를 1로 하기 위해 초기값을 1로 설정)
	private int cntRow = 10;  // 한 페이지에 표시할 열 갯수 (고정값)
	
	// 메소드
	// - 회원 정보 열 시작 번호
	public int rownumStart() {
		return (rownumEnd() - cntRow) + 1;
	}
	
	// - 회원 정보 열 끝 번호
	public int rownumEnd() {
		return p * cntRow;
	}
	
	// 회원 정보 마지막 페이지 블럭을 구하기 위한 게시글 총 수
	private int memberCount;
	
	// 회원 정보 마지막 페이지 블럭
	public int blockLast() {
		return (memberCount + (cntRow - 1)) / cntRow;
	}
}
