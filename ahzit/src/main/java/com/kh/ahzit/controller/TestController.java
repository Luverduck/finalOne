package com.kh.ahzit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ahzit.entity.CertificationDto;
import com.kh.ahzit.service.EmailService;

@Controller
public class TestController {

	@Autowired
	private EmailService emailService;

	@RequestMapping("/test1")
	public String test1() {
		return "test1";
	}

	@RequestMapping("/test2")
	public String test2(@RequestParam String certificationId, Model model) {
		emailService.sendCertMail(certificationId);
		model.addAttribute("certificationId", certificationId);
		return "test2";
	}

	@RequestMapping("/test3")
	public String test3(@ModelAttribute CertificationDto certificationDto, RedirectAttributes attr) {
		boolean result = emailService.checkCert(certificationDto);
		if (result) {
			return "redirect:test4";
		} else {
			attr.addAttribute("certificationId", certificationDto.getCertificationId());
			return "redirect:test2?error";
		}
	}

	@RequestMapping("/test4")
	public String test2() {
		return "test4";
	}
}
