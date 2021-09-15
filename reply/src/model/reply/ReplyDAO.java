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
			String sql = "insert into reply(rnum, rcontent, rwriter, rmember, rmnum) values((SELECT NVL(MAX(rnum),0) + 1 FROM reply),?,?,?,?)";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, vo.getRcontent());
				pstmt.setString(2, vo.getRwriter());
				pstmt.setInt(3, vo.getRmember());
				pstmt.setInt(4,  vo.getRmnum());
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
		public boolean delete(ReplyVO vo) {
			conn = DBCP.connect();
			String sql = "delete from reply where rnum=?";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, vo.getRnum());
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
