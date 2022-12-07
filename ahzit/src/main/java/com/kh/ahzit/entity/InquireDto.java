package com.kh.ahzit.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class InquireDto {

	private int inquireNo;
	private  String inquireId, inquireTitle, inquireContent, inquireState;    
	private Date inquireWritedate, inquireUpdatedate;  
}
