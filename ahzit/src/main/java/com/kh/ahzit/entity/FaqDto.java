package com.kh.ahzit.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class FaqDto {
	private int faqNo;
	private String faqWriter;
	private String faqTitle;
	private String faqContent;
	private Date faqWritedate;
	private Date faqUpdatedate;
}
