package com.kh.ahzit.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.ahzit.entity.AhzitDto;
import com.kh.ahzit.repository.AdminDao;
import com.kh.ahzit.vo.AhzitUserJoinCountVO;

@CrossOrigin
@RestController
@RequestMapping("/rest/admin")
public class AdminRestController {

	@Autowired
	private AdminDao adminDao;
	
	@GetMapping("/ahzitUserCount")
	public List<AhzitUserJoinCountVO>ahzitUserCount(){
		return adminDao.ahzitUserCountList();
}
	
	@GetMapping("/ahzitSortCount")
	public List<AhzitDto>ahzitSortCount(){
		return adminDao.ahzitSortCount();
}
	@GetMapping("/ahzitHeadCount")
	public List<AhzitDto>ahzitHeadCount(){
		return adminDao.ahzitHeadCount();
}
	
}
