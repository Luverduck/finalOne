package com.kh.ahzit.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ahzit.entity.AhzitBoardDto;
import com.kh.ahzit.entity.AhzitMemberDto;
import com.kh.ahzit.vo.AhzitBoardVO;

@Repository
public class AhzitBoardDaoImpl implements AhzitBoardDao {
	
	// 의존성 주입
	@Autowired
	private SqlSession sqlSession;

	// 추상 메소드 오버라이딩 - 소모임 번호와 아이디로 특정 소모임 내 회원 정보 조회
	@Override
	public AhzitMemberDto searchMemberInfo(int memberAhzitNo, String memberId) {
		// 바인딩 변수를 저장할 Map 생성
		Map<String, String> param = new HashMap<>();
		// 바인딩 변수로 사용할 값 저장
		param.put("memberAhzitNo", String.valueOf(memberAhzitNo));
		param.put("memberId", memberId);
		return sqlSession.selectOne("ahzitBoard.selectMemberInfo", param);
	}
	
	// 추상 메소드 오버라이딩 - 소모임 게시글 등록
	@Override
	public void insertBoard(AhzitBoardDto ahzitBoardDto) {
		sqlSession.insert("ahzitBoard.insert", ahzitBoardDto);
	}

	// 추상 메소드 오버라이딩 - 특정 소모임 내 게시글 조회
	@Override
	public List<AhzitBoardVO> allBoardList(int boardAhzitNo) {
		return sqlSession.selectList("ahzitBoard.allList", boardAhzitNo);
	}

	// 추상 메소드 - 특정 소모임 내 게시글 검색 조회
	@Override
	public List<AhzitBoardVO> searchBoardList(int memberAhzitNo, String keyword) {
		// 바인딩 변수를 저장할 Map 생성
		Map<String, String> param = new HashMap<>();
		// 바인딩 변수로 사용할 값 저장
		param.put("memberAhzitNo", String.valueOf(memberAhzitNo));
		param.put("keyword", keyword);
		return sqlSession.selectList("ahzitBoard.searchList", param);
	}
}
