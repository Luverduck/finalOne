package com.kh.ahzit.controller;

import javax.servlet.http.HttpSession;

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
import com.kh.ahzit.entity.FaqDto;
import com.kh.ahzit.error.TargetNotFoundException;
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

		//페이지 네비게이터를 위한 게시글 수
		int count = faqDao.count(vo);
		vo.setCount(count);
		
		model.addAttribute("list", faqDao.selectList(vo));
		return "faq/list";
	}
	
	@GetMapping("/detail")
	public String detail(@RequestParam int faqNo, Model model) {
		model.addAttribute("faqDto", faqDao.selectOne(faqNo));
		return "faq/detail";
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam int faqNo) {
		boolean result = faqDao.delete(faqNo);
		if(result) {
			return "redirect:list";
		}
		else {
			throw new TargetNotFoundException();
		}
	}
	
	@GetMapping("/edit")
	public String edit(@RequestParam int faqNo, Model model) {
		FaqDto faqDto = faqDao.selectOne(faqNo);
		if(faqDto == null) {
			throw new TargetNotFoundException();
		}
		model.addAttribute("faqDto", faqDto);
		return "faq/edit";
	}
	
	@PostMapping("/edit")
	public String edit(@ModelAttribute FaqDto faqDto,
			RedirectAttributes attr) {
		boolean result = faqDao.edit(faqDto);
		if(result) {
			attr.addAttribute("faqNo", faqDto.getFaqNo());
			return "redirect:detail";
		}
		else {
			throw new TargetNotFoundException();
		}
	}
	
	@GetMapping("/write")
	public String write() {
		return "faq/write";
	}
	
	@PostMapping("/write")
	public String write(@ModelAttribute FaqDto faqDto,
			HttpSession session, RedirectAttributes attr) {
		//session에 있는 아이디를 작성자로 추가한 뒤 등록
		String memberId = (String)session.getAttribute(SessionConstant.ID);
		faqDto.setFaqWriter(memberId);
		
		//번호 생성 후 등록
		int faqNo = faqDao.insert2(faqDto);
		attr.addAttribute("faqNo", faqNo);
		return "redirect:detail";
	}
	
}
