package model.bank;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.common.JDBC;
import model.bank.BankVO;

public class BankDAO {
	public ArrayList<BankVO> getDBList(){
		Connection conn= null;
		PreparedStatement pstmt=null;
		ArrayList<BankVO> datas = new ArrayList();	

		try {
			conn=JDBC.connect();
			String sql = "select * from bank order by bid"; // 최근 게시글 상단 배치
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				BankVO vo = new BankVO();
				vo.setBid(rs.getInt("bid"));
				vo.setName(rs.getString("name"));
				vo.setBalance(rs.getInt("balance"));
				datas.add(vo);
			}
			rs.close();
		}

		catch(Exception e) {
			System.out.println("getDBList()에서 출력");
			e.printStackTrace();
		}
		finally {
			JDBC.disconnect(pstmt, conn);
		}
		return datas;
	}
	
	public boolean trans(BankVO vo1, BankVO vo2) {
		Connection conn= null;
		PreparedStatement pstmt=null;
		try {
			conn=JDBC.connect();
			conn.setAutoCommit(false); // set autocommit=0;
			String sql1="update bank set balance=balance-? where name=?";
			String sql2="update bank set balance=balance+? where name=?";
			pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, vo2.getBalance());
			pstmt.setString(2, vo1.getName());
			pstmt.executeUpdate();
			pstmt=conn.prepareStatement(sql2);
			pstmt.setInt(1, vo2.getBalance());
			pstmt.setString(2, vo2.getName());
			pstmt.executeUpdate();
			String sql= "select balance from bank where name=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, vo1.getName());
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
		}

		catch(Exception e) {
			System.out.println("trans()에서 출력");
			e.printStackTrace();
		}
		finally {
			JDBC.disconnect(pstmt, conn);
		}
		return true;
	}
	
	
}
