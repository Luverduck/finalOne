package com.kh.ahzit.repository;

import java.util.List;

import com.kh.ahzit.entity.NoticeDto;
import com.kh.ahzit.vo.NoticeListSearchVO;

public interface NoticeDao {

	//등록
	void insert(NoticeDto noticeDto);

	//목록 + 검색
	List<NoticeDto> selectList();
	List<NoticeDto> selectList(NoticeListSearchVO vo);
	
	//조회수 증가
	boolean updateReadCount(int noticeNo);
	NoticeDto read(int noticeNo); //조회수 증가

	//수정
	boolean edit(NoticeDto noticeDto);

	//상세
	NoticeDto selectOne(int noticeNo);

	//삭제
	boolean delete(int noticeNo);
}
