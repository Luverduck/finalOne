package com.kh.ahzit.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.ahzit.repository.AhzitDao;
import com.kh.ahzit.vo.AhzitSearchListRequestVO;
import com.kh.ahzit.vo.AhzitSearchListResponseVO;
import com.kh.ahzit.vo.AhzitSearchListRestResponseVO;

@RestController
@RequestMapping("/rest_ahzit")
public class AhzitRestController {

	// 의존성 주입
	@Autowired
	private AhzitDao ahzitDao;
	
	// 찾기 페이지에서 소모임 조회
	@GetMapping("/search")
	public AhzitSearchListRestResponseVO searchAhzit(@RequestParam(required=false) String keyword, @RequestParam int cntRow, @RequestParam int p){
		// 반환 VO 생성
		AhzitSearchListRestResponseVO ahzitSearchListRestResponseVO = new AhzitSearchListRestResponseVO();
		// 요청 VO 생성
		AhzitSearchListRequestVO ahzitSearchListRequestVO = new AhzitSearchListRequestVO();
		ahzitSearchListRequestVO.setP(p);
		ahzitSearchListRequestVO.setCntRow(cntRow);
		
		List<AhzitSearchListResponseVO> ahzitInfoList;
		if(keyword != null) {
			ahzitSearchListRequestVO.setKeyword(keyword);
			int total = ahzitDao.searchMemberCount(p, keyword);
			ahzitSearchListRestResponseVO.setInfoCount(total);
			ahzitInfoList = ahzitDao.allSortAhzit(ahzitSearchListRequestVO);
		} else {
			int total = ahzitDao.allMemberCount(p);
			ahzitSearchListRestResponseVO.setInfoCount(total);
			ahzitInfoList = ahzitDao.searchSortAhzit(ahzitSearchListRequestVO);
		}
		// 반환 VO에 조회 결과를 설정
		ahzitSearchListRestResponseVO.setAhzitInfoList(ahzitInfoList);
		// 반환 VO에 조회한 총 소모임의 마지막 페이지 블럭 설정
		ahzitSearchListRestResponseVO.setPLast(ahzitSearchListRequestVO.blockLast());		
		// 설정된 반환 VO를 반환
		return ahzitSearchListRestResponseVO;
	}
}
