package com.kh.ahzit.repository;

import java.util.List;

import com.kh.ahzit.entity.AhzitAttachmentDto;
import com.kh.ahzit.entity.AhzitDto;
import com.kh.ahzit.entity.AhzitMemberDto;

public interface AhzitDao {
	int sequence();//ahzit_no 시퀀스 번호 발행
	
	//이미지첨부 관련 메소드
	void ahzitAttachment(AhzitAttachmentDto ahzitAttachmentDto); //ahzit_attachment 테이블에 첨부파일 정보 연결
  
	void insert(AhzitDto ahzitDto);//아지트 생성
	
	void addMember(AhzitMemberDto ahzitMemberDto); //아지트생성에 개설자 자동 추가
	void insertMember(AhzitMemberDto ahzitMemberDto);//아지트가입하기 메소드
	
	public boolean updateAhzitPerson(int ahzitNo); //아지트 참가자 인원수 증가
	
	List<AhzitDto> selectList();//아지트 목록
	AhzitDto selectOne(int ahzitNo);//아지트 단일조회
	public int ahzitEdit(AhzitDto ahzitDto);//아지트 수정
	boolean delete(AhzitDto ahzitDto);//아지트 삭제

}
