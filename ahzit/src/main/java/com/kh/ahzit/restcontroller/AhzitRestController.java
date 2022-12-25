package com.kh.ahzit.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	public AhzitSearchListRestResponseVO searchAhzit(@ModelAttribute AhzitSearchListRequestVO ahzitSearchListRequestVO){
		// 반환 VO 생성
		AhzitSearchListRestResponseVO ahzitSearchListRestResponseVO = new AhzitSearchListRestResponseVO();
		// 전체 조회 / 카테고리 조회 종류에 따른 총 갯수 반환
		int total = ahzitDao.countSelectAhzit(ahzitSearchListRequestVO);
		// 반환한 갯수를 요청 VO에 설정
		ahzitSearchListRestResponseVO.setInfoCount(total);
		// 요청 VO를 매개변수로 하여 전체 조회 / 카테고리 조회 종류에 따른 소모임 목록 반환
		List<AhzitSearchListResponseVO> ahzitInfoList = ahzitDao.selectSortAhzit(ahzitSearchListRequestVO);
		// 반환 VO에 조회 결과를 설정
		ahzitSearchListRestResponseVO.setAhzitInfoList(ahzitInfoList);
		// 반환 VO에 조회한 총 소모임의 마지막 페이지 블럭 설정
		ahzitSearchListRestResponseVO.setPLast(ahzitSearchListRequestVO.blockLast());		
		// 설정된 반환 VO를 반환
		return ahzitSearchListRestResponseVO;
	}
}
