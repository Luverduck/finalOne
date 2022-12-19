package com.kh.ahzit.repository;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AhzitBoardLikeDaoImpl implements AhzitBoardLikeDao {

	// 의존성 주입
	@Autowired
	private SqlSession sqlSession;

	// 추상 메소드 오버라이딩 - 소모임 게시글 좋아요 갯수
	@Override
	public int boardLikeCount(int boardLikeNo) {
		return sqlSession.selectOne("ahzitBoardLike.likeCount", boardLikeNo);
	}

	// 추상 메소드 오버라이딩 - 소모임 게시글 좋아요 여부
	@Override
	public boolean isLike(int boardLikeNo, int boardLikeMemberNo) {
		// 바인딩 변수를 저장할 Map 생성
		Map<String, String> param = new HashMap<>();
		// 바인딩 변수로 사용할 값 저장
		param.put("boardLikeNo", String.valueOf(boardLikeNo));
		param.put("boardLikeMemberNo", String.valueOf(boardLikeMemberNo));
		int isLike = sqlSession.selectOne("ahzitBoardLike.isLike", param);
		return isLike == 1;
	}

	// 추상 메소드 오버라이딩 - 소모임 게시글 좋아요 등록
	@Override
	public void boardLikeInsert(int boardLikeNo, int boardLikeMemberNo) {
		// 바인딩 변수를 저장할 Map 생성
		Map<String, String> param = new HashMap<>();
		// 바인딩 변수로 사용할 값 저장
		param.put("boardLikeNo", String.valueOf(boardLikeNo));
		param.put("boardLikeMemberNo", String.valueOf(boardLikeMemberNo));
		sqlSession.insert("ahzitBoardLike.like", param);
	}

	// 추상 메소드 오버라이딩 - 소모임 게시글 좋아요 취소
	@Override
	public boolean boardLikeDelete(int boardLikeNo, int boardLikeMemberNo) {
		// 바인딩 변수를 저장할 Map 생성
		Map<String, String> param = new HashMap<>();
		// 바인딩 변수로 사용할 값 저장
		param.put("boardLikeNo", String.valueOf(boardLikeNo));
		param.put("boardLikeMemberNo", String.valueOf(boardLikeMemberNo));
		return sqlSession.delete("ahzitBoardLike.dislike", param) > 0;
	}
	
	
}
