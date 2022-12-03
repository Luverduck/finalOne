package com.kh.ahzit;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.List;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.kh.ahzit.entity.NoticeDto;
import com.kh.ahzit.repository.NoticeDao;

import lombok.extern.slf4j.Slf4j;

@SpringBootTest
public class Test_seungrii {

	@Autowired
	private NoticeDao noticeDao;
	
	@BeforeEach
	public void before() {
		for(int i=1; i<=5; i++) {
			noticeDao.insert(NoticeDto.builder()
						.noticeTitle("테스트"+i)
						.noticeContent("테스트"+i)
						.noticeWriter("admin123")				
					.build());
		}
	}
	
	@Test
	public void test() {
		//조회
		List<NoticeDto> list = noticeDao.selectList();
		
		for(NoticeDto noticeDto : list) {
			System.out.println(noticeDto);
		}
		assertEquals(list.size(), 5);
	}
	
//	 @AfterEach
//	 public void after() {
//	 	noticeDao.clear();
//	 }
}
