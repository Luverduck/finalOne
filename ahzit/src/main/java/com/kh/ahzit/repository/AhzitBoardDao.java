package com.kh.ahzit.repository;

import java.util.List;

import com.kh.ahzit.entity.AhzitBoardDto;
import com.kh.ahzit.entity.AhzitMemberDto;
import com.kh.ahzit.vo.AhzitBoardListRestRequestVO;
import com.kh.ahzit.vo.AhzitBoardVO;

public interface AhzitBoardDao {
	
	// 추상 메소드 - 소모임 번호와 아이디로 특정 소모임 내 회원 정보 조회
	public AhzitMemberDto searchMemberInfo(int memberAhzitNo, String memberId);

	// 추상 메소드 - 등록을 위한 다음 게시글 번호 반환
	public int nextBoardNo();
	
	// 추상 메소드 - 소모임 게시글 등록
	public void insertBoard(AhzitBoardDto ahzitBoardDto);
	
	// 추상 메소드 - 소모임 게시글 등록 처리 후 반환을 위한 조회
	public AhzitBoardVO selectInsertBoard(int boardNo, AhzitBoardListRestRequestVO ahzitBoardListRestRequestVO);
	
	// 추상 메소드 - 특정 소모임 내 게시글 조회
	public List<AhzitBoardVO> selectBoardList(AhzitBoardListRestRequestVO ahzitBoardListRestRequestVO);
	
	// 추상 메소드 - 특정 소모임 내 게시글 전체 조회
	public List<AhzitBoardVO> allBoardList(AhzitBoardListRestRequestVO ahzitBoardListRestRequestVO);
	
	// 추상 메소드 - 특정 소모임 내 게시글 검색 조회
	public List<AhzitBoardVO> searchBoardList(AhzitBoardListRestRequestVO ahzitBoardListRestRequestVO);
	
	// 추상 메소드 - 소모임 게시글 수정
	public boolean editBoard(AhzitBoardDto ahzitBoardDto);
	
	// 추상 메소드 - 소모임 게시글 삭제
	public boolean deleteBoard(int boardNo, int boardWriterNo);
}
