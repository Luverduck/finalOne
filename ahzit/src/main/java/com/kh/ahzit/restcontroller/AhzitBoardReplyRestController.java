package com.kh.ahzit.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	// 댓글 등록 Mapping
	@PostMapping("/write")
	public AhzitBoardReplyVO insertReply(@RequestBody AhzitBoardReplyRestRequestVO ahzitBoardReplyRestRequestVO) {
		// 다음 댓글 번호 반환
		int replyNo = ahzitBoardReplyDao.nextReplyNo();
		// ahzitBoardReplyRestRequestVO에 반환한 댓글 번호를 설정
		ahzitBoardReplyRestRequestVO.setReplyNo(replyNo);
		// 댓글 등록
		ahzitBoardReplyDao.insertReply(ahzitBoardReplyRestRequestVO);
		// 해당 게시글에 달린 댓글 수 반환
		int replyCount = ahzitBoardReplyDao.countReply(ahzitBoardReplyRestRequestVO.getBoardNo());
		AhzitBoardReplyVO ahzitBoardReplyVO =  ahzitBoardReplyDao.selectReply(replyNo);
		ahzitBoardReplyVO.setReplyCount(replyCount);
		// 등록한 댓글 정보를 조회하여 반환
		return ahzitBoardReplyVO;
	}
	
	// 댓글 목록 조회 Mapping
	@PostMapping("/list")
	public AhzitBoardReplyRestResponseVO selectReplyList(@RequestBody AhzitBoardReplyRestRequestVO ahzitBoardReplyRestRequestVO) {
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
		// 댓글의 총 수 반환 (더보기 생성 제한을 위함)
		ahzitBoardReplyRestResponseVO.setReplyCount(replyCount);
		// REST 응답 반환
		return ahzitBoardReplyRestResponseVO;
	}
	
	// 댓글 수정 Mapping
	@PutMapping("/edit")
	public boolean editReply(@RequestBody AhzitBoardReplyRestRequestVO ahzitBoardReplyRestRequestVO) {
		return ahzitBoardReplyDao.editReply(ahzitBoardReplyRestRequestVO);
	}
	
	// 댓글 삭제 Mapping
	@DeleteMapping("/delete")
	public boolean deleteReply(@RequestParam int replyNo) {
		return ahzitBoardReplyDao.deleteReply(replyNo);
	}
}
