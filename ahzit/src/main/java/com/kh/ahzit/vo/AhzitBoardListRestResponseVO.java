package com.kh.ahzit.vo;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class AhzitBoardListRestResponseVO {

	// 필드
	private List<AhzitBoardVO> boardList; // 소모임 내 게시글 목록 (좋아요 갯수는 AhzitBoardDto 내 포함되어있음)
	//private int memberAttachmentNo; // 회원 프로필 첨부파일 번호
	//private int replyCount;	// 댓글 갯수
	
//	// 필드
//	// - AhzitBoardDto 관련
//	private int boardNo;
//	private int boardWriterNo;
//	private String boardContent;
//	private int boardLike;
//	private Date boardWritedate;
//	
//	// - AhzitMemberDto 관련
//	private int memberNo;
//	private String memberNick;
//	private String memberGrade;
//	
//	// - 댓글 갯수
//	private int replyCount;
//	
//	// - 좋아요 갯수
//	private int likeCount;
//	
//	// - 좋아요 여부
//	private boolean isLike;
}
