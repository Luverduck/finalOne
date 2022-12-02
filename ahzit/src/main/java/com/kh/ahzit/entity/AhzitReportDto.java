package com.kh.ahzit.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class AhzitReportDto {
	private int reportNo;
	private int reportGroup;
	private String reportId;
	private String reportType;
	private String reportContent;
	private String reportState;

}
