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
		sqlSession.insert("ahzit.insert", AhzitDto.builder()
												.ahzitNo(test)
												.ahzitLeader("test1231")
												.ahzitSort("스터디")
												.ahzitName("테스트용아지트")
												.ahzitInfo("테스트용아지트소개")
												.ahzitRegionHigh("인천광역시")
												.ahzitRegionLow("부평구")
												.ahzitIsPublic("Y")
											.build());
	}

}
