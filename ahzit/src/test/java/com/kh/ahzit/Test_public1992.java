package com.kh.ahzit;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.kh.ahzit.entity.AhzitDto;
import com.kh.ahzit.entity.AhzitMemberDto;
import com.kh.ahzit.entity.ScheduleDto;
import com.kh.ahzit.repository.AhzitDao;
import com.kh.ahzit.repository.AhzitMemberDao;
import com.kh.ahzit.repository.AttachmentDao;
import com.kh.ahzit.repository.ScheduleDao;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
public class Test_public1992 {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private AhzitDao ahzitDao;
	
	@Autowired
	private AhzitMemberDao ahzitMemberDao;
	
	@Autowired
	private AttachmentDao attachmentDao;
	
	@Autowired
	private ScheduleDao scheduleDao;

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
	
//	AhzitMemberDto testDto=AhzitMemberDto.builder().memberAhzitNo(84).memberNick("쿼리테스트").build();
//	System.out.println(ahzitMemberDao.nicknameCheck(testDto));
//	
//	ahzitDao.updateAhzitHead2(166);
	//System.out.println(attachmentDao.selectAhzitMemberAttachment(231);
	
	@Test
	public void test() {
		List<ScheduleDto> testList=scheduleDao.scheduleListRownum(84);
		System.out.println(testList);
		
	}

}
