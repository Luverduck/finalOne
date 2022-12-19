package com.kh.ahzit.vo;

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
	int pLast; // 게시글 마지막 페이지 번호
}
