package com.kh.ahzit.repository;

import java.util.List;

import com.kh.ahzit.entity.FreeboardReplyDto;
import com.kh.ahzit.entity.InquireReplyDto;
import com.kh.ahzit.vo.InquireReplyListSearchVO;

public interface InquireReplyDao {

	public int sequence(); // 시퀀스 등록

	public boolean insert(InquireReplyDto inquireReplyDto); // 1:1 문의 댓글 등록
	
	public List<InquireReplyDto> selectInquireReply(int inquireOriginNo, InquireReplyListSearchVO inquireReplyListSearchVO); // 댓글 조회 + 페이징
		
	public int countInquireReply(int inquireOriginNo); // 조회 게시글에 달린 댓글의 총 수
		
	public boolean editInquireReply(InquireReplyDto inquireReplyDto); // 댓글 수정
	
	boolean delete(InquireReplyDto inquireReplyDto); // 댓글 삭제

	public boolean updateReply(InquireReplyDto inquireReplyDto);

}
