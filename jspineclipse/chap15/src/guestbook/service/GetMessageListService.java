//방명록에 등록된 메시지 목록을 제공하는 클래스이다
/*GetMessageListService는 다음 순서로 필요한 작업을 실행한다.
1.전체 메시지 개수를 구한다. MessageDao의 selectCount() 메서드를 사용한다.
2.요청한 페이지 번호에 해당하는 메시지의 시작 행과 끝행을 구한다.
3.시작 행과 끝 행에 포함된 메시지 목록을 구한다. MessagDao의 selectLsit()메서드를 사용한다.
4.MessageViewList 객체를 리턴한다.
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


public class GetMessageListService { //GetMessageListService 생성자

	private static GetMessageListService instance = new GetMessageListService();

	public static GetMessageListService getInstance(){
		return instance;
	}



	private GetMessageListService(){
	}

	private static final int MESSAGE_COUNT_PER_PAGE = 3; // 페이지당 메시지개수 3으로 지정
	
	public MessageListView  getMessageList(int pageNumber){
		Connection conn = null;
		int currentPageNumber = pageNumber;
		try{
			conn =ConnectionProvider.getConnection(); //connection객체 
			MessageDao messageDao = MessageDao.getInstance();//MessageDao 객체
			
			int messageTotalCount = messageDao.selectCount(conn); // 메세지 전체 개수를 connection객체를 보내서 알아온다
			
			List<Message> messageList = null;
			int firstRow = 0;
			int endRow = 0;
			if(messageTotalCount > 0){ //메세지 개수가 0보다 크면 firstRow와 endRow 를 구하고, messageDao에서 messageList를 select해라
				firstRow = (pageNumber-1) * MESSAGE_COUNT_PER_PAGE +1 ;
				endRow = firstRow+ MESSAGE_COUNT_PER_PAGE -1 ;
				messageList = messageDao.selectList(conn, firstRow, endRow);
			}else { //0이면 메세지 리스트가 비어있다고 해라
				currentPageNumber =0;
				messageList = Collections.emptyList();
			}// MesagdList에 바뀐 값을 넣어서 return시켜라
			return new MessageListView(messageList, messageTotalCount, currentPageNumber,MESSAGE_COUNT_PER_PAGE, firstRow,endRow); 
		}catch(SQLException e){
			throw new ServiceException("목록 구하기 실패:"+e.getMessage(),e);
		}finally {
			JdbcUtil.close(conn);
		}
	}
	
}
