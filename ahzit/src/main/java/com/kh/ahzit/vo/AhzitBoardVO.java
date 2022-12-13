package com.kh.ahzit.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class AhzitBoardVO {

	// 필드
	// - AhzitBoardDto 관련
	private int boardNo;
	private int boardWriterNo;
	private String boardContent;
	private int boardLike; // 좋아요 갯수
	private Date boardWritedate;
	
	// - AhzitMemberDto 관련
	private int memberNo;
	private String memberNick;
	private String memberGrade;
	
	// - 댓글 갯수
	private int replyCount;
	
	// - 좋아요 여부
	private int isLike;
}
