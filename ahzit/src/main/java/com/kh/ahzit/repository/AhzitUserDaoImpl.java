package com.kh.ahzit.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ahzit.entity.AhzitUserDto;

@Repository
public class AhzitUserDaoImpl implements AhzitUserDao{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void join(AhzitUserDto ahzitUserDto) {
		sqlSession.insert("ahzitUser.insert", ahzitUserDto);
	}

	@Override
	public AhzitUserDto selectOne(String userId) {
		return sqlSession.selectOne("ahzitUser.get", userId);
	}
}
