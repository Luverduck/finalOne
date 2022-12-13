package com.kh.ahzit.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.ahzit.entity.AhzitDto;
import com.kh.ahzit.entity.AhzitMemberDto;
import com.kh.ahzit.entity.AttachmentDto;
import com.kh.ahzit.repository.AhzitBoardDao;
import com.kh.ahzit.repository.AhzitDao;

import com.kh.ahzit.repository.AttachmentDao;
import com.kh.ahzit.vo.AhzitBoardVO;

@Controller
@RequestMapping("/ahzit_in")
public class AhzitInController {
	
	// 의존성 주입
	@Autowired
	private AhzitBoardDao ahzitBoardDao;
	
	@Autowired
	private AhzitDao ahzitDao;
	
	@Autowired
	private AttachmentDao attachmentDao;
	
	// 소모임 홈 화면 Mapping
	@GetMapping("/{ahzitNo}")
	public String home(@PathVariable int ahzitNo, HttpSession session, Model model) {
		// HttpSession에서 로그인 중인 회원 아이디 반환
		String loginId = (String)session.getAttribute("loginId");
		// 입력받은 소모임 번호와 반환한 회원 아이디로 로그인한 회원의 해당 소모임 내 회원 정보 조회
		AhzitMemberDto ahzitMemberDto = ahzitBoardDao.searchMemberInfo(ahzitNo, loginId);
		// 조회한 정보를 model에 추가
		model.addAttribute("ahzitMemberDto", ahzitMemberDto);
		//개설한 아지트 정보를 조회
		model.addAttribute("ahzitVO", ahzitDao.selectOne(ahzitNo));

		
		//입력받은 아지트번호로 연결되는 첨부파일 조회
		model.addAttribute("attachmentList", attachmentDao.selectAhzitAttachment(ahzitNo));

		// 편의를 위해 ahzitNo를 model에 추가
		model.addAttribute("ahzitNo", ahzitNo);
		// 소모임 홈 화면(board.jsp)로 연결
		return "ahzit_in/board";
	}
	
	// 소모임 사진첩 Mapping
	@GetMapping("/{ahzitNo}/album")
	public String album(@PathVariable int ahzitNo, HttpSession session, Model model) {
		// HttpSession에서 로그인 중인 회원 아이디 반환
		String loginId = (String)session.getAttribute("loginId");
		// 입력받은 소모임 번호와 반환한 회원 아이디로 로그인한 회원의 해당 소모임 내 회원 정보 조회
		AhzitMemberDto ahzitMemberDto = ahzitBoardDao.searchMemberInfo(ahzitNo, loginId);
		// 조회한 정보를 model에 추가
		model.addAttribute("ahzitMemberDto", ahzitMemberDto);
		//개설한 아지트 정보를 조회
		model.addAttribute("ahzitVO", ahzitDao.selectOne(ahzitNo));
		// 편의를 위해 ahzitNo를 model에 추가
		model.addAttribute("ahzitNo", ahzitNo);
		// 소모임 사진첩 페이지(board.jsp)로 연결
		return "ahzit_in/album";
	}
	
	// 소모임 일정 Mapping
	@GetMapping("/{ahzitNo}/calendar")
	public String calander(@PathVariable int ahzitNo, HttpSession session, Model model) {
		// HttpSession에서 로그인 중인 회원 아이디 반환
		String loginId = (String)session.getAttribute("loginId");
		// 입력받은 소모임 번호와 반환한 회원 아이디로 로그인한 회원의 해당 소모임 내 회원 정보 조회
		AhzitMemberDto ahzitMemberDto = ahzitBoardDao.searchMemberInfo(ahzitNo, loginId);
		// 조회한 정보를 model에 추가
		model.addAttribute("ahzitMemberDto", ahzitMemberDto);
		//개설한 아지트 정보를 조회
		model.addAttribute("ahzitVO", ahzitDao.selectOne(ahzitNo));
		// 편의를 위해 ahzitNo를 model에 추가
		model.addAttribute("ahzitNo", ahzitNo);
		// 소모임 일정 페이지(calendar.jsp)로 연결
		return "ahzit_in/calendar";
	}
	
	// 소모임 첨부 Mapping
	@GetMapping("/{ahzitNo}/attachment")
	public String attachment(@PathVariable int ahzitNo, HttpSession session, Model model) {
		// HttpSession에서 로그인 중인 회원 아이디 반환
		String loginId = (String)session.getAttribute("loginId");
		// 입력받은 소모임 번호와 반환한 회원 아이디로 로그인한 회원의 해당 소모임 내 회원 정보 조회
		AhzitMemberDto ahzitMemberDto = ahzitBoardDao.searchMemberInfo(ahzitNo, loginId);
		// 조회한 정보를 model에 추가
		model.addAttribute("ahzitMemberDto", ahzitMemberDto);
		
		//입력받은 아지트번호로 연결되는 첨부파일 조회
		model.addAttribute("attachmentList", attachmentDao.selectAhzitAttachment(ahzitNo));
		
		//첨부파일 목록 조회
		model.addAttribute("list", attachmentDao.selectList());
		
		//개설한 아지트 정보를 조회
		model.addAttribute("ahzitVO", ahzitDao.selectOne(ahzitNo));
		// 편의를 위해 ahzitNo를 model에 추가
		model.addAttribute("ahzitNo", ahzitNo);
		// 소모임 첨부파일 페이지(attachment.jsp)로 연결
		return "ahzit_in/attachment";
	}
	
	@PostMapping("/{ahzitNo}/attachment")
	public String upload(@RequestParam MultipartFile attachment, 
										@ModelAttribute AhzitDto ahzitDto ) throws IllegalStateException, IOException {
		//db저장
		int attachmentNo = attachmentDao.nextAttachmentNo();
		attachmentDao.insertAttachment(AttachmentDto.builder()
									.attachmentNo(attachmentNo)
									.attachmentName(attachment.getOriginalFilename())
									.attachmentType(attachment.getContentType())
									.attachmentSize(attachment.getSize())
								.build());
		
		//파일저장
		File directory = new File("D:/upload/kh10f/ahzit");
		directory.mkdirs();
		File target = new File(directory, String.valueOf(attachmentNo));
		attachment.transferTo(target);
		return "ahzit_in/attachment";
	}
	
	// 소모임 멤버 Mapping
	@GetMapping("/{ahzitNo}/member")
	public String member(@PathVariable int ahzitNo, HttpSession session, Model model) {
		// HttpSession에서 로그인 중인 회원 아이디 반환
		String loginId = (String)session.getAttribute("loginId");
		// 입력받은 소모임 번호와 반환한 회원 아이디로 로그인한 회원의 해당 소모임 내 회원 정보 조회
		AhzitMemberDto ahzitMemberDto = ahzitBoardDao.searchMemberInfo(ahzitNo, loginId);
		// 조회한 정보를 model에 추가
		model.addAttribute("ahzitMemberDto", ahzitMemberDto);
		//개설한 아지트 정보를 조회
		model.addAttribute("ahzitVO", ahzitDao.selectOne(ahzitNo));
		// 편의를 위해 ahzitNo를 model에 추가
		model.addAttribute("ahzitNo", ahzitNo);
		// 소모임 회원 관리 페이지(member.jsp)로 이동
		return "ahzit_in/member";
	}
}
