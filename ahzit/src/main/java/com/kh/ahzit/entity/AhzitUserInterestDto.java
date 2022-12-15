package com.kh.ahzit.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class AhzitUserInterestDto {
	private String userInterestId;
	private String userInterestSort;
}
