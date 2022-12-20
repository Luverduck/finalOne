package com.kh.ahzit.repository;

import java.util.List;

import com.kh.ahzit.entity.AhzitDto;
import com.kh.ahzit.entity.AhzitMemberDto;
import com.kh.ahzit.entity.AhzitUserDto;
import com.kh.ahzit.vo.AhzitMemberInfoRequestVO;
import com.kh.ahzit.vo.AhzitMemberInfoVO;
import com.kh.ahzit.vo.AhzitSearchListRequestVO;
import com.kh.ahzit.vo.AhzitSearchListResponseVO;

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
	
	public boolean updateAhzitHead2(int ahzitNo);//현재 아지트 회원 수를 세어서 참가자 인원수에 반영
	
	boolean deleteCommonMember(int memberNo);//일반회원-아지트(소모임)탈퇴 메소드
	
	void insertMember2(AhzitMemberDto ahzitMemberDto);//아지트가입하기 메소드 2 (member_no 미리 발행하는 버전)

	// 추상 메소드 - 홈 화면 검색창 검색 : 통합 검색
	List<AhzitSearchListRequestVO> selectAhzit(AhzitSearchListRequestVO ahzitSearchListRequestVO);
	
	// 추상 메소드 - 홈 화면 검색창 검색 : 전체 조회(검색어가 없는 경우)
	List<AhzitSearchListRequestVO> allAhzit(AhzitSearchListRequestVO ahzitSearchListRequestVO);
	
	// 추상 메소드 - 홈 화면 검색창 검색 : 검색 조회(검색어가 있는 경우)
	List<AhzitSearchListRequestVO> searchAhzit(AhzitSearchListRequestVO ahzitSearchListRequestVO);
	
	// 추상 메소드 - 내가 가입한 소모임인지 조회
	public int alreadyJoin(String userId, int ahzitNo);

	// 추상 메소드 - 소모임 내 회원 통합 조회
	public List<AhzitMemberInfoVO> selectMemberInfo(AhzitMemberInfoRequestVO ahzitMemberInfoRequestVO);
	
	// 추상 메소드 - 소모임 내 회원 전체 조회
	public List<AhzitMemberInfoVO> allMemberInfo(AhzitMemberInfoRequestVO ahzitMemberInfoRequestVO);
	
	// 추상 메소드 - 소모임 내 회원 검색 조회
	public List<AhzitMemberInfoVO> searchMemberInfo(AhzitMemberInfoRequestVO ahzitMemberInfoRequestVO);
	
	// 추상 메소드 - 소모임 내 회원수 조회
	public int selectMemberCount(AhzitMemberInfoRequestVO ahzitMemberInfoRequestVO);
	
	// 추상 메소드 - 소모임 내 전체 회원수
	public int allMemberCount(int ahzitNo);
	
	// 추상 메소드 - 소모임 내 회원 검색시 회원수
	public int searchMemberCount(int ahzitNo, String keyword);

	// 추상 메소드 - 찾기 페이지에서 소모임 조회
	List<AhzitSearchListRequestVO> selectSortAhzit(AhzitSearchListRequestVO ahzitSearchListRequestVO);
	
	// 추상 메소드 - 찾기 페이지에서 전체 소모임 조회
	List<AhzitSearchListRequestVO> allSortAhzit(AhzitSearchListRequestVO ahzitSearchListRequestVO);
	
	// 추상 메소드 - 찾기 페이지에서 특정 카테고리 소모임 조회
	List<AhzitSearchListRequestVO> searchSortAhzit(AhzitSearchListRequestVO ahzitSearchListRequestVO);
		
	// 추상 메소드 - 찾기 페이지에서 소모임 갯수
	public int countselectAhzit(AhzitSearchListRequestVO ahzitSearchListRequestVO);
	
	// 추상 메소드 - 찾기 페이지에서 전체 소모임 갯수
	public int countAllAhzit(AhzitSearchListRequestVO ahzitSearchListRequestVO);
	
	// 추상 메소드 - 찾기 페이지에서 특정 카테고리 소모임 갯수
	public int coutntSelectAhzit(AhzitSearchListRequestVO ahzitSearchListRequestVO); 


}
