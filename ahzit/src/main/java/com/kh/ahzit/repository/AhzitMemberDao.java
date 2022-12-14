package com.kh.ahzit.repository;

import java.util.List;

import com.kh.ahzit.entity.AhzitMemberDto;
import com.kh.ahzit.vo.AhzitMemberListVO;

public interface AhzitMemberDao {
	
	AhzitMemberDto one(int ahzitNo, int memberNo); //소모임 회원 단일조회
	List<AhzitMemberListVO> select(int ahzitNo); //소모임 회원 조회
	boolean nicknameCheck(AhzitMemberDto ahzitMemberDto);//특정 소모임 가입시 닉네임 중복검사
	
	int sequence();//소모임 회원번호(ahzit_member 테이블의 member_no) 시퀀스 발행
	boolean updateMember(AhzitMemberDto ahzitMemberDto);//소모임에서 사용하는 닉네임 수정
	AhzitMemberDto findMember(int memberNo);//소모임 회원번호로 단일 조회
}
