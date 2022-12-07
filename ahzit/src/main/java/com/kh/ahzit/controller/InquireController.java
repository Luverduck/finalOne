package com.kh.ahzit.controller;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
	@GetMapping("/insert")
	public String insert() {
		return "inquire/insert";
	}
	@PostMapping("/insert")
	public String insert(HttpSession session,@ModelAttribute InquireDto inquireDto, 
			RedirectAttributes attr) {
		int inqrireNo = inquireDao.sequence();
		inquireDto.setInquireNo(inqrireNo);
		String loginId = (String) session.getAttribute(SessionConstant.ID);
		inquireDto.setInquireId(loginId);
		inquireDao.insert(inquireDto);
		attr.addAttribute("inqrireNo", inqrireNo);
		return "redirect:detail";
		
	}
	
	
}
