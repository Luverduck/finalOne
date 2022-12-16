package com.kh.ahzit.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.ahzit.constant.SessionConstant;
import com.kh.ahzit.entity.AhzitUserDto;
import com.kh.ahzit.repository.AdminDao;
import com.kh.ahzit.repository.AhzitUserDao;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private SqlSession sqlSessin;
		
	
	@Autowired
	private AhzitUserDao ahzitUserDao;
	
	@Autowired
	private AdminDao adminDao;
	
	@GetMapping("/")
	public String home() {
		return "admin/home";
	}
	
	// 회원 조회
	@GetMapping("/ahzitUser")
	public String ahzitUserList(Model model) {
		List<AhzitUserDto> ahzitUser = adminDao.selectList();
		model.addAttribute("ahzitUser", ahzitUser);
		return "admin/ahzitUser";
	}
	
	// 관리자 생성
		@GetMapping("/join")
		public String join() {
			return "admin/join";
		}

		@PostMapping("/join")
		public String join(@ModelAttribute AhzitUserDto ahzitUserDto) {
			//관리자 회원 테이블 저장
			adminDao.insert(ahzitUserDto);
			return "redirect:/admin/";
		}
		
		// 관리자 등급 변경
		@GetMapping("/change")
		public String change() {
			return "admin/change";
		}
		
		@PostMapping("/change")
		public String edit(@ModelAttribute AhzitUserDto ahzitUserDto, Model model, HttpSession session) {
			String loginGrade = (String) session.getAttribute(SessionConstant.GRADE);
			// 관리자 등급 변경 
			adminDao.change(ahzitUserDto);
			System.out.println(loginGrade);
		
			// 관리자 변경시 운영자로 업데이트
			adminDao.change2(ahzitUserDto);
			model.addAttribute("adminId",ahzitUserDto.getUserId());
			return "redirect:/admin/";
		

		}		
	

}
