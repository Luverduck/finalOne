package com.kh.ahzit.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ahzit.entity.AhzitMemberDto;
import com.kh.ahzit.vo.AhzitMemberListVO;

@Repository
public class AhzitMemberDaoImpl implements AhzitMemberDao {
	
	@Autowired
	private SqlSession sqlSession;

	// 소모임회원 단일 조회 - ahzitNo, memberNo 필요
	@Override
	public AhzitMemberDto one(int ahzitNo, int memberNo) {
		Map<String, Object> param = new HashMap<>();
		param.put("ahzitNo", ahzitNo);
		param.put("memberNo", memberNo);
		return sqlSession.selectOne("ahzitMember.one",param);
	}

	// 소모임 회원 조회
	@Override
	public List<AhzitMemberListVO> select(int ahzitNo) {
		return sqlSession.selectList("ahzitMember.ahzitMemberList",ahzitNo);
	}
	
	//소모임 가입시 닉네임 중복검사
	@Override
	public boolean nicknameCheck(AhzitMemberDto ahzitMemberDto) {
		int count=sqlSession.selectOne("ahzitMember.nicknameCheck", ahzitMemberDto);
		return count==0;//count가 0이다=중복이 없다=true
	}

	//소모임 회원번호 시퀀스 넘버 발행
	@Override
	public int sequence() {
		return sqlSession.selectOne("ahzitMember.sequence");
	}
	
	@Override
	public boolean updateMember(AhzitMemberDto ahzitMemberDto) {
		int count=sqlSession.update("ahzitMember.updateMember", ahzitMemberDto);
		return count>0;
	}

	@Override
	public AhzitMemberDto findMember(int memberNo) {
		return sqlSession.selectOne("ahzitMember.findMember",memberNo);
	}


}
