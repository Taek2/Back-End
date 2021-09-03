package tag;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.JspFragment;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import model.DataBean;

public class MsgTagHandler extends SimpleTagSupport{
	private String bgcolor;
	private String border;
	
	public void doTag() throws IOException, JspException {
		JspWriter out = getJspContext().getOut();
		
		// 태그바디 받아오기 -> getJspBody()
		JspFragment body = getJspBody();
		// if(태그바디가 있다면)
		// body가 null이면 invoke 함수 수행할 때 익셉션 터짐
		// 고로 무조건 if문이 있어야함..!
		if(body != null) {
			out.println("<h1>");
			body.invoke(null); // 이건 머임?
			out.println("</h1>");
		}
		
		
		DataBean db = new DataBean();
		
		// 스트링 버퍼를 이용해보자!
		// 문자열을 버퍼에 저장해서 한번에 출력 => 효율 증가
	      StringBuffer sb=new StringBuffer();
	      sb.append("<table border=").append(border).append(" bgcolor=").append(bgcolor).append(">");
	      out.println(sb.toString());
	      
	    /*
		out.println("<table border=");
		out.println(border);
		out.println(" bgcolor=");
		out.println(bgcolor);
		out.println(">");
		*/
		for(String v:db.getDataList()) {
			out.println("<tr><td>"+ v + "</td></tr>");
		}
		out.println("</table>");
		
	}
	
	public String getBgcolor() {
		return bgcolor;
	}
	public void setBgcolor(String bgcolor) {
		this.bgcolor = bgcolor;
	}
	public String getBorder() {
		return border;
	}
	public void setBorder(String border) {
		this.border = border;
	}
	
	
}
