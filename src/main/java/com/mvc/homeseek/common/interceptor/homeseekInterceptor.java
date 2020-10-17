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
