package auth;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

//인증받은 사용자 정보를 저장할 클래스
public class AuthInfo {

	private String memberNo;
	private String name;
	private String authority;
	
}
