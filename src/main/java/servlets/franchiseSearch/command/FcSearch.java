package servlets.franchiseSearch.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.code.geocoder.Geocoder;
import com.google.code.geocoder.GeocoderRequestBuilder;
import com.google.code.geocoder.model.GeocodeResponse;
import com.google.code.geocoder.model.GeocoderRequest;
import com.google.code.geocoder.model.GeocoderResult;
import com.google.code.geocoder.model.GeocoderStatus;
import com.google.code.geocoder.model.LatLng;

import mvc.command.CommandHandler;

public class FcSearch implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//String roadAddress = request.getParameter("roadAddress");
		String roadAddress = "서울시 강남구";
		String reqUrl = "https://maps.googleapis.com/maps/api/geocode/json";
		String addr = "?address=" + roadAddress;
		String key = "&AIzaSyA1ODmDLLL3ODsivD3lhSHNEgi7f4BYKbo";

		//Float[] coords = findGeoPoint(roadAddress);
		//System.out.println(coords);
		//System.out.println(roadAddress + ": " + coords[0] + ", " + coords[1]);

		
		return "/WEB-INF/views/franchiseSearch/search.jsp";
	}
	
	public static Float[] findGeoPoint(String location) {

	    if (location == null)
	      return null;

	    // setAddress : 변환하려는 주소 (경기도 성남시 분당구 등)
	    // setLanguate : 인코딩 설정
	    GeocoderRequest geocoderRequest = new GeocoderRequestBuilder().setAddress(location).setLanguage("ko").getGeocoderRequest();

	    try {
	        Geocoder geocoder = new Geocoder();
	        GeocodeResponse geocoderResponse = geocoder.geocode(geocoderRequest);

	        if (geocoderResponse.getStatus() == GeocoderStatus.OK & !geocoderResponse.getResults().isEmpty()) {
	            GeocoderResult geocoderResult=geocoderResponse.getResults().iterator().next();
	            LatLng latitudeLongitude = geocoderResult.getGeometry().getLocation();

	            Float[] coords = new Float[2];
	            coords[0] = latitudeLongitude.getLat().floatValue(); // toString() 가능
	            coords[1] = latitudeLongitude.getLng().floatValue();
	            
	            return coords;
	        }
	    } catch (IOException ex) {
	        ex.printStackTrace();
	    }
	    return null;
	}
}
