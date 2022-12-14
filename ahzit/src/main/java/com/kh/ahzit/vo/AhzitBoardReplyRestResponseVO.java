package com.kh.ahzit.vo;

import java.util.List;

import lombok.Data;

@Data
public class AhzitBoardReplyRestResponseVO {
	
	// 필드
	List<AhzitBoardReplyVO> replyList; // 특정 게시글 내 댓글
	int rpLast; // 댓글 마지막 페이비 블럭 수
	int replyCount; // 댓글 총 수 (더보기 생성 제한을 위함)
}
