package chap11;
// �ؽ��� ����Ʈ, �� ����Ʈ, map ������ ������ְ�, ��ġ �µ� set, �µ� get ,ȭ���� �ٲ��ְ�, �����ִ� �Լ�
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
	return "�µ��� ��ȯ�� 1.1";
}
}