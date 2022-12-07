package com.kh.ahzit.repository;

import java.util.List;

import com.kh.ahzit.entity.AhzitBoardDto;
import com.kh.ahzit.entity.AhzitMemberDto;
import com.kh.ahzit.vo.AhzitBoardVO;

public interface AhzitBoardDao {
	
	// 추상 메소드 - 소모임 번호와 아이디로 특정 소모임 내 회원 정보 조회
	public AhzitMemberDto searchMemberInfo(int memberAhzitNo, String memberId);

	// 추상 메소드 - 소모임 게시글 등록
	public void insertBoard(AhzitBoardDto ahzitBoardDto);
	
	// 추상 메소드 - 특정 소모임 내 게시글 전체 조회
	public List<AhzitBoardVO> allBoardList(int boardAhzitNo);
	
	// 추상 메소드 - 특정 소모임 내 게시글 검색 조회
	public List<AhzitBoardVO> searchBoardList(int memberAhzitNo, String keyword);
}
