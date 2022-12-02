package com.kh.ahzit.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class AhzitUserDto {
	
	private String userId;
	private String userPw;
	private String userNick;
	private String userEmail;
	private String userGrade;
	private Date userJoinDate;
	private Date userLoginDate;
	private String userState;
	
	

}
