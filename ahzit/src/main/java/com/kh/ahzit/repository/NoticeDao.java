package com.kh.ahzit.repository;

import java.util.List;

import com.kh.ahzit.entity.NoticeDto;
import com.kh.ahzit.vo.NoticeListSearchVO;

public interface NoticeDao {

	//등록
	void insert(NoticeDto noticeDto);
	
	//번호+등록
	int insert2(NoticeDto noticeDto);//번호까지 합쳐서 등록하는 메소드

	//목록 + 검색
	List<NoticeDto> selectList(); //안씀
	
	List<NoticeDto> selectList(NoticeListSearchVO vo);
	List<NoticeDto> list(NoticeListSearchVO vo);
	List<NoticeDto> search(NoticeListSearchVO vo);
	
	//검색과 목록의 총 데이터 개수를 구하는 메소드
	int count(NoticeListSearchVO vo);
	int searchCount(NoticeListSearchVO vo);
	int listCount(NoticeListSearchVO vo);
	
	//상세
	NoticeDto selectOne(int noticeNo);
	
	//조회수 증가
	boolean updateReadCount(int noticeNo);
	NoticeDto read(int noticeNo); //조회수 증가

	//수정
	boolean edit(NoticeDto noticeDto);

	//삭제
	boolean delete(int noticeNo);
	
	//test clear
	void clear();
	
	//첨부파일
	void connectAttachment(int noticeOriginNo, int noticeAttachmentNo);
	
}
