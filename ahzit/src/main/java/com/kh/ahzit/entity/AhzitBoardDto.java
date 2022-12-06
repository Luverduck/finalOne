package com.kh.ahzit.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AhzitBoardDto {

	// 필드
	private int boardNo;
	private String boardWriter;
	private String boardTitle;
	private String boardContent;
	private int boardRead;
	private int boardLike;
	private Date boardWritedate;
	private Date boardUpdatedate;
	private String boardState;
}
