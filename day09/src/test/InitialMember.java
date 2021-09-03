package test;

import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class InitialMember implements ServletContextListener{

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		// DB 데이터를 생성할 예정
		// -> Member.java
		
		ArrayList<Member> datas = new ArrayList<Member>();
		
		for(int i = 1; i < 5 ; i++) {
			Member data = new Member("티모"+i, "timo"+ i +"@naver.com");
			datas.add(data);
		}
		datas.add(new Member("아리", null));
		datas.add(new Member("아무무", null));
		
		// 현재 만든 데이터들은 톰캣이 시작될  때 생성,
		// scope: application에 저장하고 싶다. -> 톰캣 종료까지 데이터 유지
		
		ServletContext context = sce.getServletContext();
		context.setAttribute("members", datas);
		context.setAttribute("member", new Member());
		// application scope에 저장	
		
	}
	
}
