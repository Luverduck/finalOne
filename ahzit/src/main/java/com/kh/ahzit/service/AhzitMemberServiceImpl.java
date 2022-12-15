package com.kh.ahzit.service;

import java.io.File;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Service;

@Service
public class AhzitMemberServiceImpl implements AhzitMemberService {

	@PostConstruct
	public void prepare() {
		dir.mkdirs();
	}
	
	private final File dir = new File("D:/upload/kh10f");
	
	
	
}
