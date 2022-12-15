package com.kh.ahzit.service;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

import com.kh.ahzit.entity.AhzitMemberDto;

public interface AhzitMemberService {
	void insert(AhzitMemberDto ahzitMemberDto, MultipartFile attachment) throws IllegalStateException, IOException;
}
