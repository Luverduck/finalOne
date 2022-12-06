package com.kh.ahzit.repository;

import java.util.List;

import com.kh.ahzit.entity.AhzitBoardDto;
import com.kh.ahzit.entity.AhzitMemberDto;
import com.kh.ahzit.vo.AhzitBoardListSearchVO;

public interface AhzitBoardDao {
	
	// 추상 메소드 - 소모임 번호와 아이디로 특정 소모임 내 회원 정보 조회
	public AhzitMemberDto searchMemberInfo(int memberAhzitNo, String memberId);

	// 추상 메소드 - 등록을 위한 다음 게시글 번호 반환
	public int nextBoardNo();
	
	// 추상 메소드 - 소모임 게시글 등록
	public void insertBoard(AhzitBoardDto ahzitBoardDto);
	
	// 추상 메소드 - 특정 소모임 내 게시글 조회
	public List<AhzitBoardListSearchVO> selectBoardList(int boardAhzitNo);
}
