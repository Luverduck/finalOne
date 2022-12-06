package com.kh.ahzit.repository;

import java.util.List;
import java.util.Map;

import com.kh.ahzit.entity.AhzitUserDto;

public interface AhzitUserDao {

	void join(AhzitUserDto ahzitUserDto); // 회원 가입

	AhzitUserDto selectOne(String userId); // 회원 단일 조회

	boolean login(AhzitUserDto ahzitUserDto); // 로그인

	boolean update(AhzitUserDto ahzitUserDto); // 회원 정보 수정

	boolean changePw(String userId, String userPw); //비밀번호 변경

	boolean delete(String userId); // 회원 탈퇴

	boolean updateLoginTime(String userId); // 로그인 시간 갱신 입력
 
	List<Object> checkId(String userEmail); // 아이디 찾기
	
	int checkPw(Map map); // 비밀번호 찾기

	boolean chkPwSuccess(AhzitUserDto ahzitUserDto); // 비밀번호 변경
	
	
}
