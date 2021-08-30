package model.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class JDBC {
	
	// PreparedStatement pstmt;
	public static Connection connect() {
		Connection conn = null;
		String jdbc_driver = "oracle.jdbc.driver.OracleDriver";
		String jdbc_url = "jdbc:oracle:thin:@localhost:1521:xe";
		try{
			Class.forName(jdbc_driver);
			conn=DriverManager.getConnection(jdbc_url,"oh","0000");
		}
		catch(Exception e){
			System.out.println("connect()에서 출력");
			e.printStackTrace();
		}
		return conn;
	}
	
	public static void disconnect(PreparedStatement pstmt, Connection conn) {
		try{
			pstmt.close();
			conn.close();
		}
		catch(Exception e){
			System.out.println("disconnect()에서 출력");
			e.printStackTrace();
		}
	}
		
}
