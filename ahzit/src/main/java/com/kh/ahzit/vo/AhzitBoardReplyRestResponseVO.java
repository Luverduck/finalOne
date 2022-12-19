package com.kh.ahzit.vo;

import java.util.List;

import lombok.Data;

@Data
public class AhzitBoardReplyRestResponseVO {
	
	// 필드
	List<AhzitBoardReplyVO> replyList; // 특정 게시글 내 댓글
	int rpLast; // 댓글 총 수
}
