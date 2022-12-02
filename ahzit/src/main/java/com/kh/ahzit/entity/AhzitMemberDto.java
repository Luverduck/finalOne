package com.kh.ahzit.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder 
public class AhzitMemberDto {
	private String memberNick; 
	private int memberAhzitNo;
	private String memberId;
	private String memberGrade;
	private int  memberScore;
	private Date memberJoinDate;

}
