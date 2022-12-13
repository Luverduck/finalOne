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

import com.kh.ahzit.entity.AhzitBoardDto;
import com.kh.ahzit.repository.AhzitBoardDao;
import com.kh.ahzit.repository.AhzitBoardLikeDao;
import com.kh.ahzit.vo.AhzitBoardLikeRestVO;
import com.kh.ahzit.vo.AhzitBoardListRestRequestVO;
import com.kh.ahzit.vo.AhzitBoardListRestResponseVO;
import com.kh.ahzit.vo.AhzitBoardVO;

@RestController
@RequestMapping("/rest_board")
public class AhzitBoardRestController {

	// 의존성 주입
	@Autowired
	private AhzitBoardDao ahzitBoardDao;
	
	// 의존성 주입
	@Autowired
	private AhzitBoardLikeDao ahzitBoardLikeDao;
	
	// 소모임 게시글 등록 DB 처리 Mapping
	@PostMapping("/write")
	public AhzitBoardVO insertBoard(@RequestBody AhzitBoardListRestRequestVO ahzitBoardListRestRequestVO) {
		// 다음 게시글 번호 반환
		int boardNo = ahzitBoardDao.nextBoardNo();
		// 입력받은 DTO의 boardNo를 반환한 게시글 번호로 설정
		AhzitBoardDto ahzitBoardDto = AhzitBoardDto.builder()
				.boardNo(boardNo)
				.boardAhzitNo(ahzitBoardListRestRequestVO.getAhzitNo())
				.boardWriterNo(ahzitBoardListRestRequestVO.getMemberNo())
				.boardContent(ahzitBoardListRestRequestVO.getBoardContent())
				.build();
		// 게시글 등록 실행
		ahzitBoardDao.insertBoard(ahzitBoardDto);
		// 등록한 게시글 조회
		AhzitBoardVO ahzitBoardVO = ahzitBoardDao.selectInsertBoard(boardNo, ahzitBoardListRestRequestVO);
		// 조회 정보 반환 
		return ahzitBoardVO;
	}
	
	// 소모임 게시글 목록 Mapping
	@PostMapping("/list")
	public AhzitBoardListRestResponseVO allList(@RequestBody AhzitBoardListRestRequestVO ahzitBoardListRestRequestVO) {
		// 소모임 내 모든 게시글 리스트
		List<AhzitBoardVO> boardList = ahzitBoardDao.allBoardList(ahzitBoardListRestRequestVO);
		// 반환용 VO 생성
		AhzitBoardListRestResponseVO ahzitBoardListRestResponseVO = new AhzitBoardListRestResponseVO();
		ahzitBoardListRestResponseVO.setBoardList(boardList);
		// 소모임 내 특정 게시글의 댓글 갯수
		return ahzitBoardListRestResponseVO;
	}
	
	// 소모임 게시글 조회 Mapping
	@PostMapping("/search")
	public AhzitBoardListRestResponseVO selectList(@RequestBody AhzitBoardListRestRequestVO ahzitBoardListRestRequestVO) {
		// 소모임 내 모든 게시글 리스트
		List<AhzitBoardVO> boardList = ahzitBoardDao.selectBoardList(ahzitBoardListRestRequestVO);
		// 반환용 VO 생성
		AhzitBoardListRestResponseVO ahzitBoardListRestResponseVO = new AhzitBoardListRestResponseVO();
		ahzitBoardListRestResponseVO.setBoardList(boardList);
		// 소모임 내 특정 게시글의 댓글 갯수
		return ahzitBoardListRestResponseVO;
	}
	
	// 소모임 게시글 수정 DB 처리 Mapping
	@PutMapping("/edit")
	public boolean updateBoard(@RequestBody AhzitBoardDto ahzitBoardDto) {
		return ahzitBoardDao.editBoard(ahzitBoardDto);
	}
	
	// 소모임 게시글 삭제 DB 처리 Mapping
	@DeleteMapping("/delete")
	public boolean deleteBoard(@RequestParam int boardNo, @RequestParam int boardWriterNo) {
		return ahzitBoardDao.deleteBoard(boardNo, boardWriterNo);
	}
	
	// 소모임 게시글 좋아요 / 좋아요 취소 DB 처리 Mapping
	@PostMapping("/is_like")
	public AhzitBoardLikeRestVO isLike(@RequestBody AhzitBoardLikeRestVO ahzitBoardLikeRestVO) {
		// 좋아요 여부(좋아요가 1인지)에 따라 다른 처리
		if(ahzitBoardLikeRestVO.getIsLike() == 1) { // 좋아요 한 경우라면
			// 좋아요 삭제
			ahzitBoardLikeDao.boardLikeDelete(ahzitBoardLikeRestVO.getBoardNo(), ahzitBoardLikeRestVO.getMemberNo());
			// 좋아요 갯수 조회
			int boardLike = ahzitBoardLikeDao.boardLikeCount(ahzitBoardLikeRestVO.getBoardNo());
			// 좋아요 갯수 갱신
			ahzitBoardDao.updateBoardLike(ahzitBoardLikeRestVO.getBoardNo(), boardLike);
			// ahzitBoardLikeRestVO의 boardLike 필드에 반환한 좋아요 갯수를 설정
			ahzitBoardLikeRestVO.setBoardLike(boardLike);
			// ahzitBoardLikeRestVO의 isLike 필드에 0을 설정(좋아요 취소)
			ahzitBoardLikeRestVO.setIsLike(0);
			// 설정이 끝난 ahzitBoardLikeRestVO 반환
			return ahzitBoardLikeRestVO;
		}
		else { // 좋아요 하지 않은 경우라면
			// 좋아요 등록
			ahzitBoardLikeDao.boardLikeInsert(ahzitBoardLikeRestVO.getBoardNo(), ahzitBoardLikeRestVO.getMemberNo());
			// 좋아요 갯수 조회
			int boardLike = ahzitBoardLikeDao.boardLikeCount(ahzitBoardLikeRestVO.getBoardNo());
			// 좋아요 갯수 갱신
			ahzitBoardDao.updateBoardLike(ahzitBoardLikeRestVO.getBoardNo(), boardLike);
			// ahzitBoardLikeRestVO의 boardLike 필드에 반환한 좋아요 갯수를 설정
			ahzitBoardLikeRestVO.setBoardLike(boardLike);
			// ahzitBoardLikeRestVO의 isLike 필드에 1을 설정(좋아요 등록)
			ahzitBoardLikeRestVO.setIsLike(1);
		}
		// 설정이 끝난 ahzitBoardLikeRestVO 반환
		return ahzitBoardLikeRestVO;
	}
}
