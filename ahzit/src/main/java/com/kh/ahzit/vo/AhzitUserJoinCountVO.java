package com.kh.ahzit.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data@NoArgsConstructor@AllArgsConstructor@Builder
public class AhzitUserJoinCountVO {

	private Date userJoinDate;
	private int userCnt;
}
