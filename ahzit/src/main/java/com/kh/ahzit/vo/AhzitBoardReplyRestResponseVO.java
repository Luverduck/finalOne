package com.kh.ahzit.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class AhzitBoardReplyRestResponseVO {
	
	// 필드
	// - 댓글 내용 관련
	private int replyNo;
	private int replyWriterNo;
	private int replyOriginNo;
	private String replyContent;	
	private Date replyWritedate;
	
	// - 회원 정보 관련
	private int memberNo;
	private String memberNick;
	private String memberGrade;
	
	// - 회원 프로필 번호
	private int memberAttachmentNo;
}
