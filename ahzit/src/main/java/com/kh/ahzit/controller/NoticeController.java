package com.kh.ahzit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ahzit.entity.NoticeDto;
import com.kh.ahzit.error.TargetNotFoundException;
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
	
	@GetMapping("/delete")
	public String delete(@RequestParam int noticeNo) {
		boolean result = noticeDao.delete(noticeNo);
		
		if(result) {
			return "redirect:list";
		}
		else {
			throw new TargetNotFoundException();
		}
	}
	
	@GetMapping("/edit")
	public String edit(@RequestParam int noticeNo, Model model) {
		NoticeDto noticeDto = noticeDao.selectOne(noticeNo);
		if(noticeDto == null) { //없는 경우 예외 발생
			throw new TargetNotFoundException();
		}
		model.addAttribute("noticeDto", noticeDto);
		return "notice/edit";
	}
	
	@PostMapping("/edit")
	public String edit(@ModelAttribute NoticeDto noticeDto,
			RedirectAttributes attr) {
		boolean result = noticeDao.edit(noticeDto);
		if(result) { //성공했다면 상세페이지로 이동
			attr.addAttribute("noticeNo", noticeDto.getNoticeNo());
			return "redirect:detail";
		}
		else {
			throw new TargetNotFoundException();
		}
	}
	
	
	
}
