package com.kh.ahzit.vo;

import lombok.Data;

@Data
public class FreeboardListSeachVO {

	// 검색 관련
	// 필드
	private String type;
	private String keyword;
	
	// 메소드
	// 검색 조회인지 여부 반환
	public boolean isSearch() {
		// 유형(type), 검색어(keyword) 둘다 null이 아니면 true를 반환
		return type != null && keyword != null;
	}
}
