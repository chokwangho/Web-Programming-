//MesageListView�� ��â�� ��������ȣ, ��û�� �������� �޽������,��ü�޽��� ����, ����������, ���� �� ������ �޽��� ���� ���� ������ ���� Ŭ�����̴�.
//GetMessageListService���� ��ü�� ����Ѵ�.
package guestbook.service;

import java.util.List;

import guestbook.model.Message;

public class MessageListView {
	
	private int messageTotalCount; //�޽��� ��ü ����
	private int currentPageNumber; //���� ������ �ѹ�
	private List<Message> messageList; //��û�� �������� �޽��� ���
	private int pageTotalCount; //������ ��ä ����
	private int messageCountPerPage; //�������� �޼��� ����
	private int firstRow ; //ù��°��
	private int endRow; //��ళ��
	
	public MessageListView(List<Message> messageList, int messageTotalCount,// messageListView ������
			int currentPageNumber, int messageCountPerPage, int startRow, int endRow){
		this.messageList = messageList;
		this.messageTotalCount = messageTotalCount;
		this.currentPageNumber = currentPageNumber;
		this.messageCountPerPage = messageCountPerPage;
		this.firstRow = startRow;
		this.endRow = endRow;
	
		calculatePageTotalCount(); // ������ ��ü ���� ����Լ�
	}
	
	private void calculatePageTotalCount(){
		if(messageTotalCount == 0){
			pageTotalCount =0;
			
		}else {
			pageTotalCount = messageTotalCount / messageCountPerPage ; //�޼��� ��ü���� / �������� �޼��� ����
			if(messageTotalCount % messageCountPerPage>0){
				pageTotalCount++; // �������� ������ ���������� 1�� �� �߰�
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

