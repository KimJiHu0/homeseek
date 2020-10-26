package com.mvc.homeseek.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.LoggerFactory;
import org.slf4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class homeseekInterceptor implements HandlerInterceptor {

	private Logger logger = LoggerFactory.getLogger(homeseekInterceptor.class);
	
	// D/S 에서 controller으로 가기 전
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		logger.info(" \n [ preHandle ]");
		
		// 여기 밑으로 작성하세요.
		if(request.getRequestURI().contains("main.do") || 
				request.getRequestURI().contains("loginform.do")|| 
				request.getRequestURI().contains("/ajaxlogin.do")||
				request.getRequestURI().contains("/checkid.do")||
				request.getRequestURI().contains("/registform.do")||
				request.getRequestURI().contains("/registres.do")||
				request.getRequestURI().contains("/sendsms.do")||
				request.getSession().getAttribute("login") != null ||
				request.getRequestURI().contains("listroom.do") ||
				request.getRequestURI().contains("auth/{snsService}/callback.do") ||
				request.getRequestURI().contains("auth/kakao/callback.do") ||
				request.getRequestURI().contains("auth/google/callback.do") ||
				request.getRequestURI().contains("reportmember.do") ||
				request.getRequestURI().contains("insertres.do")||
				request.getRequestURI().contains("reportmemberres.do")||
				request.getRequestURI().contains("insertpopup.do") ||
				request.getRequestURI().contains("messagemember.do")) {//이 조건들일때만 컨트롤러로 넘어갈 수 있게 만든 것이다.
		
			return true;
		}
		// 로그인이 안되어 있을 때 loginform.do 요청으로 바로 보내줘서 로그인페이지 보여지게한다.
		if(request.getSession().getAttribute("login") == null) {
			response.sendRedirect("loginform.do");
			return false;
		}
		
		return false;
	}
	
	// controller에서 D/S로 가기 전
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
		
		logger.info(" \n [ postHandle ]");
		
		if(modelAndView != null) {
			logger.info(" \n [ ViewName ] : " + modelAndView);
		}
		
	}
	
	
	// 완성 된 후
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
		
		logger.info(" \n [ afterCompletion ]");
	}
}
