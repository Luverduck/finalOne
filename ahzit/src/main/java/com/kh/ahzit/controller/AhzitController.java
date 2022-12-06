package com.kh.ahzit.controller;

import java.io.File;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ahzit.entity.AhzitDto;
import com.kh.ahzit.entity.AhzitMemberDto;
import com.kh.ahzit.repository.AhzitDao;

@Controller
@RequestMapping("/ahzit")
public class AhzitController {
	
	@Autowired
	private AhzitDao ahzitDao;
	
	private final File dir = new File("D:/upload/kh10f/ahzit");
	
	@PostConstruct //최초 실행 시 딱 한번만 실행되는 메소드
	public void prepare() {
		dir.mkdirs();
	}
	
	@GetMapping("/create")
	public String create() {
		return "ahzit/create";
	}
	
	@PostMapping("/create")
	private String create(
			@ModelAttribute AhzitDto ahzitDto,
			@ModelAttribute AhzitMemberDto ahzitMemberDto,
			@RequestParam MultipartFile attachment,
			RedirectAttributes attr,
			HttpSession session) {
		String ahzitLeader = (String)session.getAttribute("loginId");
		ahzitDto.setAhzitLeader(ahzitLeader);
		
		//AhzitService에서 번호를 미리 생성 후 등록, 첨부파일 업로드(저장)까지 처리
		
		
		return "redirect:detail";
	}

}
