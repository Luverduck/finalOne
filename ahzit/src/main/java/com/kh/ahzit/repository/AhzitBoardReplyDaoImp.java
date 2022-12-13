package com.kh.ahzit.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AhzitBoardReplyDaoImp implements AhzitBoardReplyDao {

	// 의존성 주입
	@Autowired
	private SqlSession sqlSession;
	
	// 추상 메소드 오버라이딩 - 게시글에 달린 댓글 갯수
	@Override
	public int replyCount(int boardNo) {
		return sqlSession.selectOne("ahzitBoardReply.replyCount", boardNo);
	}

	
}
