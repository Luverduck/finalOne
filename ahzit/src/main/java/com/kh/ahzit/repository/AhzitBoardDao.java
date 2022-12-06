package com.kh.ahzit.repository;

import com.kh.ahzit.entity.AhzitBoardDto;

public interface AhzitBoardDao {

	// 추상 메소드 - 등록을 위한 다음 게시글 번호 반환
	public int nextBoardNo();
	
	// 추상 메소드 - 소모임 게시글 등록
	public void insertBoard(AhzitBoardDto ahzitBoardDto);
}
