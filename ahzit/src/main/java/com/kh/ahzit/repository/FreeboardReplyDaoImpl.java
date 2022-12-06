package com.kh.ahzit.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ahzit.entity.FreeboardReplyDto;
import com.kh.ahzit.vo.FreeboardReplyListVO;

@Repository
public class FreeboardReplyDaoImpl implements FreeboardReplyDao {

	// 의존성 주입
	@Autowired
	private SqlSession sqlSession;
	
	// 추상 메소드 오버라이딩 - 자유게시글 다음 댓글 번호 반환
	@Override
	public int nextFreeboardReplyNo() {
		return sqlSession.selectOne("freeboard_reply.nextFreeboardReplyNo");
	}

	// 추상 메소드 오버라이딩 - 자유게시글 댓글 등록
	@Override
	public void insertFreeboardReply(FreeboardReplyDto freeboardReplyDto) {
		sqlSession.insert("freeboard_reply.insert", freeboardReplyDto);
	}

	// 추상 메소드 - 자유게시글 댓글 조회 + 페이징
	@Override
	public List<FreeboardReplyDto> selectFreeboardReply(int freeboardOriginNo, FreeboardReplyListVO freeboardReplyListVO) {
		// 바인딩 변수를 저장할 Map 생성
		Map<String, String> param = new HashMap<>();
		// 바인딩 변수로 사용할 값 저장
		param.put("freeboardOriginNo", String.valueOf(freeboardOriginNo));
		param.put("rownumStart", String.valueOf(freeboardReplyListVO.rownumStart()));
		param.put("rownumEnd", String.valueOf(freeboardReplyListVO.rownumEnd()));
		return sqlSession.selectList("freeboard_reply.selectList", param);
	}

	// 추상 메소드 - 자유게시글 특정 게시글에 달린 댓글의 총 수
	@Override
	public int countFreeboardReply(int freeboardOriginNo) {
		return sqlSession.selectOne("freeboard_reply.count", freeboardOriginNo);
	}

	// 추상 메소드 - 자유게시글 댓글 수정
	@Override
	public boolean editFreeboardReply(FreeboardReplyDto freeboardReplyDto) {
		return sqlSession.update("freeboard_reply.update", freeboardReplyDto) > 0;
	}

	// 추상 메소드 - 자유게시글 댓글 비활성화
	@Override
	public boolean inactiveFreeboardReply(int freeboardReplyNo) {
		return sqlSession.update("freeboard_reply.inactive", freeboardReplyNo) > 0;
	}
}
