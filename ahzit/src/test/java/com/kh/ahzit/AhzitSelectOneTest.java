package com.kh.ahzit;

import org.apache.ibatis.session.SqlSession;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.kh.ahzit.entity.AhzitDto;

@SpringBootTest
public class AhzitSelectOneTest {
	
	@Autowired
	private SqlSession sqlSession;

	@Test
	public void test() {
		int ahzitNo = 23;
		AhzitDto dto = sqlSession.selectOne("ahzit.one", ahzitNo);
		System.out.println(dto);
	}

}
