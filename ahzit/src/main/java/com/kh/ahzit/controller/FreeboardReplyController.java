package com.kh.ahzit.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ahzit.entity.FreeboardReplyDto;
import com.kh.ahzit.repository.FreeboardReplyDao;

@Controller
@RequestMapping("/freeboard_reply")
public class FreeboardReplyController {

	// 의존성 주입
	@Autowired
	private FreeboardReplyDao freeboardReplyDao;
	
	// 자유게시글 댓글 등록 DB 처리 Mapping
	@PostMapping("/write")
	public String writeFreeboardReply(@ModelAttribute FreeboardReplyDto freeboardReplyDto, HttpSession session, RedirectAttributes attr) {
		// 다음 댓글 번호 반환
		int freeboardReplyNo = freeboardReplyDao.nextFreeboardReplyNo();
		// 반환한 댓글 번호를 freeboardReplyDto의 freeboardReplyNo로 설정
		freeboardReplyDto.setFreeboardReplyNo(freeboardReplyNo);
		// HttpSession에서 로그인 중인 회원 아이디 반환
		String loginId = (String)session.getAttribute("loginId");
		// 반환한 아이디를 freeboardReplyDto의 freeboardReplyWriter로 설정
		freeboardReplyDto.setFreeboardReplyWriter(loginId);
		// 댓글 등록 DB 처리
		freeboardReplyDao.insertFreeboardReply(freeboardReplyDto);
		// Redirect를 위한 게시글 원본 번호 반환
		int freeboardNo = freeboardReplyDto.getFreeboardOriginNo();
		// DB 처리 후 해당 게시글의 상세 페이지로 강제 이동(redirect)
		attr.addAttribute("freeboardNo", freeboardNo);
		return "redirect:/freeboard/detail";
	}
	
	// 자유게시글 댓글 목록 조회는 게시글 상세에 포함
	
	// 자유게시글 댓글 수정 DB 처리 Mapping
	@PostMapping("/edit")
	public String editFreeboardReply(@ModelAttribute FreeboardReplyDto freeboardReplyDto, RedirectAttributes attr) throws Exception {
		// 댓글 수정 DB 처리 후 성공 여부 반환
		boolean isEdited = freeboardReplyDao.editFreeboardReply(freeboardReplyDto);
		// 댓글 수정 성공 여부에 따라 서로 다른 처리
		if(isEdited) { // 댓글 수정에 성공할 경우
			// Redirect를 위한 게시글 원본 번호 반환
			int freeboardNo = freeboardReplyDto.getFreeboardOriginNo();
			// DB 처리 후 해당 게시글의 상세 페이지로 강제 이동(redirect)
			attr.addAttribute("freeboardNo", freeboardNo);
			return "redirect:/freeboard/detail";
		}
		else { // 댓글 수정에 실패할 경우
			// 오류 발생
			throw new Exception();
		}
	}
	
	// 자유게시글 댓글 비활성화 DB 처리 Mapping
	@GetMapping("/inactive")
	public String inactiveFreeboardReply(@ModelAttribute FreeboardReplyDto freeboardReplyDto, RedirectAttributes attr) throws Exception {
		// 댓글 비활성화 DB 처리 후 성공 여부 반환
		boolean isInactive = freeboardReplyDao.inactiveFreeboardReply(freeboardReplyDto.getFreeboardOriginNo());
		// 댓글 비활성화 성공 여부에 따라 서로 다른 처리
		if(isInactive) { // 댓글 비활성화에 성공한 경우
			// Redirect를 위한 게시글 원본 번호 반환
			int freeboardNo = freeboardReplyDto.getFreeboardOriginNo();
			// DB 처리 후 해당 게시글의 상세 페이지로 강제 이동(redirect)
			attr.addAttribute("freeboardNo", freeboardNo);
			return "redirect:/freeboard/detail";
		}
		else { // 댓글 비활성화에 실패한 경우
			// 오류 발생
			throw new Exception();
		}
	}
}
