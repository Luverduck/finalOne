package com.kh.ahzit.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;

import com.kh.ahzit.entity.AhzitUserDto;
import com.kh.ahzit.entity.FreeboardDto;

@Repository
public class AhzitUserDaoImpl implements AhzitUserDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private PasswordEncoder encoder;

	//회원 가입	
	@Override
	public void join(AhzitUserDto ahzitUserDto) {
		String pw = ahzitUserDto.getUserPw(); // 사용자가 입력한 비밀번호 꺼내오고
		String enc = encoder.encode(pw); // 암호화 시키고
		ahzitUserDto.setUserPw(enc); // 암호화된 비밀번호으로 Dto 에 넣어서
		sqlSession.insert("ahzitUser.insert", ahzitUserDto); // 만들어둔 insert 문에 작성

	}
	
	//로그인
	@Override
	public boolean login(AhzitUserDto ahzitUserDto) {
		AhzitUserDto findDto = sqlSession.selectOne("ahzitUser.get", ahzitUserDto.getUserId());
		
	//	System.out.println("find : " + findDto.getUserPw());
	//	System.out.println("dto : " + ahzitUserDto.getUserPw());
		
		if(findDto == null) return false;
		boolean judge = encoder.matches(ahzitUserDto.getUserPw(), findDto.getUserPw()); // 원본 비밀번호 랑 찾은 비밀번호랑 비교
		return judge;
	}

	// 회원 단일 조회
	@Override
	public AhzitUserDto selectOne(String userId) {
		return sqlSession.selectOne("ahzitUser.get", userId);
	}

	// 회원 정보 수정
	@Override
	public boolean update(AhzitUserDto ahzitUserDto) {
		return sqlSession.update("ahzitUser.edit", ahzitUserDto) > 0;
	}

	// 비밀번호 변경
	@Override
	public boolean changePw(AhzitUserDto ahzitUserDto) {
		return sqlSession.update("ahzitUser.changePw", ahzitUserDto) > 0;
	}

	// 회원 탈퇴
	@Override
	public boolean delete(String userId) {
		return sqlSession.delete("ahzitUser.delete", userId) >0;
	}

	// 로그인 시간 갱신
	@Override
	public boolean updateLoginTime(String userId) {
		return sqlSession.update("ahzitUser.loginTime", userId) > 0;
	}

	// 아이디 찾기
	@Override
	public List<Object> checkId(String userEmail) {
		return sqlSession.selectList("ahzitUser.checkId", userEmail);
	}
	
	// 비밀번호 찾기
	@Override
	public int checkPw(Map map) {
		return sqlSession.selectOne("ahzitUser.checkPw", map);
	}

	// 비밀번호 찾기 비밀번호 변경
	@Override
	public boolean checkPwSuccess(AhzitUserDto ahzitUserDto) {
		return sqlSession.update("ahzitUser.checkPwSuccess", ahzitUserDto) > 0;
	}
}
