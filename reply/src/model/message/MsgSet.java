package model.message;

import java.util.ArrayList;

import model.reply.ReplySet;

public class MsgSet {
	private MessageVO m;
	private ArrayList<ReplySet> rlist=new ArrayList<ReplySet>();
	public MessageVO getM() {
		return m;
	}
	public void setM(MessageVO m) {
		this.m = m;
	}
	public ArrayList<ReplySet> getRlist() {
		return rlist;
	}
	public void setRlist(ArrayList<ReplySet> rlist) {
		this.rlist = rlist;
	}
	@Override
	public String toString() {
		return "MsgSet [m=" + m + ", rlist=" + rlist + "]";
	}
}
