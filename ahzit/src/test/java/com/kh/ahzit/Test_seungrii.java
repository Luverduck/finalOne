package com.kh.ahzit;

import org.apache.ibatis.session.SqlSession;


import java.sql.Date;

import org.apache.ibatis.session.SqlSession;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.kh.ahzit.entity.NoticeDto;


@SpringBootTest
public class Test_seungrii {

	@Autowired
	private SqlSession sqlSession;

	@Test
	public void test() {
		//assertNotNull(sqlSession);
		NoticeDto noticeDto = NoticeDto.builder()
						.noticeNo(62)
						.noticeTitle("바꾼제목")
						.noticeContent("바꾼내용")
						.noticeWriter("admin123")
					.build();
		sqlSession.insert("notice.insert", noticeDto);
	}
}
