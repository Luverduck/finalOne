package com.kh.ahzit.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class InquireReplyDto {

	private int inquireReplyNo, inquireOriginNo;
	private String inquireReplyWriter, inquireReplyContent;
	private Date inquireReplyWritedate, inquireReplyUpdatedate;
}
