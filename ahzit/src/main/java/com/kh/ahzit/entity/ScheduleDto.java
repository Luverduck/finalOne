package com.kh.ahzit.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class ScheduleDto {
	private int scheduleNo;
	private int scheduleMemberNo;
	private int scheduleAhzitNo;
	private String scheduleTitle;
	private String scheduleStart;
	private String scheduleEnd;
	private boolean scheduleAllday;

}
