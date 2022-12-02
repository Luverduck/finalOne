package com.kh.ahzit;

import org.apache.ibatis.session.SqlSession;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.kh.ahzit.entity.AhzitDto;

@SpringBootTest
public class Test_soo231 {

	@Autowired
	private SqlSession sqlSession;

	@Test
	public void test() { //수정은 소모임명, 소개, 최대멤버수, 공개여부, 프로필사진
		sqlSession.update("ahzit.ahzitUpdate", AhzitDto.builder()
				.ahzitName("아지트이름수정테스트") //소모임이름
				.ahzitInfo("소모임소개수정테스트") //소모임소개
				.ahzitHeadMax(100) //소모임최대인원
				.ahzitIsPublic("Y") //소모임 공개여부 			
				.ahzitNo(23)
				.build());
	}
}
