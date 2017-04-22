//GUESTBOOK_MESSAGE 테이블에 대한 쿼리를 실행한다

package guestbook.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import guestbook.model.Message;
import jdbc.JdbcUtil;
public class MessageDao { //MESSAGE DAO 객체 생성
	
	private static MessageDao messageDao =new MessageDao();
	public static MessageDao getInstance(){
		return messageDao;
	}

	private MessageDao(){}
	
	public int insert(Connection conn,Message message) throws SQLException { //INSERT문 실행
		PreparedStatement pstmt = null;
		try{
			pstmt = conn.prepareStatement("insert into guestbook_message"+"(guest_name,password,message) values (?,?,?)");
			pstmt.setString(1, message.getGuestname());
			pstmt.setString(2, message.getPassword());
			pstmt.setString(3, message.getMessage());
			return pstmt.executeUpdate();
		}finally{
			JdbcUtil.close(pstmt);
		}
	}
	
	public Message select(Connection conn,int messageId) throws SQLException { //SELECT문 실행
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		try{
			pstmt= conn.prepareStatement("select * from guestbook_message where message_id =?");
					pstmt.setInt(1, messageId);
					rs=pstmt.executeQuery();
					if(rs.next()){
						return makeMessageFromResultSet(rs); //반환된 객체 반환
					}else {
						return null;
					}
				
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}

	private Message makeMessageFromResultSet(ResultSet rs) throws SQLException {//메세지 객체에다가 객체값 넣어서 반환해주기
		Message message = new Message();//메세지 객체 생성
		message.setId(rs.getInt("message_id")); //테이블에서 넣기
		message.setGuestname(rs.getString("guest_name"));
		message.setPassword(rs.getString("password"));
		message.setMessage(rs.getString("message"));
		
		return message;
	}

	public int selectCount(Connection conn) throws SQLException {//slect회수 반환, 테이블값에서  count는 실행될때마다 자동으로 1씩 추가 된다
		Statement stmt = null;
		ResultSet rs = null;
		try{
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) from guestbook_message");
			rs.next();
			return rs.getInt(1);
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}
	}

	public List<Message> selectList(Connection conn, int firstRow, int endRow) throws SQLException { //내림차순 정렬해서 어디서부터 어디까지 (firstRow-1)행부터 endRow개의 행 조회 //select문 실행
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			pstmt = conn.prepareStatement("select * from geustbook_message" + "order by message_id desc limit ?,?");
			pstmt.setInt(1, firstRow -1);
			pstmt.setInt(2, endRow-firstRow+1);
			rs= pstmt.executeQuery();
			if(rs.next()){
				List<Message> messageList = new ArrayList<Message>();
				do{
					messageList.add(makeMessageFromResultSet(rs));
					
				}while(rs.next());
				return messageList;
			}else {
				return Collections.emptyList();
			}
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}

	public int delete(Connection conn, int messageId) throws SQLException { //DELETE문 실행
		PreparedStatement pstmt=null;
		try{
			pstmt = conn.prepareStatement("delete from geustbook_message where message_id=?");
			pstmt.setInt(1, messageId);
			return pstmt.executeUpdate();
					
		}finally{
			JdbcUtil.close(pstmt);
		}
	}
}
