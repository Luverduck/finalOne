package com.kh.ahzit.repository;

import com.kh.ahzit.entity.AhzitUserDto;

public interface AhzitUserDao {

	void join(AhzitUserDto ahzitUserDto); // 회원 가입

	AhzitUserDto selectOne(String userId); // 회원 단일 조회

	
	
	
}
