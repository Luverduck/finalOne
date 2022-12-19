package com.kh.ahzit.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ahzit.entity.FaqDto;
import com.kh.ahzit.vo.FaqListSearchVO;

@Repository
public class FaqDaoImpl implements FaqDao {

	@Autowired
	private SqlSession sqlSession;

	@Autowired
	private JdbcTemplate jdbcTemplate;

	// 등록
	@Override
	public void insert(FaqDto faqDto) {
		sqlSession.insert("faq.insert", faqDto);
	}

	@Override
	public int insert2(FaqDto faqDto) {
		// 번호 생성
		String sql = "select faq_seq.nextval from dual";
		int faqNo = jdbcTemplate.queryForObject(sql, int.class);

		// 등록
		sql = "insert into faq(" 
				+ "faq_no, faq_writer, faq_title, faq_content) " 
				+ "values(?, ?, ?, ?)";

		Object[] param = { 
				faqNo, faqDto.getFaqWriter(),
				faqDto.getFaqTitle(), faqDto.getFaqContent() };
		jdbcTemplate.update(sql, param);
		return faqNo;

	}

	//목록+검색
	@Override
	public List<FaqDto> selectList() {
		return sqlSession.selectList("faq.list");
	}

	@Override
	public List<FaqDto> selectList(FaqListSearchVO vo) {
		if (vo.isSearch()) {
			return search(vo);
		} else {
			return list(vo);
		}
	}
	 @Override
	public List<FaqDto> list(FaqListSearchVO vo) {
		Map<String, String> param = new HashMap<>();

		param.put("startRow", String.valueOf(vo.startRow()));
		param.put("endRow", String.valueOf(vo.endRow()));

		return sqlSession.selectList("faq.pagelist", param);

	}
	@Override
	public List<FaqDto> search(FaqListSearchVO vo) {
		Map<String, String> param = new HashMap<>();

		param.put("type", vo.getType());
		param.put("keyword", vo.getKeyword());
		param.put("startRow", String.valueOf(vo.startRow()));
		param.put("endRow", String.valueOf(vo.endRow()));

		return sqlSession.selectList("faq.pageSearch", param);
	}

	// 검색과 목록의 총 데이터 개수를 구하는 메소드
	@Override
	public int count(FaqListSearchVO vo) {
		if (vo.isSearch()) {
			return searchCount(vo);
		} else {
			return listCount(vo);
		}
	}
	@Override
	public int listCount(FaqListSearchVO vo) {
		return sqlSession.selectOne("faq.pageListCount", vo);
	}
	@Override
	public int searchCount(FaqListSearchVO vo) {
		Map<String, String> param = new HashMap<>();

		param.put("type", vo.getType());
		param.put("keyword", vo.getKeyword());

		return sqlSession.selectOne("faq.pageSearchCount", param);
	}
	
	//상세
	@Override
	public FaqDto selectOne(int faqNo) {
		return sqlSession.selectOne("faq.one", faqNo);
	}

	//수정
	@Override
	public boolean edit(FaqDto faqDto) {
		int count = sqlSession.update("faq.edit", faqDto);
		return count > 0;
	}

	//삭제
	@Override
	public boolean delete(int faqNo) {
		int count = sqlSession.delete("faq.delete", faqNo);
		return count > 0;
	}

	@Override
	public void clear() {
		String sql = "delete faq";
		jdbcTemplate.update(sql);
	}
}
