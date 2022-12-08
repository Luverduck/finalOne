package com.kh.ahzit.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ahzit.entity.InquireDto;
import com.kh.ahzit.vo.InquireListSearchVO;

@Repository
public class InquireDaoImpl implements InquireDao {

	@Autowired
	private SqlSession sqlSession;
	
	// 시퀀스 등록
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
//	@Override
//	public List<InquireDto> selectList(String inquireId) {
//		return sqlSession.selectList("inquire.list", inquireId);
//	}
	
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

	@Override
	public List<InquireDto> selectList(InquireListSearchVO inquireListSearchVO) {
		// 검색 조회인지 판정
		boolean isSearch = inquireListSearchVO.isSearch();
		if(isSearch) { // 검색 조회일 경우
			return selectSearch(inquireListSearchVO);
		}
		else { // 검색 조회가 아닐 경우(전체 조회일 경우)
			return selectAll(inquireListSearchVO);
		}
	}

	@Override
	public List<InquireDto> selectSearch(InquireListSearchVO inquireListSearchVO) {
		// map 생성
		Map<String, String> param = new HashMap<>();
		param.put("inquireId", inquireListSearchVO.getInquireId());
		param.put("type", inquireListSearchVO.getType());
		param.put("keyword", inquireListSearchVO.getKeyword());
		param.put("startRow", String.valueOf(inquireListSearchVO.startRow()));
		param.put("endRow", String.valueOf(inquireListSearchVO.endRow()));
		return sqlSession.selectList("inquire.searchList", param);
	}

	@Override
	public List<InquireDto> selectAll(InquireListSearchVO inquireListSearchVO) {
		Map<String, String> param = new HashMap<>();
		param.put("inquireId", inquireListSearchVO.getInquireId());
		param.put("startRow", String.valueOf(inquireListSearchVO.startRow()));
		param.put("endRow", String.valueOf(inquireListSearchVO.endRow()));

		return sqlSession.selectList("inquire.allList", param);
		}

	@Override
	public int countInquire(InquireListSearchVO inquireListSearchVO) {
		if(inquireListSearchVO.isSearch()) { // 검색 조회라면
			return searchCountInquire(inquireListSearchVO);
		}
		else { // 전체 조회라면
			return listCountInquire(inquireListSearchVO);
		}
	}

	@Override
	public int searchCountInquire(InquireListSearchVO inquireListSearchVO) {
				Map<String, String> param = new HashMap<>();
				param.put("inquireId", inquireListSearchVO.getInquireId());
				param.put("type", inquireListSearchVO.getType());
				param.put("keyword", inquireListSearchVO.getKeyword());
				return sqlSession.selectOne("inquire.searchCount", param);
			}

	@Override
	public int listCountInquire(InquireListSearchVO inquireListSearchVO) {
		return sqlSession.selectOne("inquire.allCount", inquireListSearchVO);
	}


	

	
}
