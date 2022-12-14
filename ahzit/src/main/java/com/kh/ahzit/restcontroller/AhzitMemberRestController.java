package com.kh.ahzit.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.ahzit.entity.AhzitMemberDto;
import com.kh.ahzit.repository.AhzitMemberDao;

@CrossOrigin
@RestController
@RequestMapping("/rest/ahzitMember")
public class AhzitMemberRestController {
	
	@Autowired
	private AhzitMemberDao ahzitMemberDao;
	
	@PostMapping("/nicknameCheck")
	private String nicknameCheck(@RequestParam int memberAhzitNo, @RequestParam String memberNick) {
		AhzitMemberDto ahzitMemberDto=AhzitMemberDto.builder().memberAhzitNo(memberAhzitNo).memberNick(memberNick).build();
		if(ahzitMemberDao.nicknameCheck(ahzitMemberDto)==true) {
			//NNNNY 중복 없음
			return "NNNNY";
		}
		else {
			//NNNNN 중복 있음
			return "NNNNN";
		}
	}
	
	

}
