package com.kh.ahzit;

import org.apache.ibatis.session.SqlSession;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.kh.ahzit.entity.AhzitDto;
import com.kh.ahzit.repository.AhzitDao;


@SpringBootTest
public class AhzitInsertTest {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private AhzitDao ahzitDao;

	@Test
	public void test() {
		int test=ahzitDao.sequence();
		AhzitDto ahzitDto=AhzitDto.builder()
												.ahzitNo(test)
												.ahzitLeader("test123test")
												.ahzitSort("스터디")
												.ahzitName("테스트용아지트4")
												.ahzitInfo("테스트용아지트소개4")
												.ahzitHeadMax(50)
												.ahzitRegionHigh("서울특별시")
												.ahzitRegionLow("강남구")
												.ahzitIsPublic("Y")
												.build();
		sqlSession.insert("ahzit.ahzitInsert",ahzitDto);
	}


}
