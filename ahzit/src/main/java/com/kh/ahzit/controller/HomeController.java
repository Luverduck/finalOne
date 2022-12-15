package com.kh.ahzit.controller;

import java.io.File;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.ahzit.repository.AhzitDao;
import com.kh.ahzit.repository.AttachmentDao;

@Controller
// 공용주소를 부여하지 않고 첫 페이지를 처리하도록 설정
public class HomeController {
	
	@Autowired
	private AhzitDao ahzitDao;
	
	@Autowired
	private AttachmentDao attachmentDao;
	
	//private final File dir = new File(System.getProperty("user.home") + "/upload");
	private final File dir = new File("D:/upload/kh10f");

	@PostConstruct //최초 실행 시 딱 한번만 실행되는 메소드
	public void prepare() {
		dir.mkdirs();
	}
	
	@RequestMapping("/")
	public String home(Model model) {
		model.addAttribute("list", ahzitDao.selectList());
		
		model.addAttribute("attachmentList", attachmentDao.selectList());
		return "home";
	}	
		
}
