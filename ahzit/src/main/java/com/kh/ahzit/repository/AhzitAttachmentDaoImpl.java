package com.kh.ahzit.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ahzit.entity.AhzitAttachmentDto;

@Repository
public class AhzitAttachmentDaoImpl implements AhzitAttachmentDao {

	@Autowired 
	private SqlSession sqlSession;

	@Override
	public void insert(AhzitAttachmentDto attachmentDto) {
	
		
	}
	
	
}
