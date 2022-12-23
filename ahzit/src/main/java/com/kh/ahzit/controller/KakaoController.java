package com.kh.ahzit.controller;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ahzit.constant.SessionConstant;
import com.kh.ahzit.entity.AhzitUserDto;
import com.kh.ahzit.entity.KakaoDto;
import com.kh.ahzit.repository.AhzitUserDao;
import com.kh.ahzit.repository.KakaoDao;

@Controller
@RequestMapping("/kakao")
public class KakaoController {

	@Autowired
	private KakaoDao kakaoDao;
	
	@Autowired
	private AhzitUserDao ahzitUserDao;
	
	@Autowired
	private PasswordEncoder encoder;

	@GetMapping("/insert")
		public String insert() {

		return "kakao/insert";
	}
	
	@ResponseBody
	@PostMapping("/insert")
	public String insert(HttpSession session, @ModelAttribute KakaoDto kakaoDto,@RequestParam String kakaoId) {
		String LoginId= "Y";
		KakaoDto kakaoDto1 = kakaoDao.selectOne(kakaoId);

		session.setAttribute(SessionConstant.kakaoId, kakaoId);

		if(kakaoDto1 == null) {
			kakaoDao.insert(kakaoDto);
			LoginId =  "N";
			return LoginId;
		}
	
		AhzitUserDto ahzitUserDto = ahzitUserDao.selectOne(kakaoId);
		session.setAttribute(SessionConstant.ID, ahzitUserDto.getUserId());
		session.setAttribute(SessionConstant.GRADE, ahzitUserDto.getUserGrade());
		ahzitUserDao.updateLoginTime(ahzitUserDto.getUserId());
		return LoginId;
	}
	
	@GetMapping("/edit")
	public String edit() {
	return "kakao/edit";
}
	@PostMapping("/edit")
	public String edit(@ModelAttribute AhzitUserDto ahzitUserDto ,HttpSession session) {
		String userId = (String) session.getAttribute(SessionConstant.kakaoId);
		ahzitUserDto.setUserId(userId);
		
		kakaoDao.edit(ahzitUserDto);
	
		AhzitUserDto ahzitUserDto1 = ahzitUserDao.selectOne(userId);
		String pw = ahzitUserDto.getUserPw(); 
		String enc = encoder.encode(pw); 
		ahzitUserDto.setUserPw(enc); 
		ahzitUserDao.changePw(ahzitUserDto);
		
		session.setAttribute(SessionConstant.ID, ahzitUserDto1.getUserId());
		session.setAttribute(SessionConstant.GRADE, ahzitUserDto1.getUserGrade());
		session.removeAttribute(SessionConstant.kakaoId);
		ahzitUserDao.updateLoginTime(ahzitUserDto.getUserId());
		return "redirect:/";
}

}