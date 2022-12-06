package com.kh.ahzit.controller;

import java.io.File;
import java.io.IOException;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ahzit.constant.SessionConstant;
import com.kh.ahzit.entity.AhzitDto;
import com.kh.ahzit.entity.AhzitMemberDto;
import com.kh.ahzit.repository.AhzitDao;
import com.kh.ahzit.service.AhzitService;

@Controller
@RequestMapping("/ahzit")
public class AhzitController {
	
	@Autowired
	private AhzitDao ahzitDao;
	
	@Autowired
	private AhzitService ahzitService;
	
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
			HttpSession session) throws IllegalStateException, IOException {
		String ahzitLeader = (String)session.getAttribute("loginId");
		ahzitDto.setAhzitLeader(ahzitLeader);
		
		//AhzitService에서 번호를 미리 생성 후 등록, 첨부파일 업로드(저장)까지 처리
		int ahzitNo = ahzitService.create(ahzitDto, attachment);
		
		//소모임에 개설자 자동 추가
		ahzitMemberDto.setMemberAhzitNo(ahzitNo);
		ahzitMemberDto.setMemberId(ahzitLeader);
		
		//redirect
		attr.addAttribute("ahzitNo", ahzitNo);
		return "redirect:detail";
	}
	
	//소모임 관리 페이지
	@GetMapping("/setting")
	public String setting(@RequestParam int AhzitNo) {
		return "ahzit/detail_edit";
	}
	
	//소모임 회원 관리페이지
	@GetMapping("/member/management")
	public String ahzitMemberManagement(
				@RequestParam int AhzitNo, Model model
				) {
		return "ahzit/detail_member_management";
	}
	
	
	

}
