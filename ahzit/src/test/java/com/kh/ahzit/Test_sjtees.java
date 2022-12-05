package com.kh.ahzit;

import org.apache.ibatis.session.SqlSession;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.kh.ahzit.entity.AhzitUserDto;
import com.kh.ahzit.repository.AhzitUserDao;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
public class Test_sjtees {

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private AhzitUserDao ahzitUserDao;

	@Test
	public void test() {
		//assertNotNull(sqlSession);
		AhzitUserDto ahzitUserDto = AhzitUserDto.builder()
								.userId("test123123")
								.userPw("test123123")
								.userNick("테스트")
								.userEmail("test123123@naver.com")
							.build();
				sqlSession.insert("ahzitUser.insert", ahzitUserDto);
			}
	}

