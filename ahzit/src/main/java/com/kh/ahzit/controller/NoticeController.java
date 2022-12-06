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
			@ModelAttribute (name="vo") NoticeListSearchVO vo) {
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
	
	
	
	
	@GetMapping("/write")
	public String write() {
		return "notice/write";
	}
	
	@PostMapping("/write")
	public String write(@ModelAttribute NoticeDto noticeDto,
			HttpSession session, RedirectAttributes attr){
		//session에 있는 회원 아이디를 작성자로 추가한 뒤 등록
		String memberId = (String)session.getAttribute(SessionConstant.ID);
		noticeDto.setNoticeWriter(memberId);
		
		//insert
		//noticeDao.insert(noticeDto);
		
		//등록 후 detail로 이동
		//return "redirect:list";
		
		//번호 생성 후 등록
		int noticeNo = noticeDao.sequence();
		noticeDto.setNoticeNo(noticeNo);
		noticeDao.insert2(noticeDto);
		attr.addAttribute("noticeNo", noticeNo);
		
		return "redirect:detail";
	}

	
}
