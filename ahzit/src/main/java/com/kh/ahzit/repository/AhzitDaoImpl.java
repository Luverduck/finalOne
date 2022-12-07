package com.kh.ahzit.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ahzit.entity.AhzitAttachmentDto;
import com.kh.ahzit.entity.AhzitDto;

@Repository
public class AhzitDaoImpl implements AhzitDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	//소모임 시퀀스번호
	@Override
	public int sequence() {
		return sqlSession.selectOne("ahzit.sequence");
	}
	
	//소모임 등록
	@Override
	public void insert(AhzitDto ahzitDto) {
		sqlSession.insert("ahzit.insert",ahzitDto);
		
	}
	
	//소모임 목록
	@Override
	public List<AhzitDto> selectList() {
		return sqlSession.selectList("ahzit.list");
	}

	//소모임 수정
	@Override
	public int ahzitEdit(AhzitDto ahzitDto) {
		// sql에서 소모임장 여부도 같이 판단
		return sqlSession.update("ahzit.edit",ahzitDto);
	}
	
	//소모임 단일조회
	@Override
	public AhzitDto selectOne(int ahzitNo) {
		return sqlSession.selectOne("ahzit.one", ahzitNo);
	}	
	
	//소모임 삭제
  @Override
	public boolean delete(AhzitDto ahzitDto) {
		int count=sqlSession.delete("ahzit.delete", ahzitDto);
		return count>0;	

	}

	//소모임 프로필 첨부파일
	@Override
	public void ahzitAttachment(AhzitAttachmentDto ahzitAttachmentDto) {
		sqlSession.insert("attachment.insert", ahzitAttachmentDto);
	}


}
