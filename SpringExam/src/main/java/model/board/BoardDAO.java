package model.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.common.JDBC;


public class BoardDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private final String insertSQL="INSERT INTO board (id, title, writer, content) values((SELECT NVL(MAX(id),0)+1 FROM board), ?, ?, ?)";
	private final String updateSQL="UPDATE board SET title=?, writer=?, content=?, wdate=sysdate WHERE id=? ";
	private final String deleteSQL="DELETE FROM board WHERE id=?";
	private final String getBoardSQL="SELECT * FROM board WHERE id=?";
	private final String getBoardListSQL="SELECT * FROM board order by id desc";
	
	public ArrayList<BoardVO> getBoardList() {
		System.out.println("DAO로 getboardList");
		Connection conn = JDBC.getConnection();
		ArrayList<BoardVO> datas = new ArrayList();
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(getBoardListSQL);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardVO data = new BoardVO();
				data.setId(rs.getInt("id"));
				data.setTitle(rs.getString("title"));
				data.setWriter(rs.getString("writer"));
				data.setContent(rs.getString("content"));
				data.setWdate(rs.getDate("wdate"));
				datas.add(data);
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
	
	public BoardVO getBoard(BoardVO vo) {
		System.out.println("DAO로 getboard");
		Connection conn=JDBC.getConnection();
		BoardVO data=null;
		PreparedStatement pstmt=null;
		try{
			pstmt=conn.prepareStatement(getBoardSQL);
			pstmt.setInt(1, vo.getId());
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()){
				data=new BoardVO();
				data.setId(rs.getInt("id"));
				data.setTitle(rs.getString("title"));
				data.setWriter(rs.getString("writer"));
				data.setContent(rs.getString("content"));
				data.setWdate(rs.getDate("wdate"));
			}
			
			rs.close();
		}
		catch(Exception e){
			System.out.println("getDBData()에서 출력");
			e.printStackTrace();
		}
		finally {
			JDBC.disconnect(pstmt,conn);
		}
		return data;
		
	}
	public boolean insertBoard(BoardVO vo) {
		System.out.println("DAO로 INSERT");
		Connection conn=JDBC.getConnection();
		boolean res = false;
		PreparedStatement pstmt=null;
		try{
			pstmt=conn.prepareStatement(insertSQL);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getWriter());
			pstmt.setString(3, vo.getContent());
			pstmt.executeUpdate();
			res=true;
		}
		catch(Exception e){
			System.out.println("insertDB()에서 출력");
			e.printStackTrace();
			//res=false;
		}
		finally {
			JDBC.disconnect(pstmt,conn);
		}
		return res;
	}
	
	public boolean updateBoard(BoardVO vo) {
		System.out.println("DAO로 UPDATE");
		Connection conn=JDBC.getConnection();
		boolean res=false;
		PreparedStatement pstmt=null;
		try{
			
			pstmt=conn.prepareStatement(updateSQL);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getWriter());
			pstmt.setString(3, vo.getContent());
			pstmt.setInt(4,vo.getId());
			pstmt.executeUpdate();
			res=true;
		}
		catch(Exception e){
			System.out.println("updateDB()에서 출력");
			e.printStackTrace();
			//res=false;
		}
		finally {
			JDBC.disconnect(pstmt,conn);
		}
		return res;
	}
	
	public boolean deleteBoard(BoardVO vo) {
		System.out.println("DAO로 DELETE");
		Connection conn=JDBC.getConnection();
		boolean res=false;
		PreparedStatement pstmt=null;
		try{
			pstmt=conn.prepareStatement(deleteSQL);
			pstmt.setInt(1, vo.getId());
			pstmt.executeUpdate();
			res=true;
		}
		catch(Exception e){
			System.out.println("deleteDB()에서 출력");
			e.printStackTrace();
			//res=false;
		}
		finally {
			JDBC.disconnect(pstmt,conn);
		}
		return res;
	}
	
	
}
