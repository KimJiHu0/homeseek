package com.mvc.homeseek.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class homeseekLogFilter implements Filter {
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;

		String remoteAddr = req.getRemoteAddr();
		String uri = req.getRequestURI();
		String url = req.getRequestURL().toString();
		String queryString = req.getQueryString();
		String referer = req.getHeader(" referer ");
		String agent = req.getHeader(" Agent-User ");

		StringBuffer sb = new StringBuffer();

		sb.append("\n 1. remoteAddr : " + remoteAddr + "\n").append("\n 2. uri : " + uri + "\n")
				.append("\n 3. url : " + url + "\n").append("\n 4. queryString : " + queryString + "\n")
				.append("\n 5. referer : " + referer + "\n").append("\n 6. agent : " + agent + "\n");

		System.out.println(" [ LogFilter ] ");
		System.out.println(sb);

		chain.doFilter(req, response);

	}
	
	@Override
	public void destroy() {
		
	}

}
