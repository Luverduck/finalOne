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
public class AttachmentDto {

	// 필드
	private int attachmentNo;
	private String attachmentName;
	private String attachmentType;
	private long attachmentSize;
	private Date attachmentDate;
}
