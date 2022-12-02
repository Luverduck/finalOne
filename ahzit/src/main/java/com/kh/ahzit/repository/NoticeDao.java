package com.kh.ahzit.repository;

import java.util.List;

import com.kh.ahzit.entity.NoticeDto;
import com.kh.ahzit.vo.NoticeListSearchVO;

public interface NoticeDao {
	void insert(NoticeDto noticeDto);
	List<NoticeDto> selectList();
	List<NoticeDto> selectList(NoticeListSearchVO vo);
	void clear();
}
