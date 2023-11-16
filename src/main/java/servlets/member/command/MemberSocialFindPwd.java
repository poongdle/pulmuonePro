package servlets.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;

public class MemberSocialFindPwd implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String socialType = request.getParameter("s");
		String location = null;	
		
		if (socialType.equals("K")) {
			location = "https://accounts.kakao.com/login/?continue=https%3A%2F%2Fkauth.kakao.com%2Foauth%2Fauthorize%3Fscope%3Daccount_ci%252Cphone_number%252Cname%252Cbirthyear%252Cbirthday%252Cgender%252Caccount_email%26response_type%3Dcode%26redirect_uri%3Dhttps%253A%252F%252Fgreenjuice.pulmuone.com%252Fsns%252Fkko%26through_account%3Dtrue%26client_id%3D4631f2522dc407a8035e73aaa5d1bd17#login";
			
		} else {
			// socialType.equals("N")	
			location = "https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=i7eb3o1oVsnPsxrI4jQ5&redirect_uri=https://greenjuice.pulmuone.com/sns/naver&state=1354335573239829520010549449079892092658";

		}

		response.sendRedirect(location);
		return null;
	}

}
