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

	@Override
	public void insert(FaqDto faqDto) {
		sqlSession.insert("faq.insert", faqDto);
	}

	@Override
	public List<FaqDto> selectList() {
		return sqlSession.selectList("faq.list");
	}

	@Override
	public List<FaqDto> selectList(FaqListSearchVO vo) {
		Map<String, String> param = new HashMap<>();
		param.put("type", vo.getType());
		param.put("keyword", vo.getKeyword());
		return sqlSession.selectList("faq.search", param);

	}

	@Override
	public void clear() {
		String sql = "delete faq";
		jdbcTemplate.update(sql);
	}

	@Override
	public FaqDto selectOne(int faqNo) {
		return sqlSession.selectOne("faq.one", faqNo);
	}

	@Override
	public boolean edit(FaqDto faqDto) {
		int count = sqlSession.update("faq.edit", faqDto);
		return count > 0;
	}

	@Override
	public boolean delete(int faqNo) {
		int count = sqlSession.delete("faq.delete", faqNo);
		return count > 0;
	}
}
