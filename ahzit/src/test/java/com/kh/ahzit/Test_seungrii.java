package com.kh.ahzit;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		Map<String, String> param = new HashMap<>();
		
		param.put("type", "notice_title");
		param.put("keyword", "1");
		
		List<NoticeDto> list = sqlSession.selectList("notice.search", param);
		
		for(NoticeDto noticeDto : list) {
			System.out.println(noticeDto);
		}
	}
}