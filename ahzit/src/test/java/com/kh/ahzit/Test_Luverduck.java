package com.kh.ahzit;

import org.apache.ibatis.session.SqlSession;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.kh.ahzit.entity.AhzitBoardDto;
import com.kh.ahzit.repository.AhzitBoardDao;
import com.kh.ahzit.repository.FreeboardDao;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
public class Test_Luverduck {

	// 의존성 주입
	@Autowired
	private SqlSession sqlSession;
	
	// 의존성 주입
	@Autowired
	private FreeboardDao freeboardDao;
	
	
	// 의존성 주입
	@Autowired
	private AhzitBoardDao ahzitBoardDao;
	
	// 소모임 내 게시글 등록
	@Test
	public void test() {
		for(int i = 0 ; i < 10 ; i ++) {
			ahzitBoardDao.insertBoard(AhzitBoardDto.builder()
					.boardWriterNo(23)
					.boardAhzitNo(84)
					.boardContent("테스트 내용 " + i)
					.build());
		}
	}
	
	
//	게시글 등록	
//	@Test
//	public void test() {
//		for(int i = 0 ; i < 100 ; i ++) {
//			int freeboardNo = freeboardDao.nextFreeboardNo();
//			sqlSession.insert("freeboard.insert", FreeboardDto.builder()
//					.freeboardNo(freeboardNo)
//					.freeboardWriter("test1231")
//					.freeboardTitle("테스트입니다 " + i)
//					.freeboardContent("테스트입니다 " + i)
//					.build());
//		}
//	}
}
