//���Ͽ� ��ϵ� �޽��� ����� �����ϴ� Ŭ�����̴�
/*GetMessageListService�� ���� ������ �ʿ��� �۾��� �����Ѵ�.
1.��ü �޽��� ������ ���Ѵ�. MessageDao�� selectCount() �޼��带 ����Ѵ�.
2.��û�� ������ ��ȣ�� �ش��ϴ� �޽����� ���� ��� ������ ���Ѵ�.
3.���� ��� �� �࿡ ���Ե� �޽��� ����� ���Ѵ�. MessagDao�� selectLsit()�޼��带 ����Ѵ�.
4.MessageViewList ��ü�� �����Ѵ�.
*/

package guestbook.service;

import java.sql.Connection;
import java.sql.SQLException;

import java.util.Collections;
import java.util.List;

import guestbook.dao.MessageDao;
import guestbook.model.Message;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;


public class GetMessageListService { //GetMessageListService ������

	private static GetMessageListService instance = new GetMessageListService();

	public static GetMessageListService getInstance(){
		return instance;
	}



	private GetMessageListService(){
	}

	private static final int MESSAGE_COUNT_PER_PAGE = 3; // �������� �޽������� 3���� ����
	
	public MessageListView  getMessageList(int pageNumber){
		Connection conn = null;
		int currentPageNumber = pageNumber;
		try{
			conn =ConnectionProvider.getConnection(); //connection��ü 
			MessageDao messageDao = MessageDao.getInstance();//MessageDao ��ü
			
			int messageTotalCount = messageDao.selectCount(conn); // �޼��� ��ü ������ connection��ü�� ������ �˾ƿ´�
			
			List<Message> messageList = null;
			int firstRow = 0;
			int endRow = 0;
			if(messageTotalCount > 0){ //�޼��� ������ 0���� ũ�� firstRow�� endRow �� ���ϰ�, messageDao���� messageList�� select�ض�
				firstRow = (pageNumber-1) * MESSAGE_COUNT_PER_PAGE +1 ;
				endRow = firstRow+ MESSAGE_COUNT_PER_PAGE -1 ;
				messageList = messageDao.selectList(conn, firstRow, endRow);
			}else { //0�̸� �޼��� ����Ʈ�� ����ִٰ� �ض�
				currentPageNumber =0;
				messageList = Collections.emptyList();
			}// MesagdList�� �ٲ� ���� �־ return���Ѷ�
			return new MessageListView(messageList, messageTotalCount, currentPageNumber,MESSAGE_COUNT_PER_PAGE, firstRow,endRow); 
		}catch(SQLException e){
			throw new ServiceException("��� ���ϱ� ����:"+e.getMessage(),e);
		}finally {
			JdbcUtil.close(conn);
		}
	}
	
}
