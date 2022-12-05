package com.kh.ahzit.repository;

import java.util.List;

import com.kh.ahzit.entity.NoticeDto;
import com.kh.ahzit.vo.NoticeListSearchVO;

public interface NoticeDao {

	//insert
	void insert(NoticeDto noticeDto);

	//목록 + 검색
	List<NoticeDto> selectList();
	List<NoticeDto> selectList(NoticeListSearchVO vo);

	//상세
	NoticeDto selectOne(int noticeNo);

	//수정
	boolean edit(NoticeDto noticeDto);

	//삭제
	boolean delete(int noticeNo);
}
