package com.kh.ahzit.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;

import com.kh.ahzit.entity.AhzitDto;
import com.kh.ahzit.entity.AhzitUserDto;
import com.kh.ahzit.entity.FaqDto;
import com.kh.ahzit.entity.InquireDto;
import com.kh.ahzit.entity.NoticeDto;
import com.kh.ahzit.vo.AdminAhzitListSearchVO;
import com.kh.ahzit.vo.AdminAhzitUserListSearchVO;
import com.kh.ahzit.vo.AdminInquireListSearchVO;
import com.kh.ahzit.vo.AhzitUserJoinCountVO;

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

		@Override
		public List<AhzitDto> ahzitSelectList(AdminAhzitListSearchVO adminAhzitListSearchVO) {
			if (adminAhzitListSearchVO.isSearch()) {
				return ahzitSearchList(adminAhzitListSearchVO);
			} else {
				return ahzitAllList(adminAhzitListSearchVO);
			}
		}

		@Override
		public List<AhzitDto> ahzitAllList(AdminAhzitListSearchVO adminAhzitListSearchVO) {
			Map<String, String> param = new HashMap<>();

			param.put("startRow", String.valueOf(adminAhzitListSearchVO.startRow()));
			param.put("endRow", String.valueOf(adminAhzitListSearchVO.endRow()));
			return sqlSession.selectList("admin.ahzitAllList", param);
		}

		@Override
		public List<AhzitDto> ahzitSearchList(AdminAhzitListSearchVO adminAhzitListSearchVO) {
			Map<String, String> param = new HashMap<>();
			
			param.put("type", adminAhzitListSearchVO.getType());
			param.put("keyword", adminAhzitListSearchVO.getKeyword());
			param.put("startRow", String.valueOf(adminAhzitListSearchVO.startRow()));
			param.put("endRow", String.valueOf(adminAhzitListSearchVO.endRow()));
			return sqlSession.selectList("admin.ahzitSearchList", param);
		}

		@Override
		public int ahzitCount(AdminAhzitListSearchVO adminAhzitListSearchVO) {
			if (adminAhzitListSearchVO.isSearch()) {
				return ahzitSearchCount(adminAhzitListSearchVO);
			} else {
				return ahzitListCount(adminAhzitListSearchVO);
			}
		}

		@Override
		public int ahzitSearchCount(AdminAhzitListSearchVO adminAhzitListSearchVO) {
			Map<String, String> param = new HashMap<>();
			
			param.put("type", adminAhzitListSearchVO.getType());
			param.put("keyword", adminAhzitListSearchVO.getKeyword());
			return sqlSession.selectOne("admin.ahzitSearchListCount", param);
		}

		@Override
		public int ahzitListCount(AdminAhzitListSearchVO adminAhzitListSearchVO) {
			return sqlSession.selectOne("admin.ahzitAllListCount", adminAhzitListSearchVO);
		}

		@Override
		public AhzitDto selectOne(int ahzitNo) {
			return sqlSession.selectOne("admin.one", ahzitNo);
		}

		@Override
		public List<InquireDto> inquireSelectList(AdminInquireListSearchVO adminInquireListSearchVO) {
			if (adminInquireListSearchVO.isSearch()) {
				return inquireSearchList(adminInquireListSearchVO);
			} else {
				return inquireAllList(adminInquireListSearchVO);
			}
		}

		@Override
		public List<InquireDto> inquireAllList(AdminInquireListSearchVO adminInquireListSearchVO) {
			Map<String, String> param = new HashMap<>();

			param.put("startRow", String.valueOf(adminInquireListSearchVO.startRow()));
			param.put("endRow", String.valueOf(adminInquireListSearchVO.endRow()));
			return sqlSession.selectList("admin.inquireAllList", param);
		}

		@Override
		public List<InquireDto> inquireSearchList(AdminInquireListSearchVO adminInquireListSearchVO) {
		Map<String, String> param = new HashMap<>();
			
			param.put("type", adminInquireListSearchVO.getType());
			param.put("keyword", adminInquireListSearchVO.getKeyword());
			param.put("startRow", String.valueOf(adminInquireListSearchVO.startRow()));
			param.put("endRow", String.valueOf(adminInquireListSearchVO.endRow()));
			return sqlSession.selectList("admin.inquireSearchList", param);
		}

		@Override
		public int inquireCount(AdminInquireListSearchVO adminInquireListSearchVO) {
			if (adminInquireListSearchVO.isSearch()) {
				return inquireSearchCount(adminInquireListSearchVO);
			} else {
				return inquireListCount(adminInquireListSearchVO);
			}
		}

		@Override
		public int inquireSearchCount(AdminInquireListSearchVO adminInquireListSearchVO) {
			Map<String, String> param = new HashMap<>();
			param.put("type", adminInquireListSearchVO.getType());
			param.put("keyword", adminInquireListSearchVO.getKeyword());
			return sqlSession.selectOne("admin.inquireSearchListCount", param);
		}

		@Override
		public int inquireListCount(AdminInquireListSearchVO adminInquireListSearchVO) {
			return sqlSession.selectOne("admin.inquireAllListCount", adminInquireListSearchVO);
		}
		
		// (차트)
		// 일자 별 회원 가입 수
		@Override
		public List<AhzitUserJoinCountVO> ahzitUserCountList() {
			return sqlSession.selectList("admin.ahzitUserCountList");
		}
		// 아지트 별 관심사 수 출력
		@Override
		public List<AhzitDto> ahzitSortCount() {
			return sqlSession.selectList("admin.ahzitSortCount");
		}
		// 회원수에 따른 아지트 나열 : 10개
		@Override
		public List<AhzitDto> ahzitHeadCount() {
			return sqlSession.selectList("admin.ahzitHeadCount");
		}

		@Override
		public List<NoticeDto> noticeListForMain() {
			return sqlSession.selectList("admin.noticeListForMain");
		}

		@Override
		public List<InquireDto> inquireListForMain() {
			return sqlSession.selectList("admin.inquireListForMain");
		}
	
}
