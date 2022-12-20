package com.kh.ahzit.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;

import com.kh.ahzit.entity.AhzitUserDto;
import com.kh.ahzit.vo.AdminAhzitUserListSearchVO;

@Repository
public class AdminDaoImpl implements AdminDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private PasswordEncoder encoder;

		@Override
		public void insert(AhzitUserDto ahzitUserDto) {
			String pw = ahzitUserDto.getUserPw(); 
			String enc = encoder.encode(pw);
			ahzitUserDto.setUserPw(enc); 
			sqlSession.insert("admin.insert", ahzitUserDto);
		}

		// 등급 변경
		@Override
		public boolean change(AhzitUserDto ahzitUserDto) {
			int count = sqlSession.update("admin.change", ahzitUserDto);
			return count > 0;
		}

		// 변경 후 자동 등급 업데이트
		@Override
		public boolean change2(AhzitUserDto ahzitUserDto) {
			int count1 = sqlSession.update("admin.changeGrade", ahzitUserDto);
			return count1 > 0;
		}

		@Override
		public List<AhzitUserDto> selectList(AdminAhzitUserListSearchVO adminAhzitUserListSearchVO) {
			if (adminAhzitUserListSearchVO.isSearch()) {
				return searchList(adminAhzitUserListSearchVO);
			} else {
				return allList(adminAhzitUserListSearchVO);
			}
		}

		@Override
		public List<AhzitUserDto> allList(AdminAhzitUserListSearchVO adminAhzitUserListSearchVO) {
			Map<String, String> param = new HashMap<>();

			param.put("startRow", String.valueOf(adminAhzitUserListSearchVO.startRow()));
			param.put("endRow", String.valueOf(adminAhzitUserListSearchVO.endRow()));
			return sqlSession.selectList("admin.allList", param);
		}

		@Override
		public List<AhzitUserDto> searchList(AdminAhzitUserListSearchVO adminAhzitUserListSearchVO) {
			Map<String, String> param = new HashMap<>();

			param.put("type", adminAhzitUserListSearchVO.getType());
			param.put("keyword", adminAhzitUserListSearchVO.getKeyword());
			param.put("startRow", String.valueOf(adminAhzitUserListSearchVO.startRow()));
			param.put("endRow", String.valueOf(adminAhzitUserListSearchVO.endRow()));
			return sqlSession.selectList("admin.searchList", param);
		}

		@Override
		public int count(AdminAhzitUserListSearchVO adminAhzitUserListSearchVO) {
			if (adminAhzitUserListSearchVO.isSearch()) {
				return searchCount(adminAhzitUserListSearchVO);
			} else {
				return listCount(adminAhzitUserListSearchVO);
			}
		}

		@Override
		public int searchCount(AdminAhzitUserListSearchVO adminAhzitUserListSearchVO) {
			Map<String, String> param = new HashMap<>();

			param.put("type", adminAhzitUserListSearchVO.getType());
			param.put("keyword", adminAhzitUserListSearchVO.getKeyword());
			return sqlSession.selectOne("admin.searchListCount", param);
		}

		@Override
		public int listCount(AdminAhzitUserListSearchVO adminAhzitUserListSearchVO) {
			return sqlSession.selectOne("admin.allListCount", adminAhzitUserListSearchVO);
		}

		
		

	
}
