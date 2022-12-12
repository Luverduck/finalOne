package com.kh.ahzit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.ahzit.repository.AhzitBoardDao;
import com.kh.ahzit.repository.AhzitDao;
import com.kh.ahzit.vo.AhzitBoardVO;

@Controller
@RequestMapping("/detail")
public class AhzitDetailController {
	
	// 의존성 주입
	@Autowired
	private AhzitBoardDao ahzitBoardDao;
	
	@Autowired
	private AhzitDao ahzitDao;
	
	// 소모임 홈 화면 Mapping
	@GetMapping("/{ahzitNo}")
	public String home(@PathVariable int ahzitNo, Model model) {

		// 입력받은 소모임 번호로 해당 소모임 내 모든 게시글 조회
		List<AhzitBoardVO> ahzitBoardList = ahzitBoardDao.allBoardList(ahzitNo);
		// 조회한 정보를 model에 추가
		model.addAttribute("ahzitBoardList", ahzitBoardList);
		
		//개설한 아지트 정보를 조회
		model.addAttribute("ahzitVO", ahzitDao.selectOne(ahzitNo));

		// 편의를 위해 ahzitNo를 model에 추가
		model.addAttribute("ahzitNo", ahzitNo);
		// 소모임 홈 화면(notMember.jsp)로 연결
		return "detail/notMember";
	}
	
	// 소모임 사진첩 Mapping
	@GetMapping("/{ahzitNo}/album")
	public String album(@PathVariable int ahzitNo) {
		return "detail/album";
	}
	
	// 소모임 일정 Mapping
	@GetMapping("/{ahzitNo}/calendar")
	public String calander(@PathVariable int ahzitNo) {
		return "detail/calendar";
	}
	
	// 소모임 첨부 Mapping
	@GetMapping("/{ahzitNo}/attachment")
	public String attachment(@PathVariable int ahzitNo) {
		return "detail/attachment";
	}
	
	// 소모임 멤버 Mapping
	@GetMapping("/{ahzitNo}/member")
	public String member(@PathVariable int ahzitNo) {
		return "detail/member";
	}
}
