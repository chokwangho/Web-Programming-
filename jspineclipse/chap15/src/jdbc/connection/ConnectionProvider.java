//Connection을 제공
package jdbc.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class ConnectionProvider {
	public static Connection getConnection() throws SQLException{
			return DriverManager.getConnection("jdbc:apache:commons:dbcp:guestbook");//커넥션풀의 이름을 guestbook으로 설정
	}
}
