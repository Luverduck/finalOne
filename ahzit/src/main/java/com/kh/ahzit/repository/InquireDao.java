package com.kh.ahzit.repository;

import com.kh.ahzit.entity.InquireDto;

public interface InquireDao {

	public int sequence(); // 시퀀스 등록
	
	void insert(InquireDto inquireDto); // 1:1 문의 등록
}
