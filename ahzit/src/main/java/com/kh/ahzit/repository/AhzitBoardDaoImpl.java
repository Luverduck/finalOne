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
		sqlSession.insert("ahzitBoard.insertBoard", ahzitBoardDto);
	}
	
	// 추상 메소드 - 특정 소모임 내 게시글 조회
	@Override
	public List<AhzitBoardVO> selectBoardList(int boardAhzitNo, String keyword) {
		// 검색어 존재 여부에 따라 다른 처리
		if(keyword.equals("")) { // 검색어가 없을 경우
			return allBoardList(boardAhzitNo); // 전체 조회
		}
		else { // 검색어가 있을 경우
			return searchBoardList(boardAhzitNo, keyword); // 검색 조회
		}
	}

	// 추상 메소드 오버라이딩 - 특정 소모임 내 게시글 전체 조회
	@Override
	public List<AhzitBoardVO> allBoardList(int boardAhzitNo) {
		return sqlSession.selectList("ahzitBoard.allList", boardAhzitNo);
	}

	// 추상 메소드 - 특정 소모임 내 게시글 검색 조회
	@Override
	public List<AhzitBoardVO> searchBoardList(int boardAhzitNo, String keyword) {
		// 바인딩 변수를 저장할 Map 생성
		Map<String, String> param = new HashMap<>();
		// 바인딩 변수로 사용할 값 저장
		param.put("memberAhzitNo", String.valueOf(boardAhzitNo));
		param.put("keyword", keyword);
		return sqlSession.selectList("ahzitBoard.searchList", param);
	}

	// 추상 메소드 - 소모임 게시글 수정
	@Override
	public boolean editBoard(AhzitBoardDto ahzitBoardDto) {
		// 바인딩 변수를 저장할 Map 생성
		Map<String, String> param = new HashMap<>();
		// 바인딩 변수로 사용할 값 저장
		param.put("boardNo", String.valueOf(ahzitBoardDto.getBoardNo()));
		param.put("boardWriterNo", String.valueOf(ahzitBoardDto.getBoardWriterNo()));
		param.put("boardContent", ahzitBoardDto.getBoardContent());
		return sqlSession.update("ahzitBoard.updateBoard", param) > 0;
	}

	// 추상 메소드 - 소모임 게시글 삭제
	@Override
	public boolean deleteBoard(int boardNo, int boardWriterNo) {
		// 바인딩 변수를 저장할 Map 생성
		Map<String, String> param = new HashMap<>();
		// 바인딩 변수로 사용할 값 저장
		param.put("boardNo", String.valueOf(boardNo));
		param.put("boardWriterNo", String.valueOf(boardWriterNo));
		return sqlSession.delete("ahzitBoard.deleteBoard", param) > 0;
	}
}
