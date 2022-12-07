package com.kh.ahzit.controller;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ahzit.constant.SessionConstant;
import com.kh.ahzit.entity.InquireDto;
import com.kh.ahzit.repository.AttachmentDao;
import com.kh.ahzit.repository.InquireDao;

@Controller
@RequestMapping("/inquire")
public class InquireController {

	@Autowired
	private SqlSession sqlSessin;
	
	@Autowired
	private AttachmentDao attachmentDao;
	
	@Autowired
	private InquireDao inquireDao;
	
	private final File directory = new File("D:/upload/kh10f/inquireAttachment");
	
	// 1:1 문의 등록
	@GetMapping("/insert")
	public String insert() {
		return "inquire/insert";
	}
	@PostMapping("/insert")
	public String insert(HttpSession session,@ModelAttribute InquireDto inquireDto, 
			RedirectAttributes attr) {
		int inquireNo = inquireDao.sequence();
		inquireDto.setInquireNo(inquireNo);
		String loginId = (String) session.getAttribute(SessionConstant.ID);
		inquireDto.setInquireId(loginId);
		inquireDao.insert(inquireDto);
		attr.addAttribute("inquireNo", inquireNo);
		return "redirect:detail";
	}
	
	// 문의 상세
	@GetMapping("/detail")
	public String detail(Model model, @RequestParam int inquireNo) {
		InquireDto inquireDto = inquireDao.detail(inquireNo);
		model.addAttribute("inquireDto", inquireDto);
		return "inquire/detail";
	}
	
	// 문의 목록
	@GetMapping("/list")
	public String list(Model model, @RequestParam String inquireId) {
		model.addAttribute("list", inquireDao.selectList(inquireId));
		return "inquire/list";
	}
	
	
	
}
