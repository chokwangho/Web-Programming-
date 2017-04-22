//새로운 메시지를 등록하는 기능이다.
/*WriteMessageService 클래스는 별도 로직을 수행하지않고  MessageDao의 insert()메서드를 실행한다. */
package guestbook.service;

import java.sql.Connection;
import java.sql.SQLException;

import guestbook.dao.MessageDao;
import guestbook.model.Message;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

public class WriteMessageService {
	private static WriteMessageService instance = new WriteMessageService();

	public static WriteMessageService getInstance(){
		return instance;
	}
	
	private WriteMessageService(){}
	
	public void write(Message message){
		Connection conn = null;
		try{
			conn= ConnectionProvider.getConnection();
			MessageDao messageDao = MessageDao.getInstance();
			messageDao.insert(conn, message);
		}catch(SQLException e){
			throw new ServiceException("메시지 등록 실패:"+e.getMessage(),e);
		}finally{
			JdbcUtil.close(conn);
		}
	}
}
