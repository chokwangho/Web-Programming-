//메시지 삭제기능을 제공하는 EleteMessageService 클래스 
/* 1. 지정한 번호에 해당하는 메시지를 검색한다. MessageDao.select()메서드 사용
   2. 메시지가 존재하지않으면 익셉션 발생
   3. 메시지에 암호가 지정되어 있지 않으면 익셉션 발생
   4. 메시지의 메시지와 파라미터로 전달받은 암호가 다르면 익셉션 발생
   5. 메시지를 삭제한다 . MessageDao.delete()를 사용
   - 메시지 삭제기능은 다소 복잡한데, 그 이유는 존재하지 않는 메시지를 삭제하려고 시도하는 경우와 잘못된 암호를 입력한 경우를 처리하기 때문이다.
 */

package guestbook.service;

import java.sql.Connection;
import java.sql.SQLException;

import guestbook.dao.MessageDao;
import guestbook.model.Message;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

public class DeleteMessageService {
	
	private static DeleteMessageService instance = new DeleteMessageService();
	
	public static DeleteMessageService getInstance() {
		return instance;
	}
	
	private DeleteMessageService(){}

	public void deleteMessage(int messageId, String password){
		Connection conn = null;
		try{ 
			conn= ConnectionProvider.getConnection();
			conn.setAutoCommit(false);//트랜잭션 시작
			
			MessageDao messageDao = MessageDao.getInstance();
			Message message = messageDao.select(conn, messageId); //삭제에  해당하는 메시지 검색해서 가져오기 
			if(message == null){ // message가 존재하지않으면 MessageNotFoundException실행
				throw new MessageNotFoundException("메시지 없음");
			}
			if(!message.matchPassword(password)){ // 메시지가 비밀번호가 맞지않으면 invalidPasswordException실행
				throw new InvalidPasswordException("bad password");
			}
			messageDao.delete(conn, messageId); // 지정한ID 에 해당하는 메시지 삭제
			
			conn.commit();//트랜잭션 커밋
		}catch(SQLException ex){
			JdbcUtil.rollback(conn);//도중에 SQLException이 발생하면 ㅌ롤백하고 에러 실행
			throw new ServiceException("삭제 실패:"+ex.getMessage(),ex);
	}catch(InvalidPasswordException | MessageNotFoundException ex){ //도중에 메시지가 없거나 암호가 일치하지않아 익셉션이발생하면 롤백시키고 익셉션을 재발생한다.
		JdbcUtil.rollback(conn);
		throw ex;
	}finally {
		JdbcUtil.close(conn);
	}
	}
}
