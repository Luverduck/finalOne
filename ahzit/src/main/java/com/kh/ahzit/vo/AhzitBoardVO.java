package com.kh.ahzit.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class AhzitBoardVO {

	// 필드
	// - AhzitBoardDto 관련
	private int boardNo;
	private String boardContent;
	private int boardLike;
	private Date boardWritedate;
	
	// - AhzitMemberDto 관련
	private int memberNo;
	private String memberNick;
	private String memberGrade;
}
