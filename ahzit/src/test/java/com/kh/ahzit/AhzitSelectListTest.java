package com.kh.ahzit;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.kh.ahzit.entity.AhzitDto;

@SpringBootTest
public class AhzitSelectListTest {

	@Autowired
	private SqlSession sqlSession;

	@Test
	public void test() {
		List<AhzitDto> list = sqlSession.selectList("ahzit.list");
		System.out.println(list.size());
		for(AhzitDto dto : list) {
			System.out.println(dto);
		}
	}

}
