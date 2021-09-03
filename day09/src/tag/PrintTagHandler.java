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
		
		// �±׹ٵ� �޾ƿ��� -> getJspBody()
		JspFragment body = getJspBody();
		// if(�±׹ٵ� �ִٸ�)
		// body�� null�̸� invoke �Լ� ������ �� �ͼ��� ����
		// ��� ������ if���� �־����..!
		if(body != null) {
			out.println("<h1 style='");
			out.println("color:" + color);
			out.println("; font-size:" + fontSize);
			out.println("'>");
			body.invoke(null); // �̰� ����?
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
