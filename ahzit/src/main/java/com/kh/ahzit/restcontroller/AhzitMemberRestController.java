package com.kh.ahzit.restcontroller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.ahzit.entity.AhzitMemberDto;
import com.kh.ahzit.entity.ScheduleDto;
import com.kh.ahzit.repository.AhzitMemberDao;
import com.kh.ahzit.repository.ScheduleDao;

@CrossOrigin
@RestController
@RequestMapping("/rest/ahzitMember")
public class AhzitMemberRestController {
	
	@Autowired
	private AhzitMemberDao ahzitMemberDao;
	
	@Autowired
	private ScheduleDao scheduleDao;
	
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
	
	
	@GetMapping("/scheduleList")
	public List<ScheduleDto> scheduleList(@RequestParam int memberAhzitNo){
		List<ScheduleDto> findList=scheduleDao.scheduleList(memberAhzitNo);
		
		return findList;
		
	}
	
	
	

}
