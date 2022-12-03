package com.kh.ahzit.repository;

import com.kh.ahzit.entity.FreeboardDto;

public interface FreeboardDao {

	// 추상 메소드 - 등록할 게시글 번호 반환
	public int nextFreeboardNo();
	
	// 추상 메소드 - 자유게시판 게시글 등록
	public void insertFreeboard(FreeboardDto freeboardDto);
}
