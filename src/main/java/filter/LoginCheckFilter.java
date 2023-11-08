package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter("/LoginCheckFilter")
public class LoginCheckFilter implements Filter {

    public LoginCheckFilter() {
    }

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		System.out.println("> LoginCheckFilter.doFilter()...");
		
		// auth 세션 객체에 인증, 권한 정보 저장
		
		// HttpSession 객체 생성
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		
		String auth = null;
		boolean isLogon = true;		// 일단 true로 해놓음
		
		HttpSession session = req.getSession(false);
		
		// 로그인 여부에 따른 처리
		if (session != null && (auth = (String) session.getAttribute("auth")) != null) {
			// 로그인 했다면
			isLogon = true;
		} // if
		
		if (isLogon) {			// 로그인 했다면
			chain.doFilter(request, response);
		} else {				// 로그인 안 했다면
			// 1) 요청했던 경로를 세션에 저장
			String referer = req.getRequestURI();
			session.setAttribute("referer", referer);
			
			// 2) 로그인 페이지로 보내기
			/*
			String location = "/member/login.jsp";
			res.sendRedirect(location);
			 */
		} // if
	} // doFilter()

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
