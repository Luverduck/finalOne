package com.kh.ahzit.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ahzit.entity.AhzitUserInterestDto;

@Repository
public class AhzitUserInterestDaoImpl implements AhzitUserInterestDao{
	
	@Autowired
	private SqlSession sqlSession;

//	@Override
//	public int sequence() {
//		return sqlSession.selectOne("ahzituserinterest.sequence");
//		}

	@Override
	public void insert(AhzitUserInterestDto ahzitUserInterestDto) {
		 sqlSession.insert("ahzituserinterest.insert", ahzitUserInterestDto);
	}

	@Override
	public boolean edit(AhzitUserInterestDto ahzitUserInterestDto) {
		int count = sqlSession.update("ahzituserinterest.edit", ahzitUserInterestDto);
		return count > 0;
	}

	@Override
	public boolean delete(String userInterestId) {
		int count = sqlSession.delete("ahzituserinterest.delete", userInterestId);
		return count > 0;
	}

	

}
