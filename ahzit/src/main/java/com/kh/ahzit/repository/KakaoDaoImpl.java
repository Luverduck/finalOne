package com.kh.ahzit.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ahzit.entity.KakaoDto;

@Repository
public class KakaoDaoImpl implements KakaoDao {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insert(KakaoDto kakaoDto) {
		sqlSession.insert("kakao.insert", kakaoDto);
		
	}

	@Override
	public KakaoDto selectOne(String kakaoId) {
		return sqlSession.selectOne("kakao.one", kakaoId);
	}

}
