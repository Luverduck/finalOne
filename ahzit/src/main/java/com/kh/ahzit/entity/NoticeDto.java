package com.kh.ahzit.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class NoticeDto {

	private int noticeNo, noticeRead;
	private String noticeWriter, noticeTitle, noticeContent;
	private Date noticeWritedate, noticeUpdatedate;
}
