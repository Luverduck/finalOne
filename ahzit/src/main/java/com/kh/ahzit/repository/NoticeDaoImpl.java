package com.kh.ahzit.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ahzit.entity.NoticeDto;
import com.kh.ahzit.vo.NoticeListSearchVO;

@Repository
public class NoticeDaoImpl implements NoticeDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	//등록
	@Override
	public void insert(NoticeDto noticeDto) {
		sqlSession.insert("notice.insert", noticeDto);
	}
	
	@Override
	public void insert2(NoticeDto noticeDto) {
		
		//번호를 미리 생성한 뒤 등록하는 기능
		String sql = "select notice_seq.nextval from dual";
		int noticeNo = jdbcTemplate.queryForObject(sql, int.class);
		System.out.println("noticeNo = " + noticeNo);
		
		sql = "insert into notice("
				+ "notice_no, notice_writer, notice_title, "
				+ "notice_content, notice_writedate, notice_read) "
				+ "values(?, ?, ?, ?, sysdate, 0)";
		Object[] param = {
				noticeNo, noticeDto.getNoticeWriter(), noticeDto.getNoticeTitle(), 
				noticeDto.getNoticeContent()
		};
		jdbcTemplate.update(sql, param);
		
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

	@Override
	public int sequence() {
		String sql = "select notice_seq.nextval from dual";
		int noticeNo = jdbcTemplate.queryForObject(sql, int.class);
		return noticeNo;
	}

}
