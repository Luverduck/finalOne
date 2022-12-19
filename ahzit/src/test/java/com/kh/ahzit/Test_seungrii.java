package com.kh.ahzit;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.List;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.kh.ahzit.entity.FaqDto;
import com.kh.ahzit.repository.FaqDao;

@SpringBootTest
public class Test_seungrii {

	@Autowired
	private FaqDao faqDao;

	@Test
	public void test() {
		List<FaqDto> list = faqDao.selectList();

		for (FaqDto faqDto : list) {
			System.out.println(faqDto);
		}
		assertEquals(list.size(), 10);
	}
	
//	@AfterEach
//	public void after() {
//		faqDao.clear();
//	}
}