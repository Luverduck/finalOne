package com.kh.ahzit.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.kh.ahzit.interceptor.AdminInterceptor;
import com.kh.ahzit.interceptor.MemberLoginInterceptor;

@Configuration
public class InterceptorConfiguration implements WebMvcConfigurer {

	// 의존성 주입 - 로그인 여부 인터셉터
	@Autowired
	private MemberLoginInterceptor memberLoginInterceptor;
	
	// 관리자 페이지 인터셉터
  @Autowired
   private AdminInterceptor adminInterceptor;
	
	// Interceptor 등록
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		
		// 로그인 여부 인터셉터 경로
		registry.addInterceptor(memberLoginInterceptor)
			.addPathPatterns("/ahzit_in/**") // 소모임 내 전체
			.excludePathPatterns("");
		
		 registry.addInterceptor(adminInterceptor)
		 	.addPathPatterns("/admin/**") // 관리자 페이지 전체
		 	.excludePathPatterns("");
	}
}
