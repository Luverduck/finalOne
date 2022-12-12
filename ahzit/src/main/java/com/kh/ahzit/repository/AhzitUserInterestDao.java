package com.kh.ahzit.repository;

import com.kh.ahzit.entity.AhzitUserInterestDto;

public interface AhzitUserInterestDao {
	
	public int sequence(); // 시퀀스 등록
	
	void insert(AhzitUserInterestDto ahzitUserInterestDto); // 1:1 문의 등록
	
	boolean edit(AhzitUserInterestDto ahzitUserInterestDto); // 문의 수정
	
}
