package com.kh.ahzit.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.ahzit.constant.SessionConstant;
import com.kh.ahzit.repository.AhzitDao;
import com.kh.ahzit.repository.AhzitUserDao;
import com.kh.ahzit.vo.AhzitSearchListRequestVO;
import com.kh.ahzit.vo.MyAhzitVO;


@Controller
public class HomeController {

	// 의존성 주입
	@Autowired
	private AhzitUserDao ahzitUserDao;
	
	@Autowired
	private AhzitDao ahzitDao;
	
	@RequestMapping("/")
	public String home(Model model, HttpSession session) {
		String loginId = (String) session.getAttribute(SessionConstant.ID);
		
		if(loginId != null ) {
			List<MyAhzitVO> myAhzitTopN = ahzitUserDao.myAhzitTopN(loginId); //내가 가입한 아지트 목록
			model.addAttribute("myAhzitTopN", myAhzitTopN); //내가 가입한 아지트 목록 조회
		}
		return "home";
	}	
	
	// 홈 화면 검색창에서 검색시 소모임 검색 결과 Mapping
 	@RequestMapping("/search_keyword")
 	public String searchKeyword(Model model, @ModelAttribute AhzitSearchListRequestVO ahzitSearchListRequestVO) {
 		//System.out.println(ahzitSearchListRequestVO.getKeyword());
 		//System.out.println(ahzitDao.selectAhzit(ahzitSearchListRequestVO));
 		model.addAttribute("ahzitList", ahzitDao.selectAhzit(ahzitSearchListRequestVO));
 		model.addAttribute("keyword", ahzitSearchListRequestVO.getKeyword());
 		return "ahzit/search_keyword";
 	}
 	
 	// 홈 화면의 찾기 버튼 클릭시 카테고리별 소모임 Mapping
 	@RequestMapping("/search") 
 	public String search(Model model, @ModelAttribute AhzitSearchListRequestVO ahzitSearchListRequestVO) {

 		int total = ahzitDao.countselectAhzit(ahzitSearchListRequestVO);
 		ahzitSearchListRequestVO.setTotal(total);
 		List<AhzitSearchListRequestVO> searchSortAhzit = ahzitDao.selectSortAhzit(ahzitSearchListRequestVO);
 		//System.out.println(allAhzitList);
 	//	System.out.println(total);
 		model.addAttribute("searchSortAhzit", searchSortAhzit);
 		return "ahzit/search";
 	}
}
