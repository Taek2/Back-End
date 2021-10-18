package model.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class JDBC {
	public static Connection getConnection() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			return DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","oh","0000");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
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
	
