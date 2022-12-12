package com.kh.ahzit.controller;

import java.io.File;
import java.io.IOException;

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
import com.kh.ahzit.entity.AhzitDto;
import com.kh.ahzit.entity.AhzitMemberDto;
import com.kh.ahzit.entity.AhzitUserDto;
import com.kh.ahzit.error.TargetNotFoundException;
import com.kh.ahzit.repository.AhzitDao;
import com.kh.ahzit.service.AhzitService;

@Controller
@RequestMapping("/ahzit")
public class AhzitController {
	
	@Autowired
	private AhzitDao ahzitDao;
	
	@Autowired
	private AhzitService ahzitService;
	
	private final File dir = new File("D:/upload/kh10f");
	
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
		AhzitUserDto userDto = ahzitDao.selectOne(ahzitLeader);

		ahzitDto.setAhzitLeader(ahzitLeader);
		//AhzitService에서 번호를 미리 생성 후 등록, 첨부파일 업로드(저장)까지 처리
		int ahzitNo = ahzitService.create(ahzitDto, ahzitMemberDto,  attachment, ahzitLeader);
	
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
    public String ahzitEdit(@RequestParam int ahzitNo, 
    										Model model
    									) {
    	model.addAttribute("ahzitDto", ahzitDao.selectOne(ahzitNo));
    	return "ahzit/edit";
    }
    
    @PostMapping("/edit")
    public String edit(@ModelAttribute AhzitDto ahzitDto,
    							  @RequestParam MultipartFile attachment
    							) {
    	boolean result = ahzitDao.update(ahzitDto);
    	if(result) {
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
	
}
