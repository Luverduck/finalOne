package com.kh.ahzit.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class QnaDto {

	private int qnaNo, qnaRead;
	private String qnaWriter, qnaTitle, qnaContent, qnaState;
	private Date qnaWritedate, qnaUpdatedate;
}
