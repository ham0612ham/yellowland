package com.sp.app.security;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.AuthenticationException;

// 필터를 만들었다고 필터가 자동으로 등록되는 것이 아님. security가 사용할 수 있도록 해야함.
public class AjaxSessionTimeoutFilter implements Filter { // javax.servlet.Filter 구현
	
	private String ajaxHeader;
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		HttpServletRequest req = (HttpServletRequest)request; // HttpServletRequest는 ServletRequest의 자식. HttpServletRequest가 ServletRequest보다 메소드가 더 많기 때문에 이걸로 캐스팅
		HttpServletResponse resp = (HttpServletResponse)response;
		
		if(isAjaxRequest(req)) {
			try {
				chain.doFilter(req, resp); // 그냥 그대로 넘기는 것 (다음에 오는 서블릿에게 그대로 넘기는 것)
			} catch (AccessDeniedException e) {
				// 권한이 없거나 로그인되지 않은 경우 AccessDeniedException 예외가 발생
				resp.sendError(HttpServletResponse.SC_FORBIDDEN); // 403. HttpServletResponse.SC_FORBIDDEN 대신에 그냥 숫자 403을 넣어놔도 됨
			} catch (AuthenticationException e) {
				resp.sendError(HttpServletResponse.SC_UNAUTHORIZED); // 401. HttpServletResponse.SC_FORBIDDEN 대신에 그냥 숫자 401을 넣어놔도 됨
			}
		} else {
			chain.doFilter(req, resp);
		}
	}

	public void setAjaxHeader(String ajaxHeader) {
		this.ajaxHeader = ajaxHeader;
	}
	
	private boolean isAjaxRequest(HttpServletRequest req) {
		return req.getHeader(ajaxHeader) != null && 
				req.getHeader(ajaxHeader).equals(Boolean.TRUE.toString()); // Boolean.TRUE.toString() 이거 대신에 "true"로 넣어도 됨
	}
}
