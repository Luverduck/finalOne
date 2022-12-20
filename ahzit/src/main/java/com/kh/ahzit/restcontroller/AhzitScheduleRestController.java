package com.kh.ahzit.restcontroller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
@RequestMapping("/rest/ahzitSchedule")
public class AhzitScheduleRestController {
	
	@Autowired
	private AhzitMemberDao ahzitMemberDao;
	
	@Autowired
	private ScheduleDao scheduleDao;
	
	
	
	
	
	
	@ResponseBody
	@RequestMapping("/scheduleInsert")
	public void scheduleInsert(@RequestBody ScheduleDto scheduleDto) {
		int scheduleNo=scheduleDao.sequence();
		scheduleDto.setScheduleNo(scheduleNo);
		scheduleDao.insert2(scheduleDto);
	}
	
	@ResponseBody
	@RequestMapping("/scheduleDelete")
	public void scheduleDelete(@RequestBody int scheduleNo) {
		scheduleDao.delete(scheduleNo);
	}

}
