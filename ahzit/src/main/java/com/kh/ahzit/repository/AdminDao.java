package com.kh.ahzit.repository;

import java.util.List;

import com.kh.ahzit.entity.AhzitDto;
import com.kh.ahzit.entity.AhzitUserDto;
import com.kh.ahzit.entity.FaqDto;
import com.kh.ahzit.entity.InquireDto;
import com.kh.ahzit.entity.NoticeDto;
import com.kh.ahzit.vo.AdminAhzitListSearchVO;
import com.kh.ahzit.vo.AdminAhzitUserListSearchVO;
import com.kh.ahzit.vo.AdminInquireListSearchVO;
import com.kh.ahzit.vo.AhzitUserJoinCountVO;

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
 
	// 관리자 등급 변경
	boolean change(AhzitUserDto ahzitUserDto);
	boolean change2(AhzitUserDto ahzitUserDto);
	
	// 아지트(소모임) 전체 리스트, 조회 통합
	List<AhzitDto> ahzitSelectList(AdminAhzitListSearchVO adminAhzitListSearchVO);
	List<AhzitDto> ahzitAllList(AdminAhzitListSearchVO adminAhzitListSearchVO);
	List<AhzitDto> ahzitSearchList(AdminAhzitListSearchVO adminAhzitListSearchVO);
	
	//아지트(소모임) 전체 리스트, 조회 카운트 숫자
	int ahzitCount(AdminAhzitListSearchVO adminAhzitListSearchVO);
	int ahzitSearchCount(AdminAhzitListSearchVO adminAhzitListSearchVO);
	int ahzitListCount(AdminAhzitListSearchVO adminAhzitListSearchVO);
	
	// 아지트 단일 조회
	AhzitDto selectOne(int ahzitNo);
	
	// 1:1 문의 전체 리스트, 조회 통합
	List<InquireDto> inquireSelectList(AdminInquireListSearchVO adminInquireListSearchVO);
	List<InquireDto> inquireAllList(AdminInquireListSearchVO adminInquireListSearchVO);
	List<InquireDto> inquireSearchList(AdminInquireListSearchVO adminInquireListSearchVO);
	
	//1:1 문의 전체 리스트, 조회 카운트 숫자
	int inquireCount(AdminInquireListSearchVO adminInquireListSearchVO);
	int inquireSearchCount(AdminInquireListSearchVO adminInquireListSearchVO);
	int inquireListCount(AdminInquireListSearchVO adminInquireListSearchVO);
	
	// (차트)
	// 일자 별 회원 가입 수
	List<AhzitUserJoinCountVO> ahzitUserCountList();
	// 관심사에 따른 아지트 수
	List<AhzitDto>ahzitSortCount();
	// 회원 수 순으로 아지트 정렬 - 10개
	List<AhzitDto>ahzitHeadCount();
	
	// 관리자 홈 화면에 출력할 공지사항, 1:1 문의
	List<NoticeDto> noticeListForMain( );
	List<InquireDto> inquireListForMain();
	
}
