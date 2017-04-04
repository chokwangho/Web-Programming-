package chap11;
// 해쉬맵 임포트, 맵 임포트, map 생성자 만들어주고, 위치 온도 set, 온도 get ,화씨로 바꿔주고, 정보주는 함수
import java.util.HashMap; 
import java.util.Map;

public class Thermometer {
private Map<String,Double> locationCelsiusMap = new HashMap<String,Double>();

public void setCelsius(String location, Double value){
	locationCelsiusMap.put(location, value);
}

public Double getCelsius(String location){
       return  locationCelsiusMap.get(location);
}

public Double changeF(String location){
	Double celsius = getCelsius(location);
	if(celsius == null){
		return null;
	}else {
	 return celsius.doubleValue() * 1.8 +32.0;	
	}

	}
	
public String getInfo(){
	return "온도계 변환기 1.1";
}
}