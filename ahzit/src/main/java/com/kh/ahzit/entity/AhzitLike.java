package com.kh.ahzit.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder	
public class AhzitLike {
	private int AhzitLikeNo;
	private String AhzitLikeId;
	private Date AhzitLikeDate;
}
