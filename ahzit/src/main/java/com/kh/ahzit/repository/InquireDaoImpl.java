package com.kh.ahzit.repository;

import java.util.List;

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

	// 문의 상세
	@Override
	public InquireDto detail(int inquireNo) {
		return sqlSession.selectOne("inquire.detail", inquireNo);
	}

	// 문의 목록
	@Override
	public List<InquireDto> selectList(String inquireId) {
		return sqlSession.selectList("inquire.list", inquireId);
	}

	@Override
	public boolean edit(InquireDto inquireDto) {
		int count = sqlSession.update("inquire.edit", inquireDto);
		return count > 0;
	}

	@Override
	public boolean delete(int inquireNo) {
		int count = sqlSession.delete("inquire.delete", inquireNo);
		return count > 0;
	}


	

	
}
