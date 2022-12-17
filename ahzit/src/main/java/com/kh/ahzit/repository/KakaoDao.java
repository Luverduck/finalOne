package com.kh.ahzit.repository;

import com.kh.ahzit.entity.AhzitUserDto;
import com.kh.ahzit.entity.KakaoDto;

public interface KakaoDao {

	void insert(KakaoDto kakaoDto); // 카카오 로그인 테이블 등록
	
	KakaoDto selectOne(String kakaoId); // 아이디 단일 조회
}
