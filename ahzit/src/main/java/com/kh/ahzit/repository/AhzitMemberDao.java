package com.kh.ahzit.repository;

import java.util.List;

import com.kh.ahzit.entity.AhzitMemberDto;
import com.kh.ahzit.vo.AhzitMemberListVO;

public interface AhzitMemberDao {
	
	AhzitMemberDto one(int ahzitNo, int memberNo); //소모임 회원 단일조회
	List<AhzitMemberListVO> select(int ahzitNo); //소모임 회원 조회

}
