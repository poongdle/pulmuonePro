package servlets.franchiseSearch.command;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.google.gson.Gson;

import mvc.command.CommandHandler;
import servlets.franchiseSearch.model.AddressDTO;
import servlets.franchiseSearch.model.FranchiseDTO;
import servlets.franchiseSearch.service.FrService;

public class ajaxFranchise implements CommandHandler{
	// 해당 요청 외에 키 사용 금지
	final private String AUTHORIZATION = "KakaoAK 4e3d4720c5bff7fed4972483c92f49fd";
	private FrService frService = new FrService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		URL url;
		HttpURLConnection conn = null;
		response.setContentType("application/x-json; charset=UTF-8");
		try {
			System.out.println(">> franchise searching...");
			// "{\"documents\":[{\"address\":{\"address_name\":\"서울 영등포구 당산동 121-22\",\"b_code\":\"1156011700\",\"h_code\":\"1156056000\",\"main_address_no\":\"121\",\"mountain_yn\":\"N\",\"region_1depth_name\":\"서울\",\"region_2depth_name\":\"영등포구\",\"region_3depth_h_name\":\"당산2동\",\"region_3depth_name\":\"당산동\",\"sub_address_no\":\"22\",\"x\":\"126.907703382657\",\"y\":\"37.5270069102324\"},\"address_name\":\"서울 영등포구 국회대로53길 20\",\"address_type\":\"ROAD_ADDR\",\"road_address\":{\"address_name\":\"서울 영등포구 국회대로53길 20\",\"building_name\":\"영동초등학교\",\"main_building_no\":\"20\",\"region_1depth_name\":\"서울\",\"region_2depth_name\":\"영등포구\",\"region_3depth_name\":\"당산동\",\"road_name\":\"국회대로53길\",\"sub_building_no\":\"\",\"underground_yn\":\"N\",\"x\":\"126.907703382657\",\"y\":\"37.5270069102324\",\"zone_no\":\"07229\"},\"x\":\"126.907703382657\",\"y\":\"37.5270069102324\"}],\"meta\":{\"is_end\":true,\"pageable_count\":1,\"total_count\":1}}";
			String pquery = request.getParameter("query"); 
			String query = URLEncoder.encode(pquery);
			String api = "https://dapi.kakao.com/v2/local/search/address"; 
			api += "?query=" + query;
			url = new URL(api); 
			conn = (HttpURLConnection) url.openConnection(); 
			conn.setRequestProperty("Authorization",AUTHORIZATION); 
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-Type", "application/json");
			conn.setRequestProperty("Accept", "application/json");
			conn.setConnectTimeout(5000);
			conn.setDoOutput(true); int responseCode = conn.getResponseCode();
			System.out.println("### getAccessToken responseCode : " + responseCode);

			BufferedReader br = null; 
			if( responseCode == 200 ) { 
				br = new BufferedReader(new InputStreamReader(conn.getInputStream())); 
			}else { 
				br = new BufferedReader(new InputStreamReader(conn.getErrorStream())); 
			}

			String line; 
			StringBuffer res = new StringBuffer();
			while ( (line = br.readLine() ) != null ) { 
				res.append(line); 
			}
			JSONParser parser = new JSONParser();
			Object obj = parser.parse(res.toString());
			JSONObject jsonObj = (JSONObject) obj;
			JSONArray documents = (JSONArray) jsonObj.get("documents");
			if( documents.size() == 0 ) {
				return emptyList();
			}
			JSONObject info = (JSONObject) documents.get(0);

			// 주소
			String address_name = pquery;
			// 경도
			Double fc_lng = Double.parseDouble( (String) info.get("x") );
			// 위도
			Double fc_lat = Double.parseDouble((String) info.get("y") );

			AddressDTO vo = new AddressDTO(address_name, fc_lng, fc_lat);

			ArrayList<FranchiseDTO> list = null;
			list = frService.select(vo);

			if( list != null ) {
				Gson gson = new Gson();
				return gson.toJson(list);
			}else {
				return emptyList();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public static String emptyList () {
		JSONObject emptyObj = null; 
		HashMap<String, Integer> hashmap = new HashMap<>();
		hashmap.put("result", 0);
		emptyObj = new JSONObject(hashmap);
		System.out.println(">> 검색결과 없음");
		return emptyObj.toJSONString();
	}

}
