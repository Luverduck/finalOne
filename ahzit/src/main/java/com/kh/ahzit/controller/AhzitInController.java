package com.kh.ahzit.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;


import javax.annotation.PostConstruct;

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

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.kh.ahzit.constant.SessionConstant;
import com.kh.ahzit.entity.AhzitDto;
import com.kh.ahzit.entity.AhzitInAttachmentDto;
import com.kh.ahzit.entity.AhzitMemberDto;

import com.kh.ahzit.entity.AttachmentDto;
import com.kh.ahzit.error.TargetNotFoundException;
import com.kh.ahzit.repository.AhzitBoardDao;
import com.kh.ahzit.repository.AhzitDao;
import com.kh.ahzit.repository.AttachmentDao;

import com.kh.ahzit.entity.MemberAttachmentDto;
import com.kh.ahzit.error.TargetNotFoundException;
import com.kh.ahzit.repository.AhzitBoardDao;
import com.kh.ahzit.repository.AhzitDao;
import com.kh.ahzit.repository.AhzitMemberDao;
import com.kh.ahzit.repository.AttachmentDao;
import com.kh.ahzit.service.AhzitMemberService;


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
	
	@Autowired
	private AhzitMemberDao ahzitMemberDao;
	
	@Autowired
	private AhzitMemberService ahzitMemberService;
	
	@PostConstruct //최초 실행 시 딱 한번만 실행되는 메소드
	public void prepare() {
		dir.mkdirs();
	}

	private final File dir = new File("D:/upload/kh10f");
	
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
	public String attachment(@PathVariable int ahzitNo, @ModelAttribute AhzitInAttachmentDto ahzitInAttachmentDto, HttpSession session, Model model) {
		// HttpSession에서 로그인 중인 회원 아이디 반환
		String loginId = (String)session.getAttribute("loginId");
		// 입력받은 소모임 번호와 반환한 회원 아이디로 로그인한 회원의 해당 소모임 내 회원 정보 조회
		AhzitMemberDto ahzitMemberDto = ahzitBoardDao.searchMemberInfo(ahzitNo, loginId);
		// 조회한 정보를 model에 추가
		model.addAttribute("ahzitMemberDto", ahzitMemberDto);
		
		//입력받은 아지트번호로 연결되는 첨부파일 조회
		model.addAttribute("attachmentList", attachmentDao.selectAhzitAttachment(ahzitNo));
		
		//입력받은 아지트번호로 연결되는 첨부파일 조회(최근)
		model.addAttribute("InAttachmentList", attachmentDao.selectAhzitInAttachment(ahzitNo));
		
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
	public String upload(@PathVariable int ahzitNo, @RequestParam MultipartFile attachment, 
										@RequestParam int ahzitInMemberNo,
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
		
		//연결테이블에 연결정보저장(첨부파일번호, 아지트 내 회원 번호)
		attachmentDao.ahzitInAttachment(attachmentNo, ahzitInMemberNo);

		return "redirect:attachment";
	}

	@GetMapping("/{ahzitNo}/attachment/delete")
	public String delete(@PathVariable int ahzitNo, @RequestParam int attachmentNo, @RequestParam int memberAhzitNo) {
		
		// 연결 테이블에서 데이터 삭제
		attachmentDao.deleteAhzitInAttachment(attachmentNo, memberAhzitNo);
		
		// 첨부파일 테이블에서 데이터 삭제
		attachmentDao.deleteAttachment(attachmentNo);
		
		// 첨부파일 경로 설정
		File directory = new File("D:/upload/kh10f/ahzit");
		directory.mkdirs();
		File target = new File(directory, String.valueOf(attachmentNo));
		
		// 실제 첨부파일 삭제 - delete();
		target.delete();
		
		return  "redirect:/ahzit_in/"+ahzitNo+"attachment";
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
	
	//소모임 가입
	@GetMapping("/{ahzitNo}/insert")
	public String insert(@PathVariable int ahzitNo, HttpSession session, Model model) {
		// HttpSession에서 로그인 중인 회원 아이디 반환
		String loginId = (String)session.getAttribute("loginId");
		// 반환받은 회원 id를 model에 추가
		model.addAttribute("loginId",loginId);
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
		//소모임 가입 페이지로 model 전달, 이동
		return "ahzit_in/insert";
	}
	
	@ResponseBody
	@PostMapping("/{ahzitNo}/insert")
	public String insert(@PathVariable int ahzitNo, 
			@RequestParam MultipartFile attachment,
			@ModelAttribute AhzitMemberDto ahzitMemberDto, 
			HttpSession session, Model model) throws IllegalStateException, IOException {
		ahzitMemberService.insert(ahzitMemberDto, attachment);
		return "/ahzit_in/board";
	}
	
	@GetMapping("/{ahzitNo}/editMyInfo")
	public String editMyInfo(@PathVariable int ahzitNo, HttpSession session, Model model) {
		// HttpSession에서 로그인 중인 회원 아이디 반환
				String loginId = (String)session.getAttribute("loginId");
				// 반환받은 회원 id를 model에 추가
				model.addAttribute("loginId",loginId);
				// 입력받은 소모임 번호와 반환한 회원 아이디로 로그인한 회원의 해당 소모임 내 회원 정보 조회
				AhzitMemberDto ahzitMemberDto = ahzitBoardDao.searchMemberInfo(ahzitNo, loginId);
				// 조회한 정보를 model에 추가
				model.addAttribute("ahzitMemberDto", ahzitMemberDto);
				//개설한 아지트 정보를 조회
				model.addAttribute("ahzitVO", ahzitDao.selectOne(ahzitNo));

				
				//입력받은 아지트번호로 연결되는 첨부파일 조회
				model.addAttribute("attachmentList", attachmentDao.selectAhzitAttachment(ahzitNo));
				
				//입력받은 회원번호로 연결되는 첨부파일 조회
				model.addAttribute("memberAttachmentList", attachmentDao.selectAhzitMemberAttachment(ahzitMemberDto.getMemberNo()));

				// 편의를 위해 ahzitNo를 model에 추가
				model.addAttribute("ahzitNo", ahzitNo);
								
				//개인 프로필 수정 페이지로 model 전달, 이동
				return "ahzit_in/editMyInfo";
	}
	
	
	@PostMapping("/{ahzitNo}/editMyInfo")//가입한 아지트에서 사용하는 프로필 수정기능
	public String editMyInfo(@PathVariable int ahzitNo, 
			@ModelAttribute AhzitMemberDto ahzitMemberDto, 
			@RequestParam MultipartFile attachment,
			HttpSession session, Model model) throws IllegalStateException, IOException {
			boolean result=ahzitMemberDao.updateMember(ahzitMemberDto);
			ahzitMemberService.uploadProfile(ahzitMemberDto, attachment);
			if(result) {
				return "redirect:/ahzit_in/{ahzitNo}";
			}
			else {
				throw new TargetNotFoundException();
			}
	}

	@GetMapping("/{memberNo}/deleteCommonMember")//소모임 탈퇴기능
	public String deleteCommonMember(@PathVariable int memberNo, Model model, RedirectAttributes attr) {
		AhzitMemberDto findDto=ahzitMemberDao.findMember(memberNo);//회원고유번호로 ahzitMemberDto조회
		int ahzitNo=findDto.getMemberAhzitNo();//조회한 ahzitMemberDto에서 아지트 번호 반환
		boolean result=ahzitDao.deleteCommonMember(memberNo);
		if(result) {
			ahzitDao.updateAhzitHead2(ahzitNo);//탈퇴 성공시 ahzit_head 변경
			attr.addAttribute("ahzitNo",ahzitNo);
			return "redirect:/ahzit_in/{ahzitNo}";
		}
		else {
			throw new TargetNotFoundException();
		}
	}
}
