package com.kh.ahzit.repository;

import java.util.List;

import com.kh.ahzit.entity.NoticeDto;
import com.kh.ahzit.vo.NoticeListSearchVO;

public interface NoticeDao {

	//등록
	void insert(NoticeDto noticeDto);
	
	//번호+등록
	int sequence();//시퀀스 발행 메소드
	void insert2(NoticeDto noticeDto);//번호까지 합쳐서 등록하는 메소드

	//목록 + 검색
	List<NoticeDto> selectList();
	List<NoticeDto> selectList(NoticeListSearchVO vo);

	//상세
	NoticeDto selectOne(int noticeNo);
	
	//조회수 증가
	boolean updateReadCount(int noticeNo);
	NoticeDto read(int noticeNo); //조회수 증가

	//수정
	boolean edit(NoticeDto noticeDto);

	//삭제
	boolean delete(int noticeNo);
}
