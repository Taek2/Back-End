package model.reply;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import model.common.DBCP;

public class RReplyDAO {
	Connection conn;
	PreparedStatement pstmt;
	public boolean insert(RReplyVO vo) {
		conn = DBCP.connect();
		String sql1 = "insert into rreply(rrpk, rrnum, rrcontent, rrwriter, rrmember, rrmnum) values((SELECT NVL(MAX(rrpk),0) + 1 FROM rreply),?,?,?,?,?)";
		String sql2 = "update message set reply=reply+1 where mnum=?";
		String sql3 = "update reply set rreply=rreply+1 where rnum=?";
		
		try {
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, vo.getRrnum());
			pstmt.setString(2, vo.getRrcontent());
			pstmt.setString(3, vo.getRrwriter());
			pstmt.setInt(4,  vo.getRrmember());
			pstmt.setInt(5,  vo.getRrmnum());
			pstmt.executeUpdate();
			
			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1, vo.getRrmnum());
			pstmt.executeUpdate();
			
			pstmt = conn.prepareStatement(sql3);
			pstmt.setInt(1, vo.getRrnum());
			pstmt.executeUpdate();
			
			conn.commit();
			conn.setAutoCommit(true);
			
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return true;
	}
	
	public boolean delete(RReplyVO vo) {
		conn = DBCP.connect();
		String sql1 = "delete from rreply where rrpk=?";
		String sql2 = "update message set reply=reply-1 where mnum=?";
		String sql3 = "update reply set rreply=rreply-1 where rnum=?";
		try {
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, vo.getRrpk());
			pstmt.executeUpdate();
			
			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1, vo.getRrmnum());
			pstmt.executeUpdate();
			
			pstmt = conn.prepareStatement(sql3);
			pstmt.setInt(1, vo.getRrnum());
			pstmt.executeUpdate();
			
			conn.commit();
			conn.setAutoCommit(true);
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return true;
	}
}
