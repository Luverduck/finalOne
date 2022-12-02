package com.kh.ahzit.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.kh.ahzit.entity.NoticeDto;

@Repository
public class NoticeDaoImpl implements NoticeDao{

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public void insert(NoticeDto noticeDto) {
		String sql = "insert into notice("
				+ "notice_no, notice_writer, notice_title, notice_content"
				+ ") values(notice_seq.nextval, ?, ?, ?)";
		Object[] param = {
				noticeDto.getNoticeWriter(), noticeDto.getNoticeTitle(),
				noticeDto.getNoticeContent()
		};
		jdbcTemplate.update(sql, param);
	}
	
	//rowmapper
	private RowMapper<NoticeDto> mapper = new RowMapper<NoticeDto>() {

		@Override
		public NoticeDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			return NoticeDto.builder()
						.noticeNo(rs.getInt("notice_no"))
						.noticeWriter(rs.getString("notice_writer"))
						.noticeTitle(rs.getString("notice_title"))
						.noticeContent(rs.getString("notice_content"))
						.noticeRead(rs.getInt("notice_read"))
						.noticeWritedate(rs.getDate("notice_writedate"))
						.noticeUpdatedate(rs.getDate("notice_updatedate"))
					.build();
		}
	};
	
	@Override
	public List<NoticeDto> selectList() {
		String sql = "select * from board order by notice_no desc";
		return jdbcTemplate.query(sql, mapper);
	}

	@Override
	public List<NoticeDto> selectList(String type, String keyword) {
		String sql = "select * from notice "
				+ "where instr(#1, ?) > 0 "
				+ "order by notice_no desc";
		sql = sql.replace("#1", type);
		Object[] param = {keyword};
		return jdbcTemplate.query(sql, mapper, param);
	}
	
	@Override
	public void clear() {
		String sql = "delecte notice";
		jdbcTemplate.update(sql);
	}
}
