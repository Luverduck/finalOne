package com.kh.ahzit.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.ahzit.repository.AhzitUserDao;

@CrossOrigin
@RestController
@RequestMapping("/rest/ahzitUser")
public class AhzitUserRestController {

	@Autowired
	private AhzitUserDao ahzitUserDao;
	
	@PostMapping("/userId")
	private String userId (@RequestParam String value) {
		if(ahzitUserDao.selectOne(value) == null) {
			return "NNNNY";
		}
		else {
			return "NNNNN";
		}
	}

}
