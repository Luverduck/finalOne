package com.kh.ahzit;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.kh.ahzit.entity.NoticeDto;
import com.kh.ahzit.repository.NoticeDao;



@SpringBootTest
public class Test_seungrii {
	@Autowired
	private NoticeDao noticeDao;
	
	@Test
	public void before() {
		for(int i=1; i<=101; i++) {
			noticeDao.insert(NoticeDto.builder()
						.noticeTitle("테스트"+i)
						.noticeContent("테스트"+i)
						.noticeWriter("tester111")
					.build());
		}
	}
	
	@BeforeEach
	public void after() {
		noticeDao.clear();
	}
	
}