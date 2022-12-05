package com.kh.ahzit.repository;

import java.util.List;

import com.kh.ahzit.entity.FreeboardDto;
import com.kh.ahzit.vo.FreeboardListSeachVO;

public interface FreeboardDao {

	// 추상 메소드 - 등록할 자유게시글 번호 반환
	public int nextFreeboardNo();
	
	// 추상 메소드 - 자유게시글 등록
	public void insertFreeboard(FreeboardDto freeboardDto);
	
	// 추상 메소드 - 자유게시글 조회
	public List<FreeboardDto> searchFreeboard(FreeboardListSeachVO freeboardListSeachVO);
	
	// 추상 메소드 - 자유게시글 검색 조회
	public List<FreeboardDto> selectSearch(FreeboardListSeachVO freeboardListSeachVO);
	
	// 추상 메소드 - 자유게시글 전체 조회
	public List<FreeboardDto> selectAll(FreeboardListSeachVO freeboardListSeachVO);
	
	// 추상 메소드 - 자유게시글 게시글 총 갯수 반환
	public int countFreeboard(FreeboardListSeachVO freeboardListSeachVO);
	
	// 추상 메소드 - 자유게시글 검색 조회시 게시글 총 갯수 반환
	public int searchCountFreeboard(FreeboardListSeachVO freeboardListSeachVO);
	
	// 추상 메소드 - 자유게시글 전체 조회시 게시글 총 갯수 반환
	public int allCountFreeboard();
	
	// 추상 메소드 - 자유게시글 상세 조회
	public FreeboardDto detailFreeboard(int freeboardNo);
	
	// 추상 메소드 - 조회수 증가
	public void updateFreeboardRead(int freeboardNo);
	
	// 추상 메소드 - 자유게시글 수정
	public boolean updateFreeboard(FreeboardDto freeboardDto);
	
	// 추상 메소드 - 자유게시글 비활성화
	public boolean inactiveFreeboard(int freeboardNo);
	
	// 추상 메소드 - 자유게시글 삭제
	public boolean deleteFreeboard(int freeboardNo);
}
