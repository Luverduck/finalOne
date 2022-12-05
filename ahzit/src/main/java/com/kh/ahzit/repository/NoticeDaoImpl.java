package com.kh.ahzit.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ahzit.entity.NoticeDto;
import com.kh.ahzit.vo.NoticeListSearchVO;

@Repository
public class NoticeDaoImpl implements NoticeDao{

	@Autowired
	private SqlSession sqlSession;
	
	//등록
	@Override
	public void insert(NoticeDto noticeDto) {
		sqlSession.insert("notice.insert", noticeDto);
	}
	
	
	//목록+검색
	@Override
	public List<NoticeDto> selectList() {
		return sqlSession.selectList("notice.list");
	}	
	

	@Override
	public List<NoticeDto> selectList(NoticeListSearchVO vo) {
		return sqlSession.selectList("notice.list");
	}
	
	//상세
	@Override
	public NoticeDto selectOne(int noticeNo) {
		return sqlSession.selectOne("notice.one", noticeNo);
	}
	
	//조회수 증가
	@Override
	public boolean updateReadCount(int noticeNo) {
		int count = sqlSession.update("notice.read", noticeNo);
		return count > 0;
	}
	@Override
	public NoticeDto read(int noticeNo) {
		this.updateReadCount(noticeNo);
		return this.selectOne(noticeNo);
	}

	//수정
	@Override
	public boolean edit(NoticeDto noticeDto) {
		int count = sqlSession.update("notice.edit", noticeDto);
		return count > 0;
	}

	//삭제
	@Override
	public boolean delete(int noticeNo) {
		int count = sqlSession.delete("notice.delete", noticeNo);
		return count > 0;
	}
	

}
