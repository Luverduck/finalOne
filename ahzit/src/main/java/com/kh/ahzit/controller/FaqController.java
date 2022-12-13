package com.kh.ahzit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.ahzit.repository.FaqDao;
import com.kh.ahzit.vo.FaqListSearchVO;

@Controller
@RequestMapping("/faq")
public class FaqController {
	@Autowired
	private FaqDao faqDao;
	
	@GetMapping("/list")
	public String list(Model model,
			@ModelAttribute(name="vo") FaqListSearchVO vo) {
		if(vo.isSearch()) {
			model.addAttribute("list", faqDao.selectList(vo));
		}
		else {
			model.addAttribute("list", faqDao.selectList());
		}
		return "faq/list";
	}
}
