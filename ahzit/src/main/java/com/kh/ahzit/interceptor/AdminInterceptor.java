package com.kh.ahzit.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.kh.ahzit.constant.SessionConstant;

@Component
public class AdminInterceptor implements HandlerInterceptor{

   @Override
   public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
         throws Exception {
      HttpSession session = request.getSession();
      String GRADE = (String)session.getAttribute(SessionConstant.GRADE);
      boolean admin = GRADE != null && GRADE.equals("관리자") || GRADE != null && GRADE.equals("운영자");
      
      if(admin) {
         return true;
      }
      else {
    	  response.sendRedirect("/");
         return false;
      }
   }
}