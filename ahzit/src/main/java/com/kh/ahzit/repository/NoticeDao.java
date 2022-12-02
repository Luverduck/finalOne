package com.kh.ahzit.repository;

import java.util.List;

import com.kh.ahzit.entity.NoticeDto;

public interface NoticeDao {
	void insert(NoticeDto noticeDto);
	List<NoticeDto> selectList();
	List<NoticeDto> selectList(String type, String keyword);
	void clear();
}
