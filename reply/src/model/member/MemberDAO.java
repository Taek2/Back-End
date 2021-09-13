package model.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.common.DBCP;
import model.member.MemberVO;

public class MemberDAO {

	// selectAll
	public ArrayList<MemberVO> getDBList(){
		Connection conn = DBCP.connect();
		ArrayList<MemberVO> datas = new ArrayList();
		PreparedStatement pstmt = null;

		try {
			String sql = "select * from member order by memnum"; // 최근 게시글 상단 배치
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberVO vo = new MemberVO();
				vo.setMemnum(rs.getInt("memnum"));
				vo.setMid(rs.getString("mid"));
				vo.setMpw(rs.getString("mpw"));
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
	public MemberVO login(MemberVO vo) {
		Connection conn=DBCP.connect();
		MemberVO data=null;
		PreparedStatement pstmt=null;
		try{
			String sql="select * from member where mid=? and mpw=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getMpw());
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()){
				data=new MemberVO();
				data.setMemnum(rs.getInt("memnum"));
				data.setMid(rs.getString("mid"));
				data.setMpw(rs.getString("mpw"));
			}
			
			rs.close();
		}
		catch(Exception e){
			System.out.println("getDBData()에서 출력");
			e.printStackTrace();
		}
		finally {
			DBCP.disconnect(pstmt,conn);
		}
		return data;
	}
	// INSERT
	public boolean insertDB(MemberVO vo) {
		Connection conn=DBCP.connect();
		boolean res = false;
		PreparedStatement pstmt=null;
		try{
			// mnum == nvl, wdate == sysdate(현재 시간) 
			String sql="INSERT INTO member (memnum, mid, mpw) VALUES((SELECT NVL(MAX(memnum),0) + 1 FROM member), ?, ?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getMpw());
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

	public boolean deleteDB(MemberVO vo) {
		Connection conn=DBCP.connect();
		boolean res=false;
		PreparedStatement pstmt=null;
		try{
			String sql="delete from member where memnum=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getMemnum());
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
	public boolean updateDB(MemberVO vo) {
		Connection conn=DBCP.connect();
		boolean res=false;
		PreparedStatement pstmt=null;
		try{
			String sql="update member set mid=?, mpw=? where memnum=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getMpw());
			pstmt.setInt(3, vo.getMemnum());
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


}
