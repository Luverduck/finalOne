package com.kh.ahzit.service;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

import com.kh.ahzit.entity.AhzitDto;

public interface AhzitService {
	int create(AhzitDto ahzitDto,  MultipartFile attachment) throws IllegalStateException, IOException;

}
