package com.mvc.homeseek.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.LoggerFactory;
import org.slf4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class homeseekInterceptor implements HandlerInterceptor {

	private Logger logger = LoggerFactory.getLogger(homeseekInterceptor.class);
	
	// D/S 에서 controller으로 가기 전sz
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		logger.info(" \n [ preHandle ]");
		
		// 여기 밑으로 작성하세요.
		if(request.getRequestURI().contains("main.do") || 
				request.getRequestURI().contains("loginform.do")|| 
				request.getRequestURI().contains("/ajaxlogin.do")||
				request.getRequestURI().contains("/checkid.do")||
				request.getRequestURI().contains("/checkphone.do")||
				request.getRequestURI().contains("/registform.do")||
				request.getRequestURI().contains("/registres.do")||
				request.getRequestURI().contains("/findidform.do")||
				request.getRequestURI().contains("/findpwdform.do")||
				request.getRequestURI().contains("/findid.do")||
				request.getRequestURI().contains("/findpw.do")||
				request.getRequestURI().contains("/selectid.do")||
				request.getRequestURI().contains("/selectpw.do")||//
				request.getRequestURI().contains("/sendsms.do")||
				request.getSession().getAttribute("login") != null ||
				request.getRequestURI().contains("/search.do") || // 서버에 엘라스틱 올리면 search.do 로 변경예정
				request.getRequestURI().contains("/navercallback.do") ||
				request.getRequestURI().contains("/kakaocallback.do") ||
				request.getRequestURI().contains("/googlecallback.do") ||
				request.getRequestURI().contains("naverregistres.do") ||
				request.getRequestURI().contains("kakaoregistres.do") ||
				request.getRequestURI().contains("googleregistres.do") ||
				request.getRequestURI().contains("reportmember.do") ||
				request.getRequestURI().contains("insertres.do")||
				request.getRequestURI().contains("insertres2.do")||
				request.getRequestURI().contains("donateform.do") ||
				request.getRequestURI().contains("reportmemberres.do")||
				request.getRequestURI().contains("insertpopup.do") ||
				request.getRequestURI().contains("messagemember.do") ||
				request.getRequestURI().contains("wish.do") ||
				request.getRequestURI().contains("/echo.do") ||
				request.getRequestURI().contains("appendList.do") ||
				request.getRequestURI().contains("fileupload.do") ||
				request.getRequestURI().contains("message.do")	||
				request.getRequestURI().contains("noticelist.do") ||
				request.getRequestURI().contains("noticedetail.do") ||
				//request.getRequestURI().contains("noticeinsertform.do") ||
				request.getRequestURI().contains("noticeinsert.do") ||
				request.getRequestURI().contains("noticeupdateform.do") ||
				request.getRequestURI().contains("noticeupdate.do") ||
				request.getRequestURI().contains("noticedelete.do") ||
				request.getRequestURI().contains("qnalist.do") ||
				request.getRequestURI().contains("qnadetail.do") ||
				//request.getRequestURI().contains("qnainsertform.do") ||
				request.getRequestURI().contains("qnainsert.do") ||
				request.getRequestURI().contains("qnaupdateform.do") ||
				request.getRequestURI().contains("qnaupdate.do") ||
				request.getRequestURI().contains("qnadelete.do") ||
				request.getRequestURI().contains("noticeSearch.do") ||
				request.getRequestURI().contains("qnaSearch.do") ||
				request.getRequestURI().contains("commentlist.do") ||
				request.getRequestURI().contains("commentinsert.do") ||
				request.getRequestURI().contains("commentupdate.do") ||
				request.getRequestURI().contains("commentdelete.do") ||
				request.getRequestURI().contains("remove.do") ||
				request.getRequestURI().contains("mypagemyinfo.do") ||
				request.getRequestURI().contains("dropmember.do") ||
				request.getRequestURI().contains("mypagewishlist.do") ||
				request.getRequestURI().contains("mypageroomlist.do") ||
				request.getRequestURI().contains("mypagemsglist.do") ||
				request.getRequestURI().contains("mypagedonalist.do")) {//이 조건들일때만 컨트롤러로 넘어갈 수 있게 만든 것이다.
			
		
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
