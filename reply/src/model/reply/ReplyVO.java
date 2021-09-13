package model.reply;

import java.sql.Date;

public class ReplyVO {
	private int rnum;
	private Date rdate;
	private String rcontent;
	private String rwriter;
	int rmember;
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
	@Override
	public String toString() {
		return "ReplyVO [rnum=" + rnum + ", rdate=" + rdate + ", rcontent=" + rcontent + ", rwriter=" + rwriter
				+ ", rmember=" + rmember + "]";
	}
	
	
}
