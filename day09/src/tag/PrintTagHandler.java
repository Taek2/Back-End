package tag;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.JspFragment;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class PrintTagHandler extends SimpleTagSupport{
	private String color;
	private String fontSize;
	
	public void doTag() throws IOException, JspException {
		JspWriter out = getJspContext().getOut();
		
		// 태그바디 받아오기 -> getJspBody()
		JspFragment body = getJspBody();
		// if(태그바디가 있다면)
		// body가 null이면 invoke 함수 수행할 때 익셉션 터짐
		// 고로 무조건 if문이 있어야함..!
		if(body != null) {
			out.println("<h1 style='");
			out.println("color:" + color);
			out.println("; font-size:" + fontSize);
			out.println("'>");
			body.invoke(null); // 이건 머임?
			out.println("</h1>");
		}
		 /*
		out.println("<table border=");
		out.println(border);
		out.println(" bgcolor=");
		out.println(bgcolor);
		out.println(">");
		*/
		
		
		
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getFontSize() {
		return fontSize;
	}

	public void setFontSize(String fontSize) {
		this.fontSize = fontSize;
	}
	

	
	
}
