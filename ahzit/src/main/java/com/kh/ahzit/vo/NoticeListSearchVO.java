package com.kh.ahzit.vo;

import lombok.Data;
import lombok.ToString;

@Data
public class NoticeListSearchVO {
	private String type, keyword;
	
	@ToString.Include
	public boolean isSearch() {
		return type != null && keyword != null;
		
	}
	
}
