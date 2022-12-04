package com.kh.ahzit.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ahzit.entity.AttachmentDto;
import com.kh.ahzit.entity.FreeboardDto;
import com.kh.ahzit.repository.AttachmentDao;
import com.kh.ahzit.repository.FreeboardDao;
import com.kh.ahzit.vo.FreeboardListSeachVO;

@Controller // 자유 게시판에 대한 Controller
@RequestMapping("/freeboard")
public class FreeboardController {

	// 의존성 주입
	@Autowired
	private FreeboardDao freeboardDao;
	
	// 의존성 주입
	@Autowired
	private AttachmentDao attachmentDao;
	
	// 첨부파일 업로드 상위경로 설정
	private final File directory = new File("D:/upload/kh10f/freeboardAttachment");
	
	// 게시글 등록 페이지 Mapping
	@GetMapping("/write")
	public String writeFreeboard() {
		// 게시글 작성 페이지(write.jsp)로 연결
		return "freeboard/write";
	}
	
	// 게시글 등록 DB 처리 Mapping
	@PostMapping("/write")
	public String writeFreeboard(HttpSession session, @ModelAttribute FreeboardDto freeboardDto, List<MultipartFile> freeboardAttachment, RedirectAttributes attr) throws IllegalStateException, IOException {
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
		
		// 첨부파일에 대한 처리
		for(MultipartFile file : freeboardAttachment) {
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
			attachmentDao.insertFreeboardAttachment(freeboardNo, attachmentNo);
		}
		
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
	public String detailFreeboard(HttpServletRequest request, HttpServletResponse response, Model model, @RequestParam int freeboardNo) {
		// 조회수 중복 증가 방지 처리
		// HttpServletRequest에서 기존에 저장되어있는 전체 Cookie 반환
		Cookie[] cookies = request.getCookies();
		// 이미 읽은 게시물인지 판정하는 변수
		boolean judge = false;
		// Cookie 배열에 해당 게시글 번호에 대한 Cookie가 저장되어있는지 확인
		for(int i = 0 ; i < cookies.length ; i ++) {
			// Cookie의 i번째 배열 값의 이름 중 freeboard+{해당 게시글 번호}이 있으면
			if(cookies[i].getName().equals("freeboardNo"+freeboardNo)) {
				judge = true; // 판정 결과를 true로 변경 (이미 읽은 게시물임)
			}
		}
		// 한 번도 읽지 않은 게시물일 경우
		if(!judge) {
			// 조회수 증가
			freeboardDao.updateFreeboardRead(freeboardNo);
			// 입력받은 게시글 번호를 이용하여 새로운 Cookie 생성
			Cookie cookie = new Cookie("freeboardNo"+freeboardNo, "freeboardNo"+freeboardNo);
			// 생성한 Cookie를 HttpServletResponse에 추가
			response.addCookie(cookie);
		}
		// 입력받은 자유게시글 번호로 단일 조회
		FreeboardDto freeboardDto = freeboardDao.detailFreeboard(freeboardNo);
		// 조회 결과를 model에 추가
		model.addAttribute("freeboardDto", freeboardDto);
		// 게시글 상세 페이지(detail.jsp)로 연결
		return "freeboard/detail";
	}
	
	// 게시글 수정 페이지 Mapping
	@GetMapping("/edit")
	public String editFreeboard(Model model, @RequestParam int freeboardNo) {
		// 입력받은 자유게시글 번호로 단일 조회
		FreeboardDto freeboardDto = freeboardDao.detailFreeboard(freeboardNo);
		// 조회 결과를 model에 추가
		model.addAttribute("freeboardDto", freeboardDto);
		// 입력받은 자유게시글 번호로 해당 번호에 연결된 첨부파일 조회
		List<AttachmentDto> attachmentList = attachmentDao.selectFreeboardAttachment(freeboardNo);
		// 조회 결과를 model에 추가
		model.addAttribute("attachmentList", attachmentList);
		// 게시글 수정 페이지(edit.jsp)로 연결
		return "freeboard/edit";
	}
	
	// 게시글 수정 DB 처리 Mapping
	@PostMapping("/edit")
	public String editFreeboard(@ModelAttribute FreeboardDto freeboardDto, List<MultipartFile> freeboardAttachment, RedirectAttributes attr) throws Exception {
		// 입력받은 freeboardDto로 게시글 수정 처리 후 결과 반환
		boolean isEditted = freeboardDao.updateFreeboard(freeboardDto);		
		// 수정 성공 여부에 따라 서로 다른 처리
		if(isEditted) { // 수정 성공시
			
			// ** 게시글 수정시 첨부파일을 수정하려면 기존 첨부파일 정보를 모두 지우고 새로 첨부파일을 등록해야함
			// 문제는 첨부파일을 수정하지 않으려고 할 때 첨부파일에 아무것도 입력하지 않으면 NullPointException 발생
			// List<MultipartFile>에 대하여 isEmpty()의 결과는 false이며 List에는 length()가 없어서 null에 대한 판별을 할 수가 없었음
			// - (해결) List<MultipartFile>의 첫 번째 원소에 대해 isEmpty()의 결과는 true가 나옴 -> 판정 기준
//			System.out.println("비었나 "+freeboardAttachment.isEmpty());
//			for(MultipartFile file : freeboardAttachment) {
//				System.out.println("bytes "+file.getBytes());
//				System.out.println("contenttype"+file.getContentType());
//				System.out.println("inputstream "+file.getInputStream());
//				System.out.println("name "+file.getName());
//				System.out.println("originalname "+file.getOriginalFilename());
//				System.out.println("resource "+file.getResource());
//				System.out.println("size "+file.getSize());
//				System.out.println("isempty "+file.isEmpty());
//			}
			
			// 첨부파일에 대한 처리
			if(!freeboardAttachment.get(0).isEmpty()) { // 첨부파일 변화가 있다면
				// 기존 첨부파일 조회
				List<AttachmentDto> attachmentList = attachmentDao.selectFreeboardAttachment(freeboardDto.getFreeboardNo());
				// ** 이상하게 null도 하나의 원소 취급을 하는 것 같다
				if(attachmentList.get(0) != null) { // 기존 첨부파일이 있다면
					// 기존 첨부파일 삭제
					for(AttachmentDto attachmentDto : attachmentList) {
						// attachmentDto에서 첨부파일 번호를 반환
						int attachmentNo = attachmentDto.getAttachmentNo();
						// 첨부파일 정보 삭제
						attachmentDao.deleteAttachment(attachmentNo);
						// 자유게시판 첨부파일 정보 삭제
						attachmentDao.deleteFreeboardAttachment(attachmentNo);
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
				int freeboardNo = freeboardDto.getFreeboardNo();
				// 새로 입력된 첨부파일에 대한 처리
				for(MultipartFile file : freeboardAttachment) {
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
					attachmentDao.insertFreeboardAttachment(freeboardNo, attachmentNo);
				}
			}
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
	
	// 게시글 삭제 Mapping
	@GetMapping("/delete")
	public String deleteFreeboard(@RequestParam int freeboardNo) throws Exception {
		// 입력받은 자유게시글 번호로 게시글 삭제 메소드 실행 후 결과 반환
		boolean isdeleted = freeboardDao.deleteFreeboard(freeboardNo);
		// 삭제 성공 여부에 따라 서로 다른 처리
		if(isdeleted) {
			// 기존 첨부파일 조회
			List<AttachmentDto> attachmentList = attachmentDao.selectFreeboardAttachment(freeboardNo);
			// 기존 첨부파일에 대한 처리
			if(attachmentList.get(0) != null) { // 기존 첨부파일이 있다면
				// 기존 첨부파일 삭제
				for(AttachmentDto attachmentDto : attachmentList) {
					// attachmentDto에서 첨부파일 번호를 반환
					int attachmentNo = attachmentDto.getAttachmentNo();
					// 첨부파일 정보 삭제
					attachmentDao.deleteAttachment(attachmentNo);
					// 자유게시판 첨부파일 정보 삭제
					attachmentDao.deleteFreeboardAttachment(attachmentNo);
					// 삭제할 첨부파일명 반환
					String fileName = String.valueOf(attachmentDto.getAttachmentNo());
					// 삭제할 첨부파일 경로 설정
					File target = new File(directory, fileName);
					// 첨부파일 삭제
					target.delete();
				}
			}
			// 게시글 목록 Mapping으로 강제 이동
			return "redirect:list";
		}
		else { // 비활성화 실패시 
			throw new Exception(); // 오류 발생
		}
	}
}
