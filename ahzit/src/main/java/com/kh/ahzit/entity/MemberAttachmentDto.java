package com.kh.ahzit.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class MemberAttachmentDto {
	private int memberOriginNo;
	private int memberAttachmentNo;

}
