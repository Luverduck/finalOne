package com.kh.ahzit;

import org.apache.ibatis.session.SqlSession;


import java.sql.Date;

import org.apache.ibatis.session.SqlSession;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.jdbc.core.JdbcTemplate;

import com.kh.ahzit.entity.NoticeDto;
import com.kh.ahzit.repository.NoticeDao;


@SpringBootTest
public class Test_seungrii {

//	@Autowired
//	private SqlSession sqlSession;
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
//	@Autowired
//	private NoticeDao noticeDao;
	
	@Autowired
	private NoticeDto noticeDto;

	@Test
	public void test() {
		//번호 생성
		String sql = "select notice_seql.nextval from dual";
		int noticeNo = jdbcTemplate.queryForObject(sql, int.class);
		System.out.println("noticeNo" + noticeNo);
		
		//등록
		sql = "insert into notice("
				+ "notice_no, notice_writer, notice_title, "
				+ "notice_content, notice_writedate, notice_read) "
				+ "values(?, ?, ?, ?, sysdate, 0)";
		Object[] param = {
				noticeNo, noticeDto.getNoticeWriter(), noticeDto.getNoticeTitle(), 
				noticeDto.getNoticeContent()
		};
		jdbcTemplate.update(sql, param);
	}
}