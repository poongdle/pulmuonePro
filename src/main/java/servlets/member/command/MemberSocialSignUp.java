package servlets.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;

public class MemberSocialSignUp implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberSocialSignUp.java : 소셜 계정으로 회원 가입");
		
		String socialType = request.getParameter("type");
		String location = null;
		
		if (socialType.equals("K")) {
			// 카카오 아이디로 로그인			
			location = "https://accounts.kakao.com/login/?continue=https%3A%2F%2Fkauth.kakao.com%2Foauth%2Fauthorize%3Fscope%3Daccount_ci%252Cphone_number%252Cname%252Cbirthyear%252Cbirthday%252Cgender%252Caccount_email%26response_type%3Dcode%26redirect_uri%3Dhttps%253A%252F%252Fgreenjuice.pulmuone.com%252Fsns%252Fkko%26state%3D%257B%257D%26through_account%3Dtrue%26client_id%3D4631f2522dc407a8035e73aaa5d1bd17#login";
		} else {
			// 네이버 아이디로 로그인
			location = "https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=i7eb3o1oVsnPsxrI4jQ5&redirect_uri=https://greenjuice.pulmuone.com/sns/naver&state=405194335721497271832610369836175646321&state=%7B%7D";
		}
		
		response.sendRedirect(location);
		
		return null;
	}

}
