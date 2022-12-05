package com.kh.ahzit.repository;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ahzit.entity.FreeboardLikeDto;

@Repository
public class FreeboardLikeDaoImpl implements FreeboardLikeDao {
	
	// 의존성 주입
	@Autowired
	private SqlSession sqlSession;

	// 추상 메소드 오버라이딩 - 자유 게시글 좋아요 등록
	@Override
	public void insertFreeboardLike(FreeboardLikeDto freeboardLikeDto) {
		sqlSession.insert("freeboard_like.insert", freeboardLikeDto);
	}

	// 추상 메소드 오버라이딩 - 자유 게시글 좋아요 여부를 위한 갯수 조회
	@Override
	public boolean checkFreeboardLike(int freeboardLikeNo, String freeboardLikeId) {
		// 변수 바인딩을 위한 Map 생성
		Map<String, String> param = new HashMap<>();
		// 생성한 Map의 type과 keyword를 freeboardListSeachVO의 type과 keyword로 설정
		param.put("freeboardLikeNo", String.valueOf(freeboardLikeNo));
		param.put("freeboardLikeId", freeboardLikeId);
		int isLike = sqlSession.selectOne("freeboard_like.isLike", param);
		return isLike == 1;
	}

	// 추상 메소드 오버라이딩 - 자유 게시글 좋아요 삭제
	@Override
	public boolean deleteFreeboardLike(FreeboardLikeDto freeboardLikeDto) {
		return sqlSession.delete("freeboard_like.delete", freeboardLikeDto) > 0;
	}

	// 추상 메소드 오버라이딩 - 자유 게시글 좋아요 총 갯수 갱신
	@Override
	public boolean updateFreeboardLikeCount(int freeboardNo) {
		return sqlSession.update("freeboard_like.updateCount", freeboardNo) > 0;
	}
}
