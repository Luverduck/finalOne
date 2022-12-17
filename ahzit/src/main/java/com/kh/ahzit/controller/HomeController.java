package com.kh.ahzit.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.ahzit.constant.SessionConstant;
import com.kh.ahzit.repository.AhzitUserDao;
import com.kh.ahzit.vo.MyAhzitVO;


@Controller
// 공용주소를 부여하지 않고 첫 페이지를 처리하도록 설정
public class HomeController {

	@Autowired
	private AhzitUserDao ahzitUserDao;
	
	@RequestMapping("/")
	public String home(Model model, HttpSession session, @ModelAttribute MyAhzitVO myAhzitVO) {
		String loginId = (String) session.getAttribute(SessionConstant.ID);
		
		if(loginId != null ) {
			List<MyAhzitVO> myAhzitTopN = ahzitUserDao.myAhzitTopN(loginId); //내가 가입한 아지트 목록
			model.addAttribute("myAhzitTopN", myAhzitTopN); //내가 가입한 아지트 목록 조회
		}
		return "home";
	}	
		
}
