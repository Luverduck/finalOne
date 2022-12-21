package com.kh.ahzit.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class MyAhzitVO {

	//내가 가입한 아지트
	private int ahzitNo;
	private int ahzitAttachmentNo;
	private int ahzitHead;
	private int ahzitHeadMax;
	private String ahzitName;
	private String ahzitSort;
	private String ahzitRegionHigh;
	private String ahzitRegionLow;
	private String ahzitGrade;
	private String memberNick;
}
