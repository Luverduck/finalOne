package com.kh.ahzit.controller;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.ahzit.entity.AhzitUserDto;
import com.kh.ahzit.repository.AhzitUserDao;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private SqlSession sqlSessin;
		
	
	@Autowired
	private AhzitUserDao ahzitUserDao;
	
	@GetMapping("/")
	public String home() {
		return "admin/home";
	}
	
	@GetMapping("/ahzitUser")
	public String ahzitUserList(Model model) {
		List<AhzitUserDto> ahzitUser = ahzitUserDao.selectList();
		model.addAttribute("ahzitUser", ahzitUser);
	//	System.out.println(ahzitUser);
		return "admin/ahzitUser";
	}
	

}
