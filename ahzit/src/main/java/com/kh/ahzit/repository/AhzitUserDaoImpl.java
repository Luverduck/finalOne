package com.kh.ahzit.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;

import com.kh.ahzit.entity.AhzitUserDto;

@Repository
public class AhzitUserDaoImpl implements AhzitUserDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private PasswordEncoder encoder;

		
	@Override
	public void join(AhzitUserDto ahzitUserDto) {
		String pw = ahzitUserDto.getUserPw(); // 사용자가 입력한 비밀번호 꺼내오고
		String enc = encoder.encode(pw); // 암호화 시키고
		ahzitUserDto.setUserPw(enc); // 암호화된 비밀번호으로 Dto 에 넣어서
		sqlSession.insert("ahzitUser.insert", ahzitUserDto); // 만들어둔 insert 문에 작성

	}
	
	@Override
	public boolean login(AhzitUserDto ahzitUserDto) {
		AhzitUserDto findDto = sqlSession.selectOne("ahzitUser.get", ahzitUserDto.getUserId());
		
	//	System.out.println("find : " + findDto.getUserPw());
	//	System.out.println("dto : " + ahzitUserDto.getUserPw());
		
		if(findDto == null) return false;
		boolean judge = encoder.matches(ahzitUserDto.getUserPw(), findDto.getUserPw()); // 원본 비밀번호 랑 찾은 비밀번호랑 비교
		return judge;
	}

	@Override
	public AhzitUserDto selectOne(String userId) {
	
		return null;
	}

}
