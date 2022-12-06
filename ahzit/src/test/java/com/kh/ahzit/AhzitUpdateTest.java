package com.kh.ahzit;

import org.apache.ibatis.session.SqlSession;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.kh.ahzit.entity.AhzitDto;

@SpringBootTest
public class AhzitUpdateTest {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Test
	public void test() {//수정은 소모임명, 소개, 최대멤버수, 공개여부, 프로필사진
			int count = sqlSession.update("ahzit.ahzitUpdate", AhzitDto.builder()
					.ahzitName("테스트용아지트4") //소모임이름
					.ahzitInfo("테스트용아지트소개4") //소모임소개
					.ahzitHeadMax(10) //소모임최대인원
					.ahzitIsPublic("Y") //소모임 공개여부 
					.ahzitNo(23)
					.build());
			
			System.out.println("count = " + count);
		}

}
