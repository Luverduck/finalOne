package com.kh.ahzit.repository;

import com.kh.ahzit.entity.AhzitDto;

public interface AhzitDao {
	int sequence();//ahzit_no 시퀀스 번호 발행
	void insert(AhzitDto ahzitDto);//아지트 생성
	boolean delete(AhzitDto ahzitDto);//아지트 삭제
}
