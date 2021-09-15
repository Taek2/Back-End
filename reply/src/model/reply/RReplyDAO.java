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
		String sql = "insert into rreply(rrpk, rrnum, rrcontent, rrwriter, rrmember) values((SELECT NVL(MAX(rrpk),0) + 1 FROM rreply),?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getRrnum());
			pstmt.setString(2, vo.getRrcontent());
			pstmt.setString(3, vo.getRrwriter());
			pstmt.setInt(4,  vo.getRrmember());
			pstmt.executeUpdate();
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
		String sql = "delete from rreply where rrpk=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getRrpk());
			pstmt.executeUpdate();
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
