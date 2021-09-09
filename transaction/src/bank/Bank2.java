package bank;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class Bank2 {
	private int bid;
	private String name;
	private int balance;
	public int getBid() {
		return bid;
	}
	public String getName() {
		return name;
	}
	public int getBalance() {
		return balance;
	}
	public void getBank2() {
		connect();
		String sql="select * from bank2";
		try {
			pstmt=conn.prepareStatement(sql);
			ResultSet rs=pstmt.executeQuery();
			rs.next();
			this.bid=rs.getInt("bid");
			name=rs.getString("name");
			balance=rs.getInt("balance");
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
	}
	
	Connection conn=null;
	PreparedStatement pstmt=null;
	
	public void connect() {
		try{
			Context initContext=new InitialContext();
			Context envContext=(Context)initContext.lookup("java:/comp/env");
			DataSource ds=(DataSource)envContext.lookup("jdbc/orcl");
			// ���α׷��Ӱ� �����ϴ� "���� ���յ�"�� -> ���α׷��� ����������!
			// �ڳ��� ������
		
			conn=ds.getConnection();
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
	public void disconnect() {
		try{
			pstmt.close();
			conn.close();
		}
		catch(Exception e){
			System.out.println(e);
		}
	}
}
