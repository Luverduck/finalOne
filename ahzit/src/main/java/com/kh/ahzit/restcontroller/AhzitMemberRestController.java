package com.kh.ahzit.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.ahzit.entity.AhzitMemberDto;
import com.kh.ahzit.entity.ScheduleDto;
import com.kh.ahzit.repository.AhzitMemberDao;
import com.kh.ahzit.repository.ScheduleDao;
import com.kh.ahzit.vo.AhzitMemberInfoVO;

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
	
	// 비동기 회원 정보 조회
	@GetMapping("/member_info")
	public AhzitMemberInfoVO selectOneMemberInfo(@RequestParam int memberNo, @RequestParam int ahzitNo) {
		return ahzitMemberDao.selectOneMemberInfo(ahzitNo, memberNo);
	}
}
