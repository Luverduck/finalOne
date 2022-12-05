package com.kh.ahzit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.ahzit.entity.CertificationDto;
import com.kh.ahzit.service.EmailService;

@Controller
public class AsyncController {
	
	@Autowired
	private EmailService emailService;

	@RequestMapping("/async1")
	public String async1() {
		return "async1";
	}
	
	// 비동기통신은 화면을 줄 필요가 없어서 @ResponseBody를 붙여서 데이터를 전달한다
	// 통상적으로 비동기만 처리하는 컨트롤러를 따로 만들어 @RestController 어노테이션을 붙여 사용한다
	@PostMapping("/async2")
	@ResponseBody
	public void async2(@RequestParam String certificationId) {
		emailService.sendCertMail(certificationId);
	}
	
	@PostMapping("/async3")
	@ResponseBody
	public boolean async3(@ModelAttribute CertificationDto certificationDto) {
		// System.out.println("async3 확인");
		return emailService.checkCert(certificationDto);
		
	}
}
