package bank;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class Bank1 { // VO+DAO -> 빈즈 컴포넌트
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
	
	public void getBank1() {
		connect();
		String sql="select * from bank1";
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
			// 프로그래머가 지향하는 "낮은 결합도"★ -> 프로그램이 유연해진다!
			// ★높은 응집도
		
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
	
	public boolean trans(int bal) {
		connect();
		try {
			conn.setAutoCommit(false); // set autocommit=0;
			String sql1="update bank1 set balance=balance-? where bid=1001";
			String sql2="update bank2 set balance=balance+? where bid=2001";
			pstmt=conn.prepareStatement(sql1);
			pstmt.setInt(1, bal);
			pstmt.executeUpdate();
			pstmt=conn.prepareStatement(sql2);
			pstmt.setInt(1, bal);
			pstmt.executeUpdate();
			String sql= "select balance from bank1 where bid=1001";
			pstmt=conn.prepareStatement(sql);
			ResultSet rs=pstmt.executeQuery();
			rs.next();
			if(rs.getInt(1)<0) { // 잔액이 0미만이면,
				conn.rollback();
				return false;
			}
			else {
				conn.commit(); // commit;
			}
			
			conn.setAutoCommit(true); // set autocommit=0;			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
				
		return true;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
