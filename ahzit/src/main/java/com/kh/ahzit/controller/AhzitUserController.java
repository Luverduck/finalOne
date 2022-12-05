package com.kh.ahzit.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.ahzit.constant.SessionConstant;
import com.kh.ahzit.entity.AhzitUserDto;
import com.kh.ahzit.repository.AhzitUserDao;

@Controller
@RequestMapping("/ahzitUser")
public class AhzitUserController {
	
	@Autowired
	private AhzitUserDao ahzitUserDao;
	
	// 회원가입
	@GetMapping("/join")
	public String insert() {
		return "ahzitUser/join";
	}
	
	@PostMapping("/join")
	public String insert(@ModelAttribute AhzitUserDto ahzitUserDto) {
		ahzitUserDao.join(ahzitUserDto);
		return "redirect:joinSuccess";
	}
	// 가입완료
	@GetMapping("/joinSuccess")
	public String joinSuccess() {
		return "ahzitUser/joinSuccess";
	}
	
	//로그인
	@GetMapping("/login")
	public String login() {
		return "ahzitUser/login";
	}
	@PostMapping("/login")
	public String login(HttpSession session, @ModelAttribute AhzitUserDto ahzitUserDto) {
		
		// 1. 아이디 패스워드 비교 구문 
		// 아이디조회, 비밀번호 조회
		// 2. 암호화
		// 끝
		if(ahzitUserDao.login(ahzitUserDto)) {
			session.setAttribute(SessionConstant.ID, ahzitUserDto.getUserId());
			return "redirect:/";
		}
		else {
			return "redirect:login?error";
		}
		
		
	}
	
	// 로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute(SessionConstant.ID);
		return "redirect:login";
	}
	
	// 마이페이지
	@GetMapping("/mypage")
	public String mypage(Model model, HttpSession session) {
		String loginId = (String)session.getAttribute(SessionConstant.ID);
		model.addAttribute("ahzitUserDto", ahzitUserDao.selectOne(loginId));
		
		
		AhzitUserDto ahzitUserDto = ahzitUserDao.selectOne(loginId);
		
		model.addAttribute("ahzitUserDto", ahzitUserDto);

		return "ahzitUser/mypage";
	}
	
}
