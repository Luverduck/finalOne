package com.kh.ahzit.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ahzit.entity.FreeboardDto;
import com.kh.ahzit.repository.FreeboardDao;

@Controller
@RequestMapping("/freeboard")
public class FreeboardController {

	// 의존성 주입
	@Autowired
	private FreeboardDao freeboardDao;
	
	// 게시글 등록 페이지 Mapping
	@GetMapping("/write")
	public String writeFreeboard() {
		// 게시글 작성 페이지(write.jsp)로 연결
		return "freeboard/write";
	}
	
	// 게시글 등록 DB처리 Mapping
	@PostMapping("/write")
	public String writeFreeboard(HttpSession session, FreeboardDto freeboardDto, RedirectAttributes attr) {
		// 시퀀스 번호 반환
		int freeboardNo = freeboardDao.nextFreeboardNo();
		// 반환한 번호를 입력받은 freeboardDto의 freeboardNo로 설정
		freeboardDto.setFreeboardNo(freeboardNo);
		// HttpSession에서 로그인 중인 회원 아이디 반환
		String freeboardWriter = (String)session.getAttribute("loginId");
		// 반환한 아이디를 입력받은 freeboardDto의 freeboardWriter로 설정
		freeboardDto.setFreeboardWriter(freeboardWriter);
		// 게시글 등록 DB 처리
		freeboardDao.insertFreeboard(freeboardDto);
		// 해당 게시글의 상세 페이지로 강제 이동(redirect)
		attr.addAttribute("freeboardNo", freeboardNo);
		return "redirect:detail";
	}
	
	// 게시글 조회 Mapping (회원)
}
