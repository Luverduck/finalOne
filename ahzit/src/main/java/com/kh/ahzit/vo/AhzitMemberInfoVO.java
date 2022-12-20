package com.kh.ahzit.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class AhzitMemberInfoVO {

	// 필드
	private int memberNo;
	private int memberAhzitNo;
	private String memberId;
	private String memberGrade;
	private int memberScore;
	private Date memberJoindate;
	private String memberNick;
	private int memberOriginNo;
	private int memberAttachmentNo;
}
