//�޽��� ��������� �����ϴ� EleteMessageService Ŭ���� 
/* 1. ������ ��ȣ�� �ش��ϴ� �޽����� �˻��Ѵ�. MessageDao.select()�޼��� ���
   2. �޽����� �������������� �ͼ��� �߻�
   3. �޽����� ��ȣ�� �����Ǿ� ���� ������ �ͼ��� �߻�
   4. �޽����� �޽����� �Ķ���ͷ� ���޹��� ��ȣ�� �ٸ��� �ͼ��� �߻�
   5. �޽����� �����Ѵ� . MessageDao.delete()�� ���
   - �޽��� ��������� �ټ� �����ѵ�, �� ������ �������� �ʴ� �޽����� �����Ϸ��� �õ��ϴ� ���� �߸��� ��ȣ�� �Է��� ��츦 ó���ϱ� �����̴�.
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
			conn.setAutoCommit(false);//Ʈ����� ����
			
			MessageDao messageDao = MessageDao.getInstance();
			Message message = messageDao.select(conn, messageId); //������  �ش��ϴ� �޽��� �˻��ؼ� �������� 
			if(message == null){ // message�� �������������� MessageNotFoundException����
				throw new MessageNotFoundException("�޽��� ����");
			}
			if(!message.matchPassword(password)){ // �޽����� ��й�ȣ�� ���������� invalidPasswordException����
				throw new InvalidPasswordException("bad password");
			}
			messageDao.delete(conn, messageId); // ������ID �� �ش��ϴ� �޽��� ����
			
			conn.commit();//Ʈ����� Ŀ��
		}catch(SQLException ex){
			JdbcUtil.rollback(conn);//���߿� SQLException�� �߻��ϸ� ���ѹ��ϰ� ���� ����
			throw new ServiceException("���� ����:"+ex.getMessage(),ex);
	}catch(InvalidPasswordException | MessageNotFoundException ex){ //���߿� �޽����� ���ų� ��ȣ�� ��ġ�����ʾ� �ͼ����̹߻��ϸ� �ѹ��Ű�� �ͼ����� ��߻��Ѵ�.
		JdbcUtil.rollback(conn);
		throw ex;
	}finally {
		JdbcUtil.close(conn);
	}
	}
}
