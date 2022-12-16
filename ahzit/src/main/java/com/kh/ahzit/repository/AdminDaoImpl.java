package com.kh.ahzit.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;

import com.kh.ahzit.entity.AhzitUserDto;

@Repository
public class AdminDaoImpl implements AdminDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private PasswordEncoder encoder;

	
	// 회원 전체 조회
		@Override
		public List<AhzitUserDto> selectList() {
			return sqlSession.selectList("admin.list");
		}

		@Override
		public void insert(AhzitUserDto ahzitUserDto) {
			
			String pw = ahzitUserDto.getUserPw(); // 사용자가 입력한 비밀번호 꺼내오고
			String enc = encoder.encode(pw); // 암호화 시키고
			ahzitUserDto.setUserPw(enc); // 암호화된 비밀번호으로 Dto 에 넣어서
			sqlSession.insert("admin.insert", ahzitUserDto); // 만들어둔 insert 문에 작성
		}

		// 등급 변경
		@Override
		public boolean change(AhzitUserDto ahzitUserDto) {
			// TODO Auto-generated method stub
			return false;
		}

		// 변경 후 자동 등급 업데이트
		@Override
		public boolean change2(AhzitUserDto ahzitUserDto) {
			// TODO Auto-generated method stub
			return false;
		}
		
		
		

	
}
