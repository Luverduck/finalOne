package com.kh.ahzit.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class KakaoDto {

	private String kakaoId, kakaoFirst;
	private Date kakaoJoindate, kakaoIogindate;
	
}
