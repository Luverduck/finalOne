package com.kh.ahzit.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class AhzitBoardReplyVO {

	// 필드
	private int replyNo;
	private int replyWriterNo;
	private int replyOriginNo;
	private String replyContent;
	private Date replyWritedate;
	private String replyState;
	private int memberNo;
	private String memberNick;
	private String memberGrade;
	private int memberAttachmentNo;
	
	private int replyCount;
}
