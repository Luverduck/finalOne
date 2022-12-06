package com.kh.ahzit.repository;

import java.util.List;

import com.kh.ahzit.entity.FreeboardReplyDto;
import com.kh.ahzit.vo.FreeboardReplyListVO;

public interface FreeboardReplyDao {
	
	// 추상 메소드 - 자유게시글 다음 댓글 번호 반환
	public int nextFreeboardReplyNo();

	// 추상 메소드 - 자유게시글 댓글 등록
	public void insertFreeboardReply(FreeboardReplyDto freeboardReplyDto);
	
	// 추상 메소드 - 자유게시글 댓글 조회 + 페이징
	public List<FreeboardReplyDto> selectFreeboardReply(int freeboardOriginNo, FreeboardReplyListVO freeboardReplyListVO);
	
	// 추상 메소드 - 자유게시글 특정 게시글에 달린 댓글의 총 수
	public int countFreeboardReply(int freeboardOriginNo);
	
	// 추상 메소드 - 자유게시글 댓글 수정
	public boolean editFreeboardReply(FreeboardReplyDto freeboardReplyDto);
	
	// 추상 메소드 - 자유게시글 댓글 비활성화
	public boolean inactiveFreeboardReply(int freeboardReplyNo);
}
