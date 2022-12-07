package com.kh.ahzit.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class InquireListSearchVO {

	private String type,keyword,inquireId;
	
	public boolean isSearch() {
		return type != null && keyword != null;
	}
	
	//현재 페이지 번호(없을 경우 1로 설정)
	private int p = 1;
	private int size = 10;
	
	public int startRow() {
		return endRow() - (size - 1);
	}
	public int endRow() {
		return p * size;
	}
	
	//총 게시글 수
	private int count;

	//화면에 표시할 블럭 개수
	private int blockSize = 5;
	
	public int pageCount() {
		return (count + size - 1) / size;
	}
	public int startBlock() {
		return (p - 1) / blockSize * blockSize + 1;
	}
	public int endBlock() {
		int value = startBlock() + blockSize - 1;
		return Math.min(value, lastBlock());
	}
	public int prevBlock() {
		return startBlock() - 1;
	}
	public int nextBlock() {
		return endBlock() + 1;
	}
	public int firstBlock() {
		return 1;
	}
	public int lastBlock() {
		return pageCount();
	}
	public boolean isFirst() {
		return p == 1;
	}
	public boolean isLast() {
		return endBlock() == lastBlock();
	}
	public boolean hasPrev() {
		return startBlock() > 1;
	}
	public boolean hasNext() {
		return endBlock() < lastBlock();
	}
	
	//검색이나 크기 등이 유지될 수 있도록 Query String을 생성
	//- p를 제외한 나머지 항목들에 대한 파라미터 생성
	public String parameter() {
		if(isSearch()) {
			return "size="+size+"&type="+type+"&keyword="+keyword;
		}
		else {
			return "size="+size;
		}
		
	}
}
