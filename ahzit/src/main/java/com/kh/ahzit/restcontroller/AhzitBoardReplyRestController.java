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
import com.kh.ahzit.vo.AhzitBoardReplyVO;

@RestController
@RequestMapping("/rest_reply")
public class AhzitBoardReplyRestController {

	// 의존성 주입
	@Autowired
	private AhzitBoardReplyDao ahzitBoardReplyDao;
	
	// 댓글 목록 조회 Mapping
	@PostMapping("/list")
	public AhzitBoardReplyRestResponseVO selectList(@RequestBody AhzitBoardReplyRestRequestVO ahzitBoardReplyRestRequestVO) {
		// REST 응답 VO 생성
		AhzitBoardReplyRestResponseVO ahzitBoardReplyRestResponseVO = new AhzitBoardReplyRestResponseVO();
		// 게시글에 달린 댓글 갯수 반환
		int replyCount = ahzitBoardReplyDao.countReply(ahzitBoardReplyRestRequestVO.getBoardNo());
		// 게시글 내 댓글의 마지막 페이지 번호
		ahzitBoardReplyRestRequestVO.setTotal(replyCount);
		int rpLast = ahzitBoardReplyRestRequestVO.blockLast();
		// 반환한 댓글 마지막 페이지 번호를 REST 응답에 설정
		ahzitBoardReplyRestResponseVO.setRpLast(rpLast);
		// 특정 게시글 내 모든 댓글 목록 반환
		List<AhzitBoardReplyVO> replyList = ahzitBoardReplyDao.selectReplyList(ahzitBoardReplyRestRequestVO);
		// 조회한 댓글 목록을 REST 응답에 설정
		ahzitBoardReplyRestResponseVO.setReplyList(replyList);
		// REST 응답 반환
		return ahzitBoardReplyRestResponseVO;
	}
}
