package com.kh.ahzit.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.ahzit.entity.AhzitBoardDto;
import com.kh.ahzit.repository.AhzitBoardDao;

@Controller
@RequestMapping("/ahzit_board")
public class AhzitBoardController {

	// 의존성 주입
	@Autowired
	private AhzitBoardDao ahzitBoardDao;
	
	// 게시글 등록 Mapping
//	@GetMapping("/insert")
//	public String insertBoard(@ModelAttribute AhzitBoardDto ahzitBoardDto, HttpSession session) {
//		// HttpSession에서 로그인 중인 회원의 아이디 반환
//		String boardWriter = (String)session.getAttribute("memberNick");
//		// 반환한 회원 아이디를 입력받은 ahzitBoardDto의 작성자로 설정
//		ahzitBoardDto.setBoardWriter(boardWriter);
//	}
}
