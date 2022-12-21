package com.kh.ahzit.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class AhzitDto {

	private int ahzitNo;
	private String ahzitLeader;
	private String ahzitSort;
	private String ahzitName;
	private String ahzitInfo;
	private int ahzitHead;
	private int ahzitHeadMax;
	private String ahzitRegionHigh;
	private String ahzitRegionLow;
	private int ahzitLike;
	private int ahzitScore;
	private String ahzitGrade;
	private String ahzitIspublic;
	private String ahzitState;
	private int cnt;
	private int rn;
}
