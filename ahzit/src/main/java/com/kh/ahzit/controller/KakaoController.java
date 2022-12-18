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

	/* 카카오 아이디를 카카오 테이블에 저장
	 * 카카오 아이디 받아서 회원 테이블에 아이디로 저장
	 * 
	추가 회원 정보를 입력받아서 회원테이블에 인서트
	인서트가 되면 세션에 로그인 아이디 저장
	기존 추가정보 입력했던 회원이면 홈화면으로 이동
	*/
	@Autowired
	private SqlSession sqlSessin;

	@Autowired
	private KakaoDao kakaoDao;
	
	@Autowired
	private AhzitUserDao ahzitUserDao;
	
	@Autowired
	private PasswordEncoder encoder; // 암호화복호화

	@GetMapping("/insert")
		public String insert() {

		return "kakao/insert";
	}
	
	@ResponseBody
	@PostMapping("/insert")
	public String insert(HttpSession session, @ModelAttribute KakaoDto kakaoDto,@RequestParam String kakaoId) {
		//System.out.println(kakaoDto);
		//System.out.println(kakaoId);
		String LoginId= "Y";
		KakaoDto kakaoDto1 = kakaoDao.selectOne(kakaoId);

	//	System.out.println(kakaoId);
		session.setAttribute(SessionConstant.kakaoId, kakaoId);

		if(kakaoDto1 == null) {
			kakaoDao.insert(kakaoDto);
			LoginId =  "N";
		//	System.out.println("처음 가입 회원 = "+LoginId);
			return LoginId;
		}
		
	//	System.out.println("이미 있는 회원 = " + LoginId);
		//System.out.println("ahzitUserDto? = " + ahzitUserDao.selectOne(kakaoId));
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
		System.out.println(userId);
		ahzitUserDto.setUserId(userId);
		
		kakaoDao.edit(ahzitUserDto);
	
		AhzitUserDto ahzitUserDto1 = ahzitUserDao.selectOne(userId);
		//System.out.println("암호화 전 dto 확인 = "+ ahzitUserDto);
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