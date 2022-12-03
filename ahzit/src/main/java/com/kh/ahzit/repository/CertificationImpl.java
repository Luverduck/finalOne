package com.kh.ahzit.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ahzit.entity.CertificationDto;

@Repository
public class CertificationImpl implements CertificationDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insert(CertificationDto certificationDto) {
		sqlSession.insert("certification.insert", certificationDto);
	}

	@Override
	public boolean check(CertificationDto certificationDto) {
		CertificationDto result = sqlSession.selectOne("certification.check", certificationDto);
		return result != null;
	}

	@Override
	public boolean delete(String certificationId) {
		int count = sqlSession.delete("certification.delete", certificationId);
		return count>0;
	}

	@Override
	public void clear() {
		sqlSession.delete("certification.clear");
	}	
	

}
