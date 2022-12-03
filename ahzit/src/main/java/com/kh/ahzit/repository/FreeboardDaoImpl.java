package com.kh.ahzit.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.ahzit.entity.FreeboardDto;

@Repository
public class FreeboardDaoImpl implements FreeboardDao {

	// 의존성 주입
	private SqlSession sqlSession;

	// 추상 메소드 오버라이딩 - 등록할 게시글 번호 반환
	@Override
	public int nextFreeboardNo() {
		return sqlSession.selectOne("freeboard.nextFreeboardNo");
	}

	// 추상 메소드 오버라이딩 - 자유게시판 게시글 등록
	@Override
	public void insertFreeboard(FreeboardDto freeboardDto) {
		sqlSession.insert("freeboard.insert");
	}
}
