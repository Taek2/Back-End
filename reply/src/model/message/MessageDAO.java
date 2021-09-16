package model.message;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.common.DBCP;
import model.reply.RReplyVO;
import model.reply.ReplySet;
import model.reply.ReplyVO;

public class MessageDAO {

	// selectAll
	public ArrayList<MessageVO> getDBList(String uid, int cnt){
		Connection conn = DBCP.connect();
		ArrayList<MessageVO> datas = new ArrayList();
		PreparedStatement pstmt = null;
		String sql;

		try {
			if((uid == null) || (uid.equals(""))) {
				sql = "select * from ( select * from message order by wdate desc ) where ROWNUM <= ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, cnt);
			}
			// 특정 회원
			else{
				sql = "select * from ( select * from message where member=? order by wdate desc )where ROWNUM <= ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,uid);
				pstmt.setInt(2,cnt);
			}
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				MessageVO vo = new MessageVO();
				vo.setContent(rs.getString("content"));
				vo.setMnum(rs.getInt("mnum"));
				vo.setTitle(rs.getString("title"));
				vo.setWdate(rs.getDate("wdate"));
				vo.setWriter(rs.getString("writer"));
				vo.setMember(rs.getInt("member"));
				vo.setPath(rs.getString("path"));
				vo.setFavor(rs.getInt("favor"));
				vo.setReply(rs.getInt("reply"));
				datas.add(vo);
			}
			rs.close();
		}

		catch(Exception e) {
			System.out.println("getDBList()에서 출력");
			e.printStackTrace();
		}
		finally {
			DBCP.disconnect(pstmt, conn);
		}
		return datas;
	}

	// selectOne
	public MsgSet getDBData(MessageVO vo) {
		Connection conn=DBCP.connect();
		MessageVO data=null;
		MsgSet result = new MsgSet();
		
		ArrayList<ReplySet> rlist=new ArrayList<ReplySet>();
		PreparedStatement pstmt=null;
		try{
			String sql="select * from message where mnum=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getMnum());
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()){
				data=new MessageVO();
				data.setContent(rs.getString("content"));
				data.setMnum(rs.getInt("mnum"));
				data.setTitle(rs.getString("title"));
				data.setWdate(rs.getDate("wdate"));
				data.setWriter(rs.getString("writer"));
				data.setMember(rs.getInt("member"));
				data.setPath(rs.getString("path"));
				data.setFavor(rs.getInt("favor"));
				data.setReply(rs.getInt("reply"));
				String rsql = "select * from reply where rmnum=? order by rdate";
				pstmt = conn.prepareStatement(rsql);
				pstmt.setInt(1, rs.getInt("mnum"));
				ResultSet rrs = pstmt.executeQuery();
				
				while(rrs.next()) {
					ArrayList<RReplyVO> rrlist = new ArrayList<RReplyVO>();
					ReplySet rset = new ReplySet();
					ReplyVO r = new ReplyVO();
					r.setRnum(rrs.getInt("rnum"));
					r.setRdate(rrs.getDate("rdate"));
					r.setRwriter(rrs.getString("rwriter"));
					r.setRcontent(rrs.getString("rcontent"));
					r.setRmember(rrs.getInt("rmember"));
					r.setRmnum(rrs.getInt("rmnum"));
					r.setRreply(rrs.getInt("rreply"));
					
					String rrsql = "select * from rreply where rrnum=? order by rrdate";
					pstmt = conn.prepareStatement(rrsql);
					pstmt.setInt(1, rrs.getInt("rnum"));
					ResultSet rrrs = pstmt.executeQuery();
					
					while(rrrs.next()) {
						RReplyVO rr = new RReplyVO();
						rr.setRrnum(rrrs.getInt("rrnum"));
						rr.setRrdate(rrrs.getDate("rrdate"));
						rr.setRrwriter(rrrs.getString("rrwriter"));
						rr.setRrcontent(rrrs.getString("rrcontent"));
						rr.setRrpk(rrrs.getInt("rrpk"));
						rr.setRrmember(rrrs.getInt("rrmember"));
						rrlist.add(rr);
					}
					rset.setR(r);
					rset.setRrlist(rrlist);
					rlist.add(rset);
					System.out.println(rlist);
					rrrs.close();
				}
				
				rrs.close();		
			}
			result.setM(data);
			result.setRlist(rlist);
			System.out.println("result => " + result);
			rs.close();
		}
		catch(Exception e){
			System.out.println("getDBData()에서 출력");
			e.printStackTrace();
		}
		finally {
			DBCP.disconnect(pstmt,conn);
		}
		return result;
	}
	// INSERT
	public boolean insertDB(MessageVO vo) {
		Connection conn=DBCP.connect();
		boolean res = false;
		PreparedStatement pstmt=null;
		try{
			// mnum == nvl, wdate == sysdate(현재 시간) 
			String sql="INSERT INTO message (mnum, writer, title, content, member, path, favor, wdate) VALUES((SELECT NVL(MAX(mnum),0) + 1 FROM message), ?, ?, ?, ?, ?, ?, sysdate)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, vo.getWriter());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContent());
			pstmt.setInt(4, vo.getMember());
			pstmt.setString(5, vo.getPath());
			pstmt.setInt(6, vo.getFavor());
			pstmt.executeUpdate();
			res=true;
		}
		catch(Exception e){
			System.out.println("insertDB()에서 출력");
			e.printStackTrace();
			//res=false;
		}
		finally {
			DBCP.disconnect(pstmt,conn);
		}
		return res;
	}

	public boolean deleteDB(MessageVO vo) {
		Connection conn=DBCP.connect();
		boolean res=false;
		PreparedStatement pstmt=null;
		try{
			String sql="delete from message where mnum=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getMnum());
			pstmt.executeUpdate();
			res=true;
		}
		catch(Exception e){
			System.out.println("deleteDB()에서 출력");
			e.printStackTrace();
			//res=false;
		}
		finally {
			DBCP.disconnect(pstmt,conn);
		}
		return res;
	}

	// update
	public boolean updateDB(MessageVO vo) {
		Connection conn=DBCP.connect();
		boolean res=false;
		PreparedStatement pstmt=null;
		try{
			String sql="update message set writer=?, title=?, content=?, member=?, path=?, wdate=sysdate where mnum=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, vo.getWriter());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContent());
			pstmt.setInt(4,  vo.getMember());
			pstmt.setString(5, vo.getPath());
			pstmt.setInt(6, vo.getMnum());
			
			pstmt.executeUpdate();
			res=true;
		}
		catch(Exception e){
			System.out.println("updateDB()에서 출력");
			e.printStackTrace();
			//res=false;
		}
		finally {
			DBCP.disconnect(pstmt,conn);
		}
		return res;
	}
	
	public void favorUp(MessageVO vo) {
		Connection conn=DBCP.connect();
		PreparedStatement pstmt=null;
		try{
			String sql="update message set favor = favor + 1 where mnum=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getMnum());
			pstmt.executeUpdate();
		}
		catch(Exception e){
			System.out.println("favorUp()에서 출력");
			e.printStackTrace();
			//res=false;
		}
		finally {
			DBCP.disconnect(pstmt,conn);
		}
		return;
	}
	
	


}
