package model.message;

import java.sql.Date;

public class MessageVO {
	private int mnum;
	private String writer;
	private String title;
	private String content;
	private Date wdate;
	private String path;
	private int member;
	private int favor;
	private int reply;
	
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public int getMember() {
		return member;
	}
	public void setMember(int member) {
		this.member = member;
	}
	public int getMnum() {
		return mnum;
	}
	public void setMnum(int mnum) {
		this.mnum = mnum;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getWdate() {
		return wdate;
	}
	public void setWdate(Date wdate) {
		this.wdate = wdate;
	}
	
	public int getFavor() {
		return favor;
	}
	public void setFavor(int favor) {
		this.favor = favor;
	}
	public int getReply() {
		return reply;
	}
	public void setReply(int reply) {
		this.reply = reply;
	}
	@Override
	public String toString() {
		return "MessageVO [mnum=" + mnum + ", writer=" + writer + ", title=" + title + ", content=" + content
				+ ", wdate=" + wdate + ", path=" + path + ", member=" + member + "]";
	}
	
	
	
}
