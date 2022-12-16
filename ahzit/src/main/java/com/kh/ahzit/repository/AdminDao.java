package com.kh.ahzit.repository;

import java.util.List;

import com.kh.ahzit.entity.AhzitUserDto;

public interface AdminDao {
	
	void insert(AhzitUserDto ahzitUserDto); // 관리자 생성
	
	 List<AhzitUserDto> selectList(); // 회원 조회
}
