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
public class AhzitMemberDto {
	
	// 필드
	private int memberNo;
	private int memberAhzitNo;
	private String memberId;	
	private String memberNick;
	private String memberGrade;
	private int memberScore;
	private Date memberJoindate;
}
