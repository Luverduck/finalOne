package com.kh.ahzit.error;

import lombok.NoArgsConstructor;

@NoArgsConstructor
public class TargetNotFoundException extends RuntimeException{
	public TargetNotFoundException(String message) {
		super(message);
	}
	
}
