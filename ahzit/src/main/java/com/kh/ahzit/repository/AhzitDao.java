package com.kh.ahzit.repository;

import java.util.List;

import com.kh.ahzit.entity.AhzitDto;

public interface AhzitDao {
	int sequence();//ahzit_no 시퀀스 번호 발행
	void insert(AhzitDto ahzitDto);//아지트 생성
	List<AhzitDto> selectList();//아지트 목록
	AhzitDto selectOne(int ahzitNo);//아지트 단일조회
	boolean update(AhzitDto ahzitDto);//아지트 수정
	
}
