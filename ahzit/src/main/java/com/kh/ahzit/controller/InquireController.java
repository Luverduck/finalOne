package com.kh.ahzit.controller;

import java.io.File;
import java.util.List;

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
import com.kh.ahzit.entity.FreeboardDto;
import com.kh.ahzit.entity.InquireDto;
import com.kh.ahzit.error.TargetNotFoundException;
import com.kh.ahzit.repository.AttachmentDao;
import com.kh.ahzit.repository.InquireDao;
import com.kh.ahzit.vo.FreeboardListSeachVO;
import com.kh.ahzit.vo.InquireListSearchVO;

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
	public String list(Model model, HttpSession session
			,@ModelAttribute InquireListSearchVO inquireListSearchVO) {
		
		String loginId = (String) session.getAttribute(SessionConstant.ID);
		
		//System.out.println("1번"+inquireListSearchVO.getInquireId());
		//System.out.println("2번"+inquireListSearchVO);
		
		// 게시글 총 갯수 반환
		int count = inquireDao.countInquire(inquireListSearchVO);
		// 반환한 총 갯수를 freeboardListVO의 total로 설정
		inquireListSearchVO.setCount(count);
		inquireListSearchVO.setInquireId(loginId);
		// 유형에 따른 게시글 조회 결과 반환
		List<InquireDto> inquireList = inquireDao.selectList(inquireListSearchVO);
		// 조회 결과를 model에 추가
		model.addAttribute("inquireList", inquireList);
		
		return "inquire/list";
	
	}
	
	// 문의 수정
	@GetMapping("/edit")
	public String edit(Model model, @RequestParam int inquireNo) {
		model.addAttribute("inquireDto", inquireDao.detail(inquireNo));
		return "inquire/edit";
	}
		
	@PostMapping("/edit")
	public String edit(@ModelAttribute InquireDto inquireDto, RedirectAttributes attr) {
		boolean result = inquireDao.edit(inquireDto);
		if(result) {
			attr.addAttribute("inquireNo", inquireDto.getInquireNo());
			return "redirect:detail";
		}
		else {
			throw new TargetNotFoundException("잘못된 입력입니다.");
		}
	}		
	
	// 문의 삭제
	@GetMapping("/delete")
	public String delete(@RequestParam int inquireNo,HttpSession session) {
		String loginId = (String) session.getAttribute(SessionConstant.ID);
		boolean result =inquireDao.delete(inquireNo);
		if(result) {
			return "redirect:list?inquireId="+loginId;
		}
		else {
			throw new TargetNotFoundException("잘못된 입력입니다.");
		}
	}
	
}