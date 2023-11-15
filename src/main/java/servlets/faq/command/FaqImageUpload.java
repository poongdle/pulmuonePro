package servlets.faq.command;

import java.io.File;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import mvc.command.CommandHandler;
import net.sf.json.JSONObject;
import servlets.notice.model.NoticeImageDTO;

public class FaqImageUpload implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String saveDirectory = request.getRealPath("/upload/faq/");
		
		File f = new File(saveDirectory);
	  	if( !f.exists() ) {
	  		f.mkdirs();
	  	}
	  	int maxPostSize = 5 * 1024 * 1024; // 5MB  기본단위 바이트
	  	String encoding = "UTF-8";
	  	FileRenamePolicy policy = new DefaultFileRenamePolicy(); // 파일 중복 처리 _1, _2, 로 생성해줌
	  	
	  	MultipartRequest multiRequest = new MultipartRequest(
	  				request, saveDirectory, maxPostSize, encoding, policy
	  			);
	  	
	  	File file = multiRequest.getFile("upload");
	  	String realPath = request.getServletContext().getRealPath("/upload/faq");
	  	
	
	  	if( file != null ) {
	  		String fileSystemName = multiRequest.getFilesystemName("upload");
	  		String originName = multiRequest.getOriginalFileName("upload");
	  		String img_size = String.valueOf( file.length() );
	  		String img_type = originName.substring(originName.lastIndexOf(".")+1);
	  		
	  		NoticeImageDTO dto = new NoticeImageDTO(0, 0, fileSystemName, originName, img_size, img_type, saveDirectory);
	  		System.out.println(fileSystemName);
	  		System.out.println(originName);
	  		System.out.println(img_size);
	  		System.out.println(img_type);
	  		
	  		PrintWriter out = response.getWriter();
			
	  		JSONObject outData = new JSONObject();
	  		outData.put("uploaded", true);
	  		outData.put("url", "/upload/faq/" + fileSystemName);
	  		
	  	  	System.out.println(">>>>>>>");
		  	System.out.println(request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + realPath + "/" + originName);
		  	System.out.println(">>>>>>>");
	  		response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");

			out.print(outData);
	  		//out.println(outData); //response
	  	}
	  	
	  	System.out.println("-------");
	  	System.out.println( file );
		System.out.println("upload..");
		return null;
	}

}
