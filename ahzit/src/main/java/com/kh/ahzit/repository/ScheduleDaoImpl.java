package com.kh.ahzit.repository;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ahzit.entity.ScheduleDto;

@Repository
public class ScheduleDaoImpl implements ScheduleDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<ScheduleDto> scheduleList(int scheduleAhzitNo) {
		return sqlSession.selectList("schedule.list", scheduleAhzitNo);
	}
	
	@Override
	public void insert(ScheduleDto scheduleDto) {
		sqlSession.insert("schedule.insert", scheduleDto);
	}
	
	@Override
	public int sequence() {//시퀀스 번호 발행
		return sqlSession.selectOne("schedule.sequence");
	}
	
	@Override
	public void insert2(ScheduleDto scheduleDto) {
		sqlSession.insert("schedule.insert2", scheduleDto);
	}
	
}
