package com.kh.ahzit.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ahzit.entity.AhzitBoardDto;

@Repository
public class AhzitBoardDaoImpl implements AhzitBoardDao {
	
	// 의존성 주입
	@Autowired
	private SqlSession sqlSession;

	// 추상 메소드 오버라이딩 - 등록을 위한 다음 게시글 번호 반환
	@Override
	public int nextBoardNo() {
		return sqlSession.selectOne("ahzitBoard.nextBoardNo");
	}

	// 추상 메소드 오버라이딩 - 소모임 게시글 등록
	@Override
	public void insertBoard(AhzitBoardDto ahzitBoardDto) {
		sqlSession.insert("insertBoard", ahzitBoardDto);
	}

}
