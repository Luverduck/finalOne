package com.kh.ahzit.repository;

import java.util.List;

import com.kh.ahzit.entity.InquireDto;
import com.kh.ahzit.vo.InquireListSearchVO;

public interface InquireDao {

	public int sequence(); // 시퀀스 등록
	
	void insert(InquireDto inquireDto); // 1:1 문의 등록
	
	public InquireDto detail(int inquireNo); // 문의 상세보기
	
	// public List<InquireDto> selectList(String inquireId); // 문의 리스트
	
	public List<InquireDto> selectList(InquireListSearchVO inquireListSearchVO); // 문의 조회
	
	public List<InquireDto> selectSearch(InquireListSearchVO inquireListSearchVO); // 문의 글 검색 목록
		
	public List<InquireDto> selectAll(InquireListSearchVO inquireListSearchVO); // 문의 전체 목록
		
	public int countInquire(InquireListSearchVO inquireListSearchVO); //  게시글 총 갯수 반환
		
	public int searchCountInquire(InquireListSearchVO inquireListSearchVO); //  검색 조회시 게시글 총 갯수 반환
		
	public int listCountInquire(InquireListSearchVO inquireListSearchVO); //  전체 조회시 게시글 총 갯수 반환

	boolean edit(InquireDto inquireDto); // 문의 수정
	
	boolean delete(int inquireNo); // 문의 삭제
}
