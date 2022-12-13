	package com.kh.ahzit.repository;

import com.kh.ahzit.entity.AhzitUserInterestDto;

public interface AhzitUserInterestDao {
		
	void insert(AhzitUserInterestDto ahzitUserInterestDto); // 관심사 등록
	
	boolean edit(AhzitUserInterestDto ahzitUserInterestDto); // 관심
	
	public boolean delete(String userInterestId); // 관심사 삭제
}
