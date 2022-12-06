package com.kh.ahzit.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class FreeboardReplyDto {

	// 필드
	private int freeboardReplyNo;
	private int freeboardOriginNo;
	private String freeboardReplyWriter;
	private String freeboardReplyContent;
	private Date freeboardReplyWritedate;
	private Date freeboardReplyUpdatedate;
}
