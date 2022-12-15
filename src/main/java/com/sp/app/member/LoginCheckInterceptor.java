package com.sp.app.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginCheckInterceptor implements HandlerInterceptor {
	private final Logger logger = LoggerFactory.getLogger(LoginCheckInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object handler) throws Exception {
		boolean result = true;

		try {
			HttpSession session = req.getSession();
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			String cp = req.getContextPath();
			String uri = req.getRequestURI();
			String queryString = req.getQueryString();

			if (info == null) {
				result = false;

				if (isAjaxRequest(req)) {
					resp.sendError(403);
				} else {
					if (uri.indexOf(cp) == 0)
						uri = uri.substring(req.getContextPath().length());
					if (queryString != null)
						uri += "?" + queryString;

					session.setAttribute("preLoginURI", uri);
					resp.sendRedirect(cp + "/member/login");
				}
			} else {
				if(uri.indexOf("admin")!=-1 && info.getMembership() < 51) {
					result = false;
					resp.sendRedirect(cp+"/member/noAuthorized");
				}
			}
		} catch (Exception e) {
			logger.info("pre: " + e.toString());
		}

		return result;
	}

	@Override
	public void postHandle(HttpServletRequest req, HttpServletResponse resp, Object handler, ModelAndView modelAndView)
			throws Exception {
	}

	@Override
	public void afterCompletion(HttpServletRequest req, HttpServletResponse resp, Object handler, Exception ex)
			throws Exception {
	}

	// AJAX 요청인지를 확인하기 위해 작성한 메소드
	private boolean isAjaxRequest(HttpServletRequest req) {
		String header = req.getHeader("AJAX");
		return header != null && header.equals("true");
	}

}
