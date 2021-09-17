package model.reply;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import model.common.DBCP;

public class ReplyDAO {
	
		Connection conn;
		PreparedStatement pstmt;
		public boolean insert(ReplyVO vo) {
			conn = DBCP.connect();
			String sql1 = "insert into reply(rnum, rcontent, rwriter, rmember, rmnum) values((SELECT NVL(MAX(rnum),0) + 1 FROM reply),?,?,?,?)";
			String sql2 = "update message set reply=reply+1 where mnum=?";
			try {
				conn.setAutoCommit(false);
				pstmt = conn.prepareStatement(sql1);
				pstmt.setString(1, vo.getRcontent());
				pstmt.setString(2, vo.getRwriter());
				pstmt.setInt(3, vo.getRmember());
				pstmt.setInt(4,  vo.getRmnum());
				pstmt.executeUpdate();
				
				pstmt = conn.prepareStatement(sql2);
				pstmt.setInt(1, vo.getRmnum());
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
		public boolean delete(ReplyVO vo) {
			conn = DBCP.connect();
			String sql1 = "delete from reply where rnum=?";
			String sql2 = "update message set reply=reply-? where mnum=?";
			try {
				conn.setAutoCommit(false);
				pstmt = conn.prepareStatement(sql1);
				pstmt.setInt(1, vo.getRnum());
				pstmt.executeUpdate();
				
				pstmt = conn.prepareStatement(sql2);
				pstmt.setInt(1, vo.getRreply() + 1);
				pstmt.setInt(2, vo.getRmnum());
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
