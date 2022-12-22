package com.kh.ahzit.vo;

import java.util.List;

import lombok.Data;

@Data
public class AhzitSearchListRestResponseVO {

	// 필드
	private List<AhzitSearchListResponseVO> ahzitInfoList;
	private int pLast;
	private int infoCount;
}
