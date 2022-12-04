package com.kh.ahzit.controller;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

import com.kh.ahzit.entity.FreeboardDto;
import com.kh.ahzit.repository.FreeboardDao;
import com.kh.ahzit.vo.FreeboardListSeachVO;

@Controller // 자유 게시판에 대한 Controller
@RequestMapping("/freeboard")
public class FreeboardController {

	// 의존성 주입
	@Autowired
	private FreeboardDao freeboardDao;
	
	// 게시글 등록 페이지 Mapping
	@GetMapping("/write")
	public String writeFreeboard() {
		// 게시글 작성 페이지(write.jsp)로 연결
		return "freeboard/write";
	}
	
	// 게시글 등록 DB 처리 Mapping
	@PostMapping("/write")
	public String writeFreeboard(HttpSession session, FreeboardDto freeboardDto, RedirectAttributes attr) {
		// 시퀀스 번호 반환
		int freeboardNo = freeboardDao.nextFreeboardNo();
		// 반환한 번호를 입력받은 freeboardDto의 freeboardNo로 설정
		freeboardDto.setFreeboardNo(freeboardNo);
		// HttpSession에서 로그인 중인 회원 아이디 반환
		String userId = (String)session.getAttribute("loginId");
		// 반환한 아이디를 입력받은 freeboardDto의 freeboardWriter로 설정
		freeboardDto.setFreeboardWriter(userId);
		// 게시글 등록 DB 처리
		freeboardDao.insertFreeboard(freeboardDto);
		// 해당 게시글의 상세 페이지로 강제 이동(redirect)
		attr.addAttribute("freeboardNo", freeboardNo);
		return "redirect:detail";
	}
	
	// 게시글 목록 Mapping (회원)
	@GetMapping("/list")
	public String selectFreeboard(Model model, @ModelAttribute FreeboardListSeachVO freeboardListSeachVO) {
		// 유형에 따른 게시글 조회 결과 반환
		List<FreeboardDto> freeboardList = freeboardDao.searchFreeboard(freeboardListSeachVO);
		// 조회 결과를 model에 추가
		model.addAttribute("freeboardList", freeboardList);
		// 게시글 목록 페이지(list.jsp)로 연결
		return "freeboard/list";
	}
	
	// 게시글 상세 Mapping (회원)
	@GetMapping("/detail")
	public String detailFreeboard(Model model, @RequestParam int freeboardNo) {
		// 입력받은 자유게시글 번호로 단일 조회
		FreeboardDto findDto = freeboardDao.detailFreeboard(freeboardNo);
		// 조회 결과를 model에 추가
		model.addAttribute("freeboardDto", findDto);
		// 게시글 상세 페이지(detail.jsp)로 연결
		return "freeboard/detail";
	}
	
	// 게시글 수정 페이지 Mapping
	@GetMapping("/edit")
	public String editFreeboard(Model model, @RequestParam int freeboardNo) {
		// 입력받은 자유게시글 번호로 단일 조회
		FreeboardDto findDto = freeboardDao.detailFreeboard(freeboardNo);
		// 조회 결과를 model에 추가
		model.addAttribute("freeboardDto", findDto);
		// 게시글 수정 페이지(edit.jsp)로 연결
		return "freeboard/edit";
	}
	
	// 게시글 수정 DB 처리 Mapping
	@PostMapping("/edit")
	public String editFreeboard(@ModelAttribute FreeboardDto freeboardDto, RedirectAttributes attr) throws Exception {
		// 입력받은 freeboardDto로 게시글 수정 처리 후 결과 반환
		boolean isEditted = freeboardDao.updateFreeboard(freeboardDto);
		// 수정 성공 여부에 따라 서로 다른 처리
		if(isEditted) { // 수정 성공시
			// 수정한 게시글의 게시글 상세 Mapping으로 강제 이동
			attr.addAttribute("freeboardNo", freeboardDto.getFreeboardNo());
			return "redirect:detail";
		}
		else { // 수정 실패시
			throw new Exception(); // 오류 발생
		}
	}
	
	// 게시글 비활성화 Mapping (회원일 경우 삭제 / 관리자일 경우 블라인드)
	@GetMapping("/inactive")
	public String inactiveFreeboard(@RequestParam int freeboardNo) throws Exception {
		// 입력받은 자유게시글 번호로 비활성화 처리 후 결과 반환
		boolean isInactive = freeboardDao.inactiveFreeboard(freeboardNo);
		// 비활성화 성공 여부에 따라 서로 다른 처리
		if(isInactive) { // 비활성화 성공시
			// 게시글 목록 Mapping으로 강제 이동
			return "redirect:list";
		}
		else { // 비활성화 실패시 
			throw new Exception(); // 오류 발생
		}
	}
}
