package com.kh.ahzit.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ahzit.entity.InquireReplyDto;
import com.kh.ahzit.vo.InquireReplyListSearchVO;

@Repository
public class InquireReplyDaoImpl implements InquireReplyDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int sequence() {
		return sqlSession.selectOne("inquireReply.sequence");
		}

	@Override
	public boolean insert(InquireReplyDto inquireReplyDto) {
		return sqlSession.insert("inquireReply.insert", inquireReplyDto) > 0;
		  
		}

	@Override
	public List<InquireReplyDto> selectInquireReply(int inquireOriginNo,
			InquireReplyListSearchVO inquireReplyListSearchVO) {
		
		Map<String, String> param = new HashMap<>();
		param.put("inquireOriginNo", String.valueOf(inquireOriginNo));
		param.put("startRow", String.valueOf(inquireReplyListSearchVO.startRow()));
		param.put("endRow", String.valueOf(inquireReplyListSearchVO.endRow()));
		return sqlSession.selectList("inquireReply.selectList", param);
	}

	@Override
	public int countInquireReply(int inquireOriginNo) {
		return sqlSession.selectOne("inquireReply.count", inquireOriginNo);
	}

	@Override
	public boolean editInquireReply(InquireReplyDto inquireReplyDto) {
		return sqlSession.update("inquireReply.edit", inquireReplyDto) > 0;
		}

	@Override
	public boolean delete(InquireReplyDto inquireReplyDto) {
		int count = sqlSession.delete("inquireReply.delete", inquireReplyDto);
		return count > 0;
	}
	
	@Override
	public boolean updateReply(InquireReplyDto inquireReplyDto) {
		return sqlSession.update("inquireReply.ansUpdate", inquireReplyDto) > 0;
		}
	

}
