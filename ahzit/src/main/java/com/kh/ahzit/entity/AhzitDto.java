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
	private String ahzitRegionHigh;
	private String ahzitRegionLow;
	private int ahzitLike;
	private int ahzitScore;
	private String ahzitGrade;
	private String ahzitIsPublic;
	private String ahzitState;
}
