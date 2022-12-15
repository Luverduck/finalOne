package com.kh.ahzit.repository;

import java.util.List;

import com.kh.ahzit.entity.AhzitDto;
import com.kh.ahzit.entity.AhzitMemberDto;
import com.kh.ahzit.entity.AhzitUserDto;

public interface AhzitDao {
	int sequence();//ahzit_no 시퀀스 번호 발행
	
	void insert(AhzitDto ahzitDto);//아지트 생성
	
	void addMember(AhzitMemberDto ahzitMemberDto); //아지트생성에 개설자 자동 추가
	AhzitUserDto selectOne(String userId); //회원정보에서 단일조회  메소드
	
	void insertMember(AhzitMemberDto ahzitMemberDto);//아지트가입하기 메소드
	
	public boolean updateAhzitPerson(int ahzitNo); //아지트 참가자 인원수 증가
	
	List<AhzitDto> selectList();//아지트 목록
	AhzitDto selectOne(int ahzitNo);//아지트 단일조회

	boolean update(AhzitDto ahzitDto);//아지트 정보 수정

	boolean delete(int ahzitNo); //아지트 삭제

}
