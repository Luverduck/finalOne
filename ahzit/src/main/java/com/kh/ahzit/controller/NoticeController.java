package com.kh.ahzit.controller;

import java.util.HashSet;
import java.util.Set;

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
		return "notice/list";
	}
	
	@GetMapping("/detail")
	public String detail(@RequestParam int noticeNo, Model model,
			HttpSession session) {
		
		//조회수 증가
		//noticeDao.updateReadCount(noticeNo);
		
		//데이터를 읽도록 처리
		//model.addAttribute("noticeDto", noticeDao.read(noticeNo));
		
		//조회수 중복 방지 처리
		//현재 history가 있는지 없는지 모르니까 꺼내서 없으면 생성
		Set<Integer> history = (Set<Integer>) session.getAttribute("history");
		if(history == null) { //없으면 생성
			history = new HashSet<>();
		}
		//현재 글 번호를 읽은적이 있는지 검사
		if(history.add(noticeNo)) { //처음 읽은 번호
			model.addAttribute("noticeDto", noticeDao.read(noticeNo));
		}
		else { //읽은 적이 있는 번
			model.addAttribute("noticeDto", noticeDao.selectOne(noticeNo));
		}
		session.setAttribute("history", history);
		
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
		int noticeNo = noticeDao.insert2(noticeDto);
		attr.addAttribute("noticeNo", noticeNo);
		
		return "redirect:detail";
	}

	
}
