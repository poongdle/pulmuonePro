package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import auth.AuthInfo;
import lombok.NoArgsConstructor;

@NoArgsConstructor

public class LoginCheckFilter implements Filter {

	
	@Override
	public void destroy() {

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("> LoginCheckFilter.doFilter()...");
		
		// 세션 auth 인증 + 권한 저장
		
		// servletRequest에는 getSession()이 없음
		// HttpServletRequest로 다운캐스팅
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res =  (HttpServletResponse) response;
		
		HttpSession session = req.getSession(false);
		
		AuthInfo auth = null;
		auth = (AuthInfo) session.getAttribute("auth");
		
		boolean isLogin = false; // 인증 시, true
		
		if ( session != null && auth != null) {

			// 인증 처리 완료 상태
			isLogin = true;
		}
		
		// 권한 있으면 chain, 없으면 로그인할 수 있는 페이지로
		if (isLogin) {		
			chain.doFilter(request, response);
		} else {
			// referer - 이전 경로를 가지고 있는 속성
			String referer = req.getRequestURI();
			session.setAttribute("referer", referer);
			
			String location = "/member/login.do";
			res.sendRedirect(location);
		}
		
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}