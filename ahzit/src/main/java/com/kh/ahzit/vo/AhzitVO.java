package com.kh.ahzit.vo;

import lombok.Data;

@Data
public class AhzitVO {
	
	//아지트 정보 관련
	private int ahzitNo;
	private int ahzitName;
	private int ahzitInfo;
	private int ahzitHead;
	private int ahzitSort;
	private String ahzitLeader;
	
	private int attachmentNo;

	
	//아지트 가입 관련
	private String userId;
	

}
