package com.kh.ahzit.controller;

import java.io.File;
import java.io.IOException;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ahzit.constant.SessionConstant;
import com.kh.ahzit.entity.AttachmentDto;
import com.kh.ahzit.entity.FreeboardReplyDto;
import com.kh.ahzit.entity.InquireDto;
import com.kh.ahzit.entity.InquireReplyDto;
import com.kh.ahzit.error.TargetNotFoundException;
import com.kh.ahzit.repository.AttachmentDao;
import com.kh.ahzit.repository.InquireDao;
import com.kh.ahzit.repository.InquireReplyDao;
import com.kh.ahzit.vo.InquireListSearchVO;
import com.kh.ahzit.vo.InquireReplyListSearchVO;

@Controller
@RequestMapping("/inquire")
public class InquireController {
	
	@Autowired
	private AttachmentDao attachmentDao;
	
	@Autowired
	private InquireDao inquireDao;
	
	@Autowired
	private InquireReplyDao inquireReplyDao;
	
	
	private final File directory = new File("D:/upload/kh10f/inquireAttachment");
	
	// 1:1 문의 등록
	@GetMapping("/insert")
	public String insert() {
		return "inquire/insert";
	}
	@PostMapping("/insert")
	public String insert(HttpSession session,@ModelAttribute InquireDto inquireDto, 
			RedirectAttributes attr, List<MultipartFile> inquireAttachment) throws IllegalStateException, IOException {
		int inquireNo = inquireDao.sequence();
		inquireDto.setInquireNo(inquireNo);
		String loginId = (String) session.getAttribute(SessionConstant.ID);
		inquireDto.setInquireId(loginId);
		inquireDao.insert(inquireDto);
		
		if(!inquireAttachment.get(0).isEmpty()) { // 첨부파일이 비어있지않으면 파일 선택 후 같이 등록, 없으면 첨부파일 등록은 제외 
			// 첨부파일에 대한 처리
			for(MultipartFile file : inquireAttachment) {
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
				directory.mkdirs();
				// 첨부파일 저장 하위경로 설정
				File target = new File(directory, String.valueOf(attachmentNo));
				// 첨부파일 전송
				file.transferTo(target);
				// 자유 게시글 첨부파일 등록 DB 처리
				attachmentDao.insertInquireAttachment(inquireNo, attachmentNo);
				}
			}
		attr.addAttribute("inquireNo", inquireNo);
		return "redirect:detail";
	}
	
	// 문의 상세
	@GetMapping("/detail")
	public String detail(Model model, @RequestParam int inquireNo,HttpSession session,
			@ModelAttribute InquireReplyListSearchVO inquireReplyListSearchVO) {
		InquireDto inquireDto = inquireDao.detail(inquireNo);
		model.addAttribute("inquireDto", inquireDto);
		
		// 입력받은 inquireNo 번호로 해당 번호에 연결된 첨부파일 조회
		List<AttachmentDto> attachmentList = attachmentDao.selectInquireAttachment(inquireNo);
		// 조회 결과를 model에 추가
		model.addAttribute("attachmentList", attachmentList);
		
		// 입력받은 게시글 번호로 해당 게시글에 달린 댓글의 총 수 반환
		int count = inquireReplyDao.countInquireReply(inquireNo);
		// 반환한 댓글의 총 수를 inquireReplyListSearchVO의 count로 설정
		inquireReplyListSearchVO.setCount(count);
		// 입력받은 게시글 번호로 해당 번호와 연결된 댓글 조회
		List<InquireReplyDto> inquireReplyList = inquireReplyDao.selectInquireReply(inquireNo, inquireReplyListSearchVO);
		// 로그인 중인 회원의 회원 아이디 반환
		String loginId = (String)session.getAttribute("loginId");
		String loginGrade = (String)session.getAttribute("loginGrade");
		// 조회 결과를 model에 추가
		model.addAttribute("inquireReplyList", inquireReplyList);
		
		return "inquire/detail";
	}
	
	// 문의 목록
	@GetMapping("/list")	
	public String list(Model model, HttpSession session
			,@ModelAttribute InquireListSearchVO inquireListSearchVO) {
		
		String loginId = (String) session.getAttribute(SessionConstant.ID);
		
		
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
	public String edit(@ModelAttribute InquireDto inquireDto,
			List<MultipartFile> inquireAttachment, RedirectAttributes attr) throws Exception {
		boolean result = inquireDao.edit(inquireDto);
		
		if(result) {
			// 첨부파일에 대한 처리
			if(!inquireAttachment.get(0).isEmpty()) { // 첨부파일 변화가 있다면
				// 기존 첨부파일 조회
				List<AttachmentDto> attachmentList = attachmentDao.selectInquireAttachment(inquireDto.getInquireNo());
				// ** 이상하게 null도 하나의 원소 취급을 하는 것 같다
				if(attachmentList.get(0) != null) { // 기존 첨부파일이 있다면
					// 기존 첨부파일 삭제
					for(AttachmentDto attachmentDto : attachmentList) {
						// attachmentDto에서 첨부파일 번호를 반환
						int attachmentNo = attachmentDto.getAttachmentNo();
						// 첨부파일 정보 삭제
						attachmentDao.deleteAttachment(attachmentNo);
						//  첨부파일 정보 삭제
						attachmentDao.deleteInquireAttachment(attachmentNo);
						// 삭제할 첨부파일명 반환
						String fileName = String.valueOf(attachmentDto.getAttachmentNo());
						// 삭제할 첨부파일 경로 설정
						File target = new File(directory, fileName);
						// 첨부파일 삭제
						target.delete();
					}
				}
				// 첨부파일 재등록
				// 게시글 원본 번호 반환
				int inquireNo = inquireDto.getInquireNo();
				// 새로 입력된 첨부파일에 대한 처리
				for(MultipartFile file : inquireAttachment) {
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
					directory.mkdirs();
					// 첨부파일 저장 하위경로 설정
					File target = new File(directory, String.valueOf(attachmentNo));
					// 첨부파일 전송
					file.transferTo(target);
					// 자유 게시글 첨부파일 등록 DB 처리
					attachmentDao.insertInquireAttachment(inquireNo, attachmentNo);
				}
			}
			
			
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