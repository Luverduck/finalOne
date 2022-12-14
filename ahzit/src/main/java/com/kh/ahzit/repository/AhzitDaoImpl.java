package com.kh.ahzit.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ahzit.entity.AhzitAttachmentDto;
import com.kh.ahzit.entity.AhzitDto;
import com.kh.ahzit.entity.AhzitMemberDto;
import com.kh.ahzit.entity.AhzitUserDto;


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
		sqlSession.insert("ahzit.insert", ahzitDto);
		
	}
	
	//소모임 목록
	@Override
	public List<AhzitDto> selectList() {
		return sqlSession.selectList("ahzit.list");
	}

	//소모임 단일조회
	@Override
	public AhzitDto selectOne(int ahzitNo) {
		return sqlSession.selectOne("ahzit.one", ahzitNo);
	}	
	
	//아지트 수정 메소드
	@Override
	public boolean update(AhzitDto ahzitDto) {
		int count = sqlSession.update("ahzit.update", ahzitDto);
		return count > 0;
	}
	
	//소모임 삭제
  @Override
	public boolean delete(int ahzitNo) {
		int count=sqlSession.delete("ahzit.delete", ahzitNo);
		return count > 0;	

	}

	//아지트생성에 개설자 자동 추가
	@Override
	public void addMember(AhzitMemberDto ahzitMemberDto) {
		Map<String, String> param = new HashMap<>();	
		param.put("memberAhzitNo", String.valueOf(ahzitMemberDto.getMemberAhzitNo()));
		param.put("memberId", ahzitMemberDto.getMemberId());
		param.put("memberNick",ahzitMemberDto.getMemberNick());
		sqlSession.insert("ahzitLeader.insert", ahzitMemberDto);
		
	}
	
	@Override
	public AhzitUserDto selectOne(String userId) {
		return sqlSession.selectOne("ahzitLeader.one", userId);
	}
	
	//아지트가입하기 메소드
	@Override
	public void insertMember(AhzitMemberDto ahzitMemberDto) {
		sqlSession.insert("ahzitMember.insert", ahzitMemberDto);
		
	}

	//아지트 가입자 증가 메소드
	@Override
	public boolean updateAhzitPerson(int ahzitNo) {
		int count = sqlSession.update("ahzitMember.update", ahzitNo);
		return count > 0;
	}

	//ahzit_member 테이블에서 아지트 번호로 count한 결과값을 인원수에 반영
	@Override
	public boolean updateAhzitHead2(int ahzitNo) {
		int count=sqlSession.update("ahzitMember.updateAhzitHead2",ahzitNo);
		return count>0;
	}
	
	@Override//일반회원 아지트(소모임) 탈퇴용 메소드
	public boolean deleteCommonMember(int memberNo) {
		int count=sqlSession.delete("ahzitMember.deleteCommonMember",memberNo);
		return count>0;
	}


}
