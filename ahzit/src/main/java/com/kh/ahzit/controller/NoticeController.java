package com.kh.ahzit.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.PostConstruct;
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

import com.kh.ahzit.constant.SessionConstant;
import com.kh.ahzit.entity.AttachmentDto;
import com.kh.ahzit.entity.NoticeDto;
import com.kh.ahzit.error.TargetNotFoundException;
import com.kh.ahzit.repository.AttachmentDao;
import com.kh.ahzit.repository.NoticeDao;
import com.kh.ahzit.vo.NoticeListSearchVO;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired
	private NoticeDao noticeDao;
	
	@Autowired
	private AttachmentDao attachmentDao;
	
	private final File directory = new File(System.getProperty("user.home")+"/upload/main");

	@PostConstruct//최초 실행시 딱 한 번만 실행되는 메소드
	public void prepare() {
		directory.mkdirs();
	}
	
	@GetMapping("/list")
	public String list(Model model,
			@ModelAttribute (name="vo") NoticeListSearchVO vo) {
		
		//페이지 네비게이터를 위한 게시글 수
		int count = noticeDao.count(vo);
		vo.setCount(count);
		
		model.addAttribute("list", noticeDao.selectList(vo));
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
		
//		(+추가) 게시글에 대한 첨부파일을 조회하여 첨부
		model.addAttribute("attachmentList", 
				attachmentDao.selectNoticeAttachmentList(noticeNo));
		
		
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
			@RequestParam List<MultipartFile> attachment,
			HttpSession session, RedirectAttributes attr) throws IllegalStateException, IOException{
		//session에 있는 회원 아이디를 작성자로 추가한 뒤 등록
		String memberId = (String)session.getAttribute(SessionConstant.ID);
		noticeDto.setNoticeWriter(memberId);
		
		//insert
		//noticeDao.insert(noticeDto);
		
		//등록 후 detail로 이동
		//return "redirect:list";
		
		//번호 생성 후 등록
		int noticeNo = noticeDao.insert2(noticeDto);
		
		//첨부파일
		for(MultipartFile file : attachment) {
			if(!file.isEmpty()) {
				System.out.println("첨부파일 발견");

				//DB 등록
				int attachmentNo = attachmentDao.nextAttachmentNo();
				attachmentDao.insertAttachment(AttachmentDto.builder()
									.attachmentNo(attachmentNo)
									.attachmentName(file.getOriginalFilename())
									.attachmentType(file.getContentType())
									.attachmentSize(file.getSize())
								.build());
				
				
				//파일 저장
				File target = new File(directory, String.valueOf(attachmentNo));
				//System.out.println(target.getAbsolutePath());
				file.transferTo(target);

				//+ 연결 테이블에 연결 정보를 저장(게시글번호, 첨부파일번호)
				noticeDao.connectAttachment(noticeNo, attachmentNo);
				
				//+@
			}
		}
		
		attr.addAttribute("noticeNo", noticeNo);
		return "redirect:detail";
	}

	
}
