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
		int count=sqlSession.selectOne("ahzitMember.nicknameCheck");
		return count==0;
	}



}
