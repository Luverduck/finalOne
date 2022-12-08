package com.kh.ahzit.service;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.kh.ahzit.entity.AhzitDto;
import com.kh.ahzit.entity.AhzitMemberDto;

public interface AhzitService {
	int create(AhzitDto ahzitDto, AhzitMemberDto ahzitMemberDto, String memberId) throws IllegalStateException, IOException;

}
