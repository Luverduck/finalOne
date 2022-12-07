package com.kh.ahzit.vo;

import com.kh.ahzit.entity.AhzitMemberDto;
import com.kh.ahzit.entity.AhzitUserDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class AhzitMemberListVO {
	private AhzitMemberDto clubMemberDto;
	private AhzitUserDto ahzitUserDto;
}
