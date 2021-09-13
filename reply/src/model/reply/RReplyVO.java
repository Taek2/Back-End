package model.reply;

import java.sql.Date;

public class RReplyVO {
	private int rrnum;
	private Date rrdate;
	private String rrcontent;
	private String rrwriter;
	public int getRrnum() {
		return rrnum;
	}
	public void setRrnum(int rrnum) {
		this.rrnum = rrnum;
	}
	public Date getRrdate() {
		return rrdate;
	}
	public void setRrdate(Date rrdate) {
		this.rrdate = rrdate;
	}
	public String getRrcontent() {
		return rrcontent;
	}
	public void setRrcontent(String rrcontent) {
		this.rrcontent = rrcontent;
	}
	public String getRrwriter() {
		return rrwriter;
	}
	public void setRrwriter(String rrwriter) {
		this.rrwriter = rrwriter;
	}
	@Override
	public String toString() {
		return "RReplyVO [rrnum=" + rrnum + ", rrdate=" + rrdate + ", rrcontent=" + rrcontent + ", rrwriter=" + rrwriter
				+ "]";
	}
	
	
	
}
