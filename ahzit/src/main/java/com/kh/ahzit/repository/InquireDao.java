package com.kh.ahzit.repository;

import java.util.List;

import com.kh.ahzit.entity.InquireDto;

public interface InquireDao {

	public int sequence(); // 시퀀스 등록
	
	void insert(InquireDto inquireDto); // 1:1 문의 등록
	
	public InquireDto detail(int inquireNo); // 문의 상세보기
	
	List<InquireDto> selectList(String inquireId); // 문의 리스트
	
	
}
