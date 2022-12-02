package com.kh.ahzit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.ahzit.entity.AhzitUserDto;
import com.kh.ahzit.repository.AhzitUserDao;

@Controller
@RequestMapping("/ahzitUser")
public class AhzitUserController {
	
	@Autowired
	private AhzitUserDao ahzitUserDao;
	
	@GetMapping("/join")
	public String insert() {
		return "ahzitUser/join";
	}

	@PostMapping("/join")
	public String insert(@ModelAttribute AhzitUserDto ahzitUserDto) {
		ahzitUserDao.join(ahzitUserDto);
		return "redirect:join_success";
	}
	
	@GetMapping("/join_success")
	public String joinSuccess() {
		return "ahzitUser/join_success";
	}

}
