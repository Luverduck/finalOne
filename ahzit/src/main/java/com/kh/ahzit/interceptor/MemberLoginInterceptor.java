package com.kh.ahzit.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

@Component
public class MemberLoginInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// HttpSession 반환
		HttpSession session = request.getSession();
		// HttpSession에서 회원 아이디 반환 - 로그인 중이라면 반드시 HttpSession에 아이디가 저장되어 있다
		String memberId = (String)session.getAttribute("loginId");
		// 반환한 회원 아이디에 따라 다른 처리
		if(memberId == null) { // 반환한 회원 아이디가 null이라면(로그인 중이 아니라면)
			// 로그인 Mapping으로 강제 이동(redirect)
			response.sendRedirect("/ahzitUser/login");
			return false; // 차단
		}
		else { // 그렇지 않다면(로그인 중이라면)
			return true; // 통과
		}
	}
}
