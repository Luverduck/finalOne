package com.kh.ahzit;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.jdbc.core.JdbcTemplate;


@SpringBootTest
public class Test_seungrii {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	

	@Test
	public void test() {
		//번호 생성
		String sql = "select notice_seq.nextval from dual";
		int noticeNo = jdbcTemplate.queryForObject(sql, int.class);
		System.out.println("noticeNo" + noticeNo);
		
		//등록
		sql = "insert into notice("
				+ "notice_no, notice_writer, notice_title, "
				+ "notice_content, notice_writedate, notice_read) "
				+ "values(?, ?, ?, ?, sysdate, 0)";
		
		Object[] param = {
				noticeNo, "test1231", "제목", "내용"
		};
		jdbcTemplate.update(sql, param);

		
	}
}