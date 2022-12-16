package com.kh.ahzit.service;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

import com.kh.ahzit.entity.AhzitMemberDto;

public interface AhzitMemberService {
	void insert(AhzitMemberDto ahzitMemberDto, MultipartFile attachment) throws IllegalStateException, IOException;
	
	void uploadProfile(AhzitMemberDto ahzitMemberDto, MultipartFile attachment) throws IllegalStateException, IOException;//프로필 수정 페이지에서 이미지 등록기능 독립

}
