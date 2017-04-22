//MesageListView는 요창한 페이지번호, 요청한 페이지의 메시지목록,전체메시지 개수, 페이지개수, 페이 당 보여줄 메시지 개수 등의 정보를 담은 클래스이다.
//GetMessageListService에서 객체로 사용한다.
package guestbook.service;

import java.util.List;

import guestbook.model.Message;

public class MessageListView {
	
	private int messageTotalCount; //메시지 전체 개수
	private int currentPageNumber; //현재 페이지 넘버
	private List<Message> messageList; //요청한 페이지의 메시지 목록
	private int pageTotalCount; //페이지 전채 개수
	private int messageCountPerPage; //페이지당 메세지 개수
	private int firstRow ; //첫번째행
	private int endRow; //몇개행개수
	
	public MessageListView(List<Message> messageList, int messageTotalCount,// messageListView 생성자
			int currentPageNumber, int messageCountPerPage, int startRow, int endRow){
		this.messageList = messageList;
		this.messageTotalCount = messageTotalCount;
		this.currentPageNumber = currentPageNumber;
		this.messageCountPerPage = messageCountPerPage;
		this.firstRow = startRow;
		this.endRow = endRow;
	
		calculatePageTotalCount(); // 페이지 전체 개수 계산함수
	}
	
	private void calculatePageTotalCount(){
		if(messageTotalCount == 0){
			pageTotalCount =0;
			
		}else {
			pageTotalCount = messageTotalCount / messageCountPerPage ; //메세지 전체개수 / 페이지당 메세지 개수
			if(messageTotalCount % messageCountPerPage>0){
				pageTotalCount++; // 나머지가 있으면 페이지수를 1개 더 추가
			}
		}
	}

	public int getMessageTotalCount(){
		return messageTotalCount;
	}
	
	public int getCurrentPageNumber(){
		return currentPageNumber;
	}
	public List<Message> getMessageList(){
		return messageList;
	}
	
	public int getpageTotalCount(){
		return pageTotalCount;
	}

	public int getMessageCountPerPage(){
		return messageCountPerPage;
	}
	
	public int getFirstRow(){
		return firstRow;
	}
	
	public int getEndRow(){
		return endRow;
	}

	public boolean isEmpty(){
		return messageTotalCount == 0;
	}
}

