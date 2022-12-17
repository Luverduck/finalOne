package com.kh.ahzit;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.kh.ahzit.vo.MyAhzitVO;

@SpringBootTest
public class AhzitSelectListTest {

	@Autowired
	private SqlSession sqlSession;

	@Test
	public void test() {
		List<MyAhzitVO> list = sqlSession.selectList("ahzitUser.myAhzitTopN");
		System.out.println(list.size());
		for(MyAhzitVO dto : list) {
			System.out.println(dto);
		}
	}

}
