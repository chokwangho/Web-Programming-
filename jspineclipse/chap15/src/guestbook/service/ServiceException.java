//서비스클래스들이 MessageDao를 실행하다 오류가 발생하면 다음과같이 ServiceException이 발생하도록 한다.

package guestbook.service;

public class ServiceException extends RuntimeException {
	public ServiceException (String message, Exception cause){
		super(message,cause);
	}

	public ServiceException(String message){
		super(message);
	}
}
