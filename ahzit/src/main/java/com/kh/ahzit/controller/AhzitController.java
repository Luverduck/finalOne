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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ahzit.constant.SessionConstant;
import com.kh.ahzit.entity.AhzitAttachmentDto;
import com.kh.ahzit.entity.AhzitDto;
import com.kh.ahzit.entity.AhzitMemberDto;
import com.kh.ahzit.entity.AhzitUserDto;
import com.kh.ahzit.entity.AttachmentDto;
import com.kh.ahzit.error.TargetNotFoundException;
import com.kh.ahzit.repository.AhzitDao;
import com.kh.ahzit.repository.AttachmentDao;
import com.kh.ahzit.service.AhzitService;

@Controller
@RequestMapping("/ahzit")
public class AhzitController {
	
	@Autowired
	private AhzitDao ahzitDao;
	
	@Autowired
	private AttachmentDao attachmentDao;
	
	@Autowired
	private AhzitService ahzitService;
	
	
	private final File dir = new File("D:/upload/kh10f");
	//private final File dir = new File(System.getProperty("user.home")+"/upload/kh10f");

	
	
	@PostConstruct //최초 실행 시 딱 한번만 실행되는 메소드
	public void prepare() {
		dir.mkdirs();
	}
	
	@GetMapping("/create")
	public String create() {
		return "ahzit/create";
	}
	
	@PostMapping("/create")
	private String create(
			@ModelAttribute AhzitDto ahzitDto,
			@ModelAttribute AhzitUserDto ahzitUserDto,
			@ModelAttribute AhzitMemberDto ahzitMemberDto,
			@RequestParam MultipartFile attachment,
			RedirectAttributes attr,
			HttpSession session) throws IllegalStateException, IOException {
		String ahzitLeader = (String)session.getAttribute("loginId");

		ahzitDto.setAhzitLeader(ahzitLeader);
		//AhzitService에서 번호를 미리 생성 후 등록, 첨부파일 업로드(저장)까지 처리
		int ahzitNo = ahzitService.create(ahzitDto, ahzitMemberDto,  attachment, ahzitLeader);
		
	System.out.println();
	
	
		return "redirect:/ahzit_in/" + ahzitNo;
	}
	
	//소모임 가입
	@GetMapping("/insert")
	public String insert() {
		return "ahzit/insert";
	}
	
	@PostMapping("/insert")
	public String insert(
			@ModelAttribute AhzitMemberDto ahzitMemberDto,
			HttpSession session,
			RedirectAttributes attr			
			) {
		attr.addAttribute("ahzitNo", ahzitMemberDto.getMemberAhzitNo());
		String userId = (String) session.getAttribute(SessionConstant.ID);
		ahzitMemberDto.setMemberId(userId);
		ahzitDao.insertMember(ahzitMemberDto);
		
		int ahzitNo = ahzitMemberDto.getMemberAhzitNo();		
		
		//소모임가입자 증가 메소드
		ahzitDao.updateAhzitPerson(ahzitMemberDto.getMemberAhzitNo());
		return "redirect:/ahzit_in/" + ahzitNo;
	}
	
    //소모임 관리 페이지(수정)
    @GetMapping("/edit")
    public String ahzitEdit(@RequestParam int ahzitNo, Model model) {
    	model.addAttribute("ahzitDto", ahzitDao.selectOne(ahzitNo));
    	System.out.println(ahzitDao.selectOne(ahzitNo));
//    	//입력받은 아지트번호로 연결되는 첨부파일 조회
//		model.addAttribute("attachmentList", attachmentDao.selectAhzitAttachment(ahzitNo));
    	return "ahzit/edit";
    }
    
    @PostMapping("/edit")
    public String edit(@ModelAttribute AhzitDto ahzitDto, List<MultipartFile> ahzitAttachment, RedirectAttributes attr) throws Exception {
    	boolean result = ahzitDao.update(ahzitDto);
    	if(result) {
    		// 첨부파일에 대한 처리
    		//System.out.println(ahzitAttachment.get(0));
    		if(!ahzitAttachment.get(0).isEmpty()) { // 첨부파일 변화가 있다면
			// 기존 첨부파일 조회
			List<AttachmentDto> attachmentList = attachmentDao.selectAhzitAttachment(ahzitDto.getAhzitNo());
			// ** 이상하게 null도 하나의 원소 취급을 하는 것 같다
			if(attachmentList.get(0) != null) { // 기존 첨부파일이 있다면
				// 기존 첨부파일 삭제
				for(AttachmentDto attachmentDto : attachmentList) {
					// attachmentDto에서 첨부파일 번호를 반환
					int attachmentNo = attachmentDto.getAttachmentNo();
					// 첨부파일 정보 삭제
					attachmentDao.deleteAttachment(attachmentNo);
					//  첨부파일 정보 삭제
					attachmentDao.deleteAhzitAttachment(attachmentNo);
					// 삭제할 첨부파일명 반환
					String fileName = String.valueOf(attachmentDto.getAttachmentNo());
					// 삭제할 첨부파일 경로 설정
					File target = new File(dir, fileName);
					// 첨부파일 삭제
					target.delete();
					}
				}
				// 첨부파일 재등록
				// 게시글 원본 번호 반환
				int ahzitNo = ahzitDto.getAhzitNo();
				// 새로 입력된 첨부파일에 대한 처리
				for(MultipartFile file : ahzitAttachment) {
					// 다음 첨부파일 번호 반환
					int attachmentNo = attachmentDao.nextAttachmentNo();
					// 첨부파일 등록 DB 처리
					attachmentDao.insertAttachment(AttachmentDto.builder()
								.attachmentNo(attachmentNo)
								.attachmentName(file.getOriginalFilename())
								.attachmentType(file.getContentType())
								.attachmentSize(file.getSize())
							.build());
					// 디렉토리 생성
					dir.mkdirs();
					// 첨부파일 저장 하위경로 설정
					File target = new File(dir, String.valueOf(attachmentNo));
					// 첨부파일 전송
					file.transferTo(target);
					// 자유 게시글 첨부파일 등록 DB 처리
					attachmentDao.ahzitAttachment(ahzitNo, attachmentNo);
				}
			}
    		
    		return "redirect:/ahzit_in/" +ahzitDto.getAhzitNo();
    	}
    	else {//실패했다면 오류 발생
    		throw new TargetNotFoundException();
    	}
    			
    }
	
    //소모임 회원 관리페이지
    @GetMapping("/member/management")
    public String ahzitMemberManagement(
          @RequestParam int AhzitNo, Model model
          ) {
      return "ahzit/detail_member_management";
	}
    
    //소모임 삭제
    //소모임 관리페이지(수정) 안에서 삭제 가능
    @GetMapping("/delete")
    public String delete(@RequestParam int ahzitNo) {
    	boolean result = ahzitDao.delete(ahzitNo);
    	if(result) {
    		return "redirect:/";
    	}
    	else { //소모임 삭제 취소하면 제자리
    		return "redirect:/ahzit_in/" +ahzitNo;
    	}
    }
    
    // 소모임 홈 화면 Mapping
 	@GetMapping("/detail/{ahzitNo}")
 	public String home(@PathVariable int ahzitNo, Model model, HttpSession session) {
 		// 소모임 정보를 조회
	 	model.addAttribute("ahzitVO", ahzitDao.selectOne(ahzitNo));	
 		// HttpSession에서 로그인 중인 회원 아이디 반환
		String userId = (String)session.getAttribute("loginId");
		// 내가 가입한 소모임인지 반환
		boolean isMember = ahzitDao.alreadyJoin(userId, ahzitNo) == 1;
		if(isMember) { // 회원이라면
			//입력받은 아지트번호로 연결되는 첨부파일 조회
		 	model.addAttribute("attachmentList", attachmentDao.selectAhzitAttachment(ahzitNo));
		 	// 소모임 홈 Mapping으로 강제 이동
		 	return "redirect:/ahzit_in/" + ahzitNo;
		}
	 	// 편의를 위해 ahzitNo를 model에 추가
	 	model.addAttribute("ahzitNo", ahzitNo);
	 	// 소모임 상세 페이지(board.jsp)로 연결	
	 	return "ahzit/detail";
 	}
}
