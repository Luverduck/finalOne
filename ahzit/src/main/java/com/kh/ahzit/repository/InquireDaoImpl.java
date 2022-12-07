package com.kh.ahzit.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ahzit.entity.InquireDto;

@Repository
public class InquireDaoImpl implements InquireDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int sequence() {
		return sqlSession.selectOne("inquire.sequence");
	}

	// 문의 등록
	@Override
	public void insert(InquireDto inquireDto) {
	 sqlSession.insert("inquire.insert", inquireDto);
	}


	
}
