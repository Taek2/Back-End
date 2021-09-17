package model.reply;

import java.sql.Date;

public class ReplyVO {
	private int rnum;
	private Date rdate;
	private String rcontent;
	private String rwriter;
	int rmember;
	int rmnum;
	int rreply;
	
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public Date getRdate() {
		return rdate;
	}
	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}
	public String getRcontent() {
		return rcontent;
	}
	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}
	public String getRwriter() {
		return rwriter;
	}
	public void setRwriter(String rwriter) {
		this.rwriter = rwriter;
	}
	public int getRmember() {
		return rmember;
	}
	public void setRmember(int rmember) {
		this.rmember = rmember;
	}
	
	
	public int getRmnum() {
		return rmnum;
	}
	public void setRmnum(int rmnum) {
		this.rmnum = rmnum;
	}
	public int getRreply() {
		return rreply;
	}
	public void setRreply(int rreply) {
		this.rreply = rreply;
	}
	@Override
	public String toString() {
		return "ReplyVO [rnum=" + rnum + ", rdate=" + rdate + ", rcontent=" + rcontent + ", rwriter=" + rwriter
				+ ", rmember=" + rmember + "]";
	}
	
	
}
