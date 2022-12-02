package com.kh.ahzit;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.kh.ahzit.repository.AhzitDao;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
public class Test_public1992 {
	
	@Autowired
	private AhzitDao ahzitDao;

	@Test
	public void test() {
		int test=ahzitDao.sequence();
		System.out.println(test);
	}

}
