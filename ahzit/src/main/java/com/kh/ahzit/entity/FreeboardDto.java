package com.kh.ahzit.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class FreeboardDto {

	// 필드
	private int freeboardNo;
	private String freeboardWriter;
	private String freeboardTitle;
	private String freeboardContent;
	private int freeboardRead;
	private int freeboardLike;
	private Date freeboardWritedate;
	private Date freeboardUpdatedate;
	private String freeboardState;
}
