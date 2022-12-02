package com.kh.ahzit.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ahzit.entity.AhzitDto;

@Repository
public class AhzitDaoImpl implements AhzitDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int sequence() {
		return sqlSession.selectOne("ahzit.ahzitSequence");
	}
	
	@Override
	public void insert(AhzitDto ahzitDto) {
		sqlSession.insert("ahzit.ahzitInsert",ahzitDto);
		
	}

	@Override
	public boolean update(AhzitDto ahzitDto) {
		int count = sqlSession.update("ahzit.ahzitUpdate", ahzitDto);
		return count > 0;
	}



}
