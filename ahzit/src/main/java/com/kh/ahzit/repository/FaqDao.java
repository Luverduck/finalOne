package com.kh.ahzit.repository;

import java.util.List;

import com.kh.ahzit.entity.FaqDto;
import com.kh.ahzit.vo.FaqListSearchVO;

public interface FaqDao {

	//등록
	void insert(FaqDto faqDto);
	
//	//번호 + 등록
//	int insert2(FaqDto faqDto); //번호까지 합쳐서 등록하는 메소드
	
	//목록+검색
	List<FaqDto> selectList(); //안씀
	List<FaqDto> selectList(FaqListSearchVO vo);
		
	//상세
	FaqDto selectOne(int faqNo);
		
	//수정
	boolean edit(FaqDto faqDto);

	//삭제
	boolean delete(int faqNo);
	
	//test clear
	void clear();
}
