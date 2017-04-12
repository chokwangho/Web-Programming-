package jdbc;

import javax.servlet.http.HttpServlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;

public class MySQLDrvierLoader extends HttpServlet {

	public void init(ServletConfig config) throws ServletException{
		try{
				Class.forName("com.mysql.jdbc.Drvier");
		}catch(Exception ex){
			throw new ServletException(ex);
		}
	}
}
