package com.kh.ahzit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.ahzit.repository.NoticeDao;
import com.kh.ahzit.vo.NoticeListSearchVO;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired
	private NoticeDao noticeDao;
	
	@GetMapping("/list")
	public String list(Model model,
			@ModelAttribute NoticeListSearchVO vo) {
		if(vo.isSearch()) {
			model.addAttribute("list", noticeDao.selectList(vo));
		}
		else {
			model.addAttribute("list", noticeDao.selectList());
		}
				
		model.addAttribute("list", noticeDao.selectList());
		return "notice/list";
	}
	
	@GetMapping("/detail")
	public String detail(@RequestParam int noticeNo, Model model) {
		
		//조회수 증가
		//noticeDao.updateReadCount(noticeNo);
		
		//detail
		model.addAttribute("noticeDto", noticeDao.read(noticeNo));
		return "notice/detail";
	}
	
}
