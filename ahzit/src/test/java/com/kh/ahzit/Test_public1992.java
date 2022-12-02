package com.kh.ahzit;

import org.apache.ibatis.session.SqlSession;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.kh.ahzit.entity.AhzitDto;
import com.kh.ahzit.repository.AhzitDao;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
public class Test_public1992 {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private AhzitDao ahzitDao;

	@Test
	public void test() {
		int test=ahzitDao.sequence();
		AhzitDto ahzitDto=AhzitDto.builder()
												.ahzitNo(test)
												.ahzitLeader("tester111")
												.ahzitSort("취미")
												.ahzitName("테스트아지트생성메소드")
												.ahzitInfo("인원제한칼럼추가")
												.ahzitRegionHigh("서울시")
												.ahzitRegionLow("낙원구")
												.ahzitIsPublic("Y")
												.build();
		sqlSession.insert("ahzit.ahzitInsert",ahzitDto);
	}

}
