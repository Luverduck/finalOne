package com.kh.ahzit.controller;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ahzit.constant.SessionConstant;
import com.kh.ahzit.entity.FreeboardReplyDto;
import com.kh.ahzit.entity.InquireReplyDto;
import com.kh.ahzit.error.TargetNotFoundException;
import com.kh.ahzit.repository.InquireReplyDao;

@Controller
@RequestMapping("/inquireReply")
public class InquireReplyController {
	
	@Autowired
	private InquireReplyDao inquireReplyDao;
	
	// 댓글 등록
	@PostMapping("/insert")
	public String insert(@ModelAttribute InquireReplyDto inquireReplyDto, 
			HttpSession session, RedirectAttributes attr) {
		
		int inquireReplyNo = inquireReplyDao.sequence();
		String loginId = (String)session.getAttribute("loginId");
		inquireReplyDto.setInquireReplyNo(inquireReplyNo);  // dto에 값 셋팅
		inquireReplyDto.setInquireReplyWriter(loginId);
		int inquireNo = inquireReplyDto.getInquireOriginNo();
		
		 boolean result = inquireReplyDao.insert(inquireReplyDto);
		 if(result) {
			 inquireReplyDao.updateReply(inquireReplyDto);
		 }
		
		
		
		attr.addAttribute("inquireNo", inquireNo);
		return "redirect:/inquire/detail";
	}
	
	// 댓글 수정
		@PostMapping("/edit")
		public String editFreeboardReply(@ModelAttribute InquireReplyDto inquireReplyDto, RedirectAttributes attr) throws Exception {
			
			boolean result = inquireReplyDao.editInquireReply(inquireReplyDto);
	
			if(result) { // 댓글 수정에 성공할 경우
				// Redirect를 위한 게시글 원본 번호 반환
				int inquireNo = inquireReplyDto.getInquireOriginNo();
				attr.addAttribute("inquireNo", inquireNo);
				return "redirect:/inquire/detail";
			}
			else { // 댓글 수정에 실패할 경우
				// 오류 발생
				throw new Exception();
			}
		}
		
		// 댓글 삭제
		@GetMapping("/delete")
		public String delete(@ModelAttribute InquireReplyDto inquireReplyDto, HttpSession session,RedirectAttributes attr) {
		//	String loginId = (String) session.getAttribute(SessionConstant.ID);
			boolean result =inquireReplyDao.delete(inquireReplyDto);
			if(result) {
				int inquireNo = inquireReplyDto.getInquireOriginNo();
				attr.addAttribute("inquireNo", inquireNo);
				return "redirect:/inquire/detail";
			}
			else {
				throw new TargetNotFoundException("잘못된 입력입니다.");
			}
		}
	
}
