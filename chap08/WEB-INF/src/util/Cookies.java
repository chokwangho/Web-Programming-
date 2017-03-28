package util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Cookie;
import java.util.Map;
import java.net.URLEncoder;
import java.net.URLDecoder;
import java.io.IOException;

public class Cookies{
	private Map<String,Cookie> cookieMap =
		new java.util.HashMap<String,Cookie>();
//쿠키를 <쿠키이름, Cookie 객체> 쌍 형태로 저장하는 맵을 생성한다

	public Cookies(HttpServletRequest request){
		Cookie[] cookies= request.getCookies();
		if( cookies != null) {
		 for(int i=0; i<cookies.length; i++){
			cookieMap.put(cookies[i].getName(), cookies[i]);
		}
	}
} 
//Cookies클래스의 생성자이다. 파라미터로 전달받은 request로부터 Cookie 배열과, 각각의 Cookie객체를 CookieMap에 저장

public Cookie getCookie(String name){
	return cookieMap.get(name);
}

public String getValue(String name) throws IOException{
	Cookie cookie = cookieMap.get(name);
	if(cookie == null){
	return null;
	}
	return URLDecoder.decode(cookie.getValue(),"euc-kr");
	} 

public boolean exists(String name){
	return cookieMap.get(name) != null;
}

public static Cookie createCookie(String name,String value)
throws IOException{
	return new Cookie(name, URLEncoder.encode(value,"utf-8"));
}

public static Cookie createCookie(String name, String value, String path, int maxAge) throws IOException{
	Cookie cookie = new Cookie(name, URLEncoder.encode(value , "utf-8"));
	cookie.setPath(path);
	cookie.setMaxAge(maxAge);
	return cookie;
}

public static Cookie createCookie(String name,String value,String domain, String path, int maxAge) throws IOException{
Cookie cookie = new Cookie(name, URLEncoder.encode(value, "utf-8"));
cookie.setDomain(domain);
cookie.setPath(path);
cookie.setMaxAge(maxAge);
return cookie;
}
}

	

