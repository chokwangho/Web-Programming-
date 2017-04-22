//guestbook_message ���̺��� �о�� ���� �����ϰų� �Ǵ� ����ڰ� �Է��� ���� DAO�� �������ش�.

package guestbook.model;


public class Message {

	private int id;
	private String guest_name;
	private String password;
	private String message;
	
	public int getId(){
		return id;
	}
	
	public void setId(int id){
		this.id=id;
	}
	
	public String getGuestname(){
		return guest_name;
	}
	public void setGuestname(String guest_name){
		this.guest_name=guest_name;
		
	}
	
	public String getPassword(){
		return password;
	}
	public void setPassword(String password){
		this.password=password;
	}
	public String getMessage(){
		return message;
	}
	public  void setMessage(String message){
		this.message=message;
	}
	
	public boolean hasPassword(){
		return password != null && !password.isEmpty();
	}
	
	public boolean matchPassword(String pwd){
		return password != null && password.equals(pwd);
	}
}
