package com.kh.ahzit.repository;

import java.util.ArrayList;
import java.util.List;

import com.kh.ahzit.entity.ScheduleDto;

public interface ScheduleDao {
	List<ScheduleDto> scheduleList(int scheduleAhzitNo);//ahzit_no로 일정 테이블 조회
	void insert(ScheduleDto scheduleDto);//로그인한 회원이 아지트 캘린더에 일정 등록
	void insert2(ScheduleDto scheduleDto);//일정등록(시퀀스번호미리발행한것을 따로 사용)
	int sequence();//시퀀스 번호 	발행
	boolean delete(int scheduleNo);//일정 삭제
}
