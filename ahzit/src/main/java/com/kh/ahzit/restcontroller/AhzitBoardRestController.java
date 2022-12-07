package com.kh.ahzit.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.ahzit.entity.AhzitBoardDto;
import com.kh.ahzit.repository.AhzitBoardDao;
import com.kh.ahzit.vo.AhzitBoardVO;

@RestController
@RequestMapping("/rest_board")
public class AhzitBoardRestController {

	// 의존성 주입
	@Autowired
	private AhzitBoardDao ahzitBoardDao;
	
	// 소모임 게시글 등록 DB 처리 Mapping
	@PostMapping("/write")
	public void insert(@RequestBody AhzitBoardDto ahzitBoardDto) {
		ahzitBoardDao.insertBoard(ahzitBoardDto);
	}
	
	// 소모임 게시글 검색 조회 Mapping
	@GetMapping("/search")
	public List<AhzitBoardVO> selectList(@RequestParam int memberAhzitNo, @RequestParam String keyword) {
		return ahzitBoardDao.searchBoardList(memberAhzitNo, keyword);
	}
}
