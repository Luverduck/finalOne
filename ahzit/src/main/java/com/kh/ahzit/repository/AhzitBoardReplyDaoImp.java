package com.kh.ahzit.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ahzit.vo.AhzitBoardReplyRestRequestVO;
import com.kh.ahzit.vo.AhzitBoardReplyVO;

@Repository
public class AhzitBoardReplyDaoImp implements AhzitBoardReplyDao {

	// 의존성 주입
	@Autowired
	private SqlSession sqlSession;

	// 추상 메소드 오버라이딩 - 다음 댓글 번호 반환
	@Override
	public int nextReplyNo() {
		return sqlSession.selectOne("ahzitBoardReply.nextReplyNo");
	}

	// 추상 메소드 오버라이딩 - 댓글 등록
	@Override
	public void insertReply(AhzitBoardReplyRestRequestVO ahzitBoardReplyRestRequestVO) {
		// 바인딩 변수를 저장할 Map 생성
		Map<String, String> param = new HashMap<>();
		// 바인딩 변수로 사용할 값 저장
		param.put("replyNo", String.valueOf(ahzitBoardReplyRestRequestVO.getReplyNo()));
		param.put("replyWriterNo", String.valueOf(ahzitBoardReplyRestRequestVO.getMemberNo()));
		param.put("replyOriginNo", String.valueOf(ahzitBoardReplyRestRequestVO.getBoardNo()));
		param.put("replyContent", ahzitBoardReplyRestRequestVO.getReplyContent());
		sqlSession.insert("ahzitBoardReply.insertReply", param);
	}

	// 추상 메소드 - 댓글 등록 후 댓글 정보 조회
	@Override
	public AhzitBoardReplyVO selectReply(int replyNo) {
		return sqlSession.selectOne("ahzitBoardReply.selectReply", replyNo);
	}
	
	// 추상 메소드 오버라이딩 - 댓글 수정
	@Override
	public boolean editReply(AhzitBoardReplyRestRequestVO ahzitBoardReplyRestRequestVO) {
		// 바인딩 변수를 저장할 Map 생성
		Map<String, String> param = new HashMap<>();
		// 바인딩 변수로 사용할 값 저장
		param.put("replyContent", ahzitBoardReplyRestRequestVO.getReplyContent());
		param.put("replyNo", String.valueOf(ahzitBoardReplyRestRequestVO.getReplyNo()));
		return sqlSession.update("ahzitBoardReply.updateReply", param) > 0;
	}

	// 추상 메소드 오버라이딩 - 댓글 삭제
	@Override
	public boolean deleteReply(int replyNo) {
		return sqlSession.delete("ahzitBoardReply.deleteReply", replyNo) > 0;
	}

	// 추상 메소드 오버라이딩 - 댓글 목록
	@Override
	public List<AhzitBoardReplyVO> selectReplyList(AhzitBoardReplyRestRequestVO ahzitBoardReplyRestRequestVO) {
		// 바인딩 변수를 저장할 Map 생성
		Map<String, String> param = new HashMap<>();
		// 바인딩 변수로 사용할 값 저장
		param.put("replyOriginNo", String.valueOf(ahzitBoardReplyRestRequestVO.getBoardNo()));
		param.put("rownumStart", String.valueOf(ahzitBoardReplyRestRequestVO.rownumStart()));
		param.put("rownumEnd", String.valueOf(ahzitBoardReplyRestRequestVO.rownumEnd()));
		return sqlSession.selectList("ahzitBoardReply.selectReplyList", param);
	}

	// 추상 메소드 오버라이딩 - 특정 게시글에 달린 댓글의 총 수
	@Override
	public int countReply(int replyOriginNo) {
		return sqlSession.selectOne("ahzitBoardReply.countReply", replyOriginNo);
	}
}
