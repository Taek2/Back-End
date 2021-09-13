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
		String sql = "insert into rreply(rrnum, rrcontent, rrwriter) values(?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getRrnum());
			pstmt.setString(2, vo.getRrcontent());
			pstmt.setString(3, vo.getRrwriter());
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
