package com.kh.ahzit.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.ahzit.repository.AhzitBoardReplyDao;
import com.kh.ahzit.vo.AhzitBoardReplyRestRequestVO;
import com.kh.ahzit.vo.AhzitBoardReplyRestResponseVO;

@RestController
@RequestMapping("/rest_reply")
public class AhzitBoardReplyRestController {

	// 의존성 주입
	@Autowired
	private AhzitBoardReplyDao ahzitBoardReplyDao;
	
	// 댓글 목록 조회 Mapping
	@PostMapping("/list")
	public List<AhzitBoardReplyRestResponseVO> selectList(@RequestBody AhzitBoardReplyRestRequestVO ahzitBoardReplyRestRequestVO) {
		
		return ahzitBoardReplyDao.selectReplyList(ahzitBoardReplyRestRequestVO);
	}
}
