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

	//삭제
	//ahzitDao.delete(AhzitDto.builder().ahzitNo(4).ahzitLeader("tester111").build());
	
	//아지트생성
//	int test=ahzitDao.sequence();
//	sqlSession.insert("ahzit.insert", AhzitDto.builder()
//												.ahzitNo(test)
//												.ahzitLeader("tester222")
//												.ahzitSort("스터디")
//												.ahzitName("더이상미룰수없다우리들의취업")
//												.ahzitInfo("부끄러움이 많은 인생이었습니다")
//												.ahzitRegionHigh("황해도")
//												.ahzitRegionLow("탄광촌")
//												.ahzitIsPublic("Y")
//												.build());
	
//	@Test
//	public void test() {
//		System.out.println(ahzitDao.delete(AhzitDto.builder().ahzitNo(4).ahzitLeader("tester111").build()));
//		
//	}

}
