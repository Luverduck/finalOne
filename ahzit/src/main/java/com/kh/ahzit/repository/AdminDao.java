package com.kh.ahzit.repository;

import java.util.List;

import com.kh.ahzit.entity.AhzitUserDto;
import com.kh.ahzit.vo.AdminAhzitUserListSearchVO;

public interface AdminDao {
	
	void insert(AhzitUserDto ahzitUserDto); // 관리자 생성
	 
	// 회원 전체 리스트, 조회 통합
	List<AhzitUserDto> selectList(AdminAhzitUserListSearchVO adminAhzitUserListSearchVO);
	List<AhzitUserDto> allList(AdminAhzitUserListSearchVO adminAhzitUserListSearchVO);
	List<AhzitUserDto> searchList(AdminAhzitUserListSearchVO adminAhzitUserListSearchVO);
	
	//회원 전체 리스트, 조회 카운트 숫자
	int count(AdminAhzitUserListSearchVO adminAhzitUserListSearchVO);
	int searchCount(AdminAhzitUserListSearchVO adminAhzitUserListSearchVO);
	int listCount(AdminAhzitUserListSearchVO adminAhzitUserListSearchVO);
 
	boolean change(AhzitUserDto ahzitUserDto);

	boolean change2(AhzitUserDto ahzitUserDto);
}
