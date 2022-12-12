package com.kh.ahzit.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ahzit.entity.AhzitBoardDto;
import com.kh.ahzit.entity.AhzitMemberDto;
import com.kh.ahzit.vo.AhzitBoardListRestRequestVO;
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
	
	// 추상 메소드 오버라이딩 - 등록을 위한 다음 게시글 번호 반환
	@Override
	public int nextBoardNo() {
		return sqlSession.selectOne("ahzitBoard.nextBoardNo");
	}
	
	// 추상 메소드 오버라이딩 - 소모임 게시글 등록
	@Override
	public void insertBoard(AhzitBoardDto ahzitBoardDto) {
		sqlSession.insert("ahzitBoard.insertBoard", ahzitBoardDto);
	}
	
	// 추상 메소드 오버라이딩 - 소모임 게시글 등록 처리 후 반환을 위한 조회
	@Override
	public AhzitBoardVO selectInsertBoard(int boardNo, AhzitBoardListRestRequestVO ahzitBoardListRestRequestVO) {
		// 바인딩 변수를 저장할 Map 생성
		Map<String, String> param = new HashMap<>();
		// 바인딩 변수로 사용할 값 저장
		param.put("memberAhzitNo", String.valueOf(ahzitBoardListRestRequestVO.getAhzitNo()));
		param.put("memberNo", String.valueOf(ahzitBoardListRestRequestVO.getMemberNo()));
		param.put("boardNo", String.valueOf(boardNo));
		return sqlSession.selectOne("ahzitBoard.selectInsertBoard", param);
	}
	
	// 추상 메소드 - 특정 소모임 내 게시글 조회
	@Override
	public List<AhzitBoardVO> selectBoardList(AhzitBoardListRestRequestVO ahzitBoardListRestRequestVO) {
		// 검색어 존재 여부에 따라 다른 처리
		if(ahzitBoardListRestRequestVO.getKeyword().equals("")) { // 검색어가 없을 경우
			return allBoardList(ahzitBoardListRestRequestVO); // 전체 조회
		} else { // 검색어가 있을 경우
			return searchBoardList(ahzitBoardListRestRequestVO); // 검색 조회
		}
	}

	// 추상 메소드 오버라이딩 - 특정 소모임 내 게시글 전체 조회
	@Override
	public List<AhzitBoardVO> allBoardList(AhzitBoardListRestRequestVO ahzitBoardListRestRequestVO) {
		// 바인딩 변수를 저장할 Map 생성
		Map<String, String> param = new HashMap<>();
		// 바인딩 변수로 사용할 값 저장
		param.put("memberAhzitNo", String.valueOf(ahzitBoardListRestRequestVO.getAhzitNo()));
		param.put("memberNo", String.valueOf(ahzitBoardListRestRequestVO.getMemberNo()));
		param.put("rownumStart", String.valueOf(ahzitBoardListRestRequestVO.rownumStart()));
		param.put("rownumEnd", String.valueOf(ahzitBoardListRestRequestVO.rownumEnd()));
		return sqlSession.selectList("ahzitBoard.allList", param);
	}

	// 추상 메소드 - 특정 소모임 내 게시글 검색 조회
	@Override
	public List<AhzitBoardVO> searchBoardList(AhzitBoardListRestRequestVO ahzitBoardListRestRequestVO) {
		// 바인딩 변수를 저장할 Map 생성
		Map<String, String> param = new HashMap<>();
		// 바인딩 변수로 사용할 값 저장
		param.put("memberAhzitNo", String.valueOf(ahzitBoardListRestRequestVO.getAhzitNo()));
		param.put("memberNo", String.valueOf(ahzitBoardListRestRequestVO.getMemberNo()));
		param.put("keyword", ahzitBoardListRestRequestVO.getKeyword());
		param.put("rownumStart", String.valueOf(ahzitBoardListRestRequestVO.rownumStart()));
		param.put("rownumEnd", String.valueOf(ahzitBoardListRestRequestVO.rownumEnd()));
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
