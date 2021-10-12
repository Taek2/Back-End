package com.oh.app.common;

import java.util.List;
import java.util.Scanner;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import model.board.BoardService;
import model.board.BoardVO;
import model.member.MemberService;
import model.member.MemberVO;

public class Client {
	public static void main(String[] args) {
		AbstractApplicationContext factory=new GenericXmlApplicationContext("applicationContext.xml");
		
		BoardService bs=(BoardService)factory.getBean("boardService");
		MemberService ms=(MemberService)factory.getBean("memberService");
		Scanner sc = new Scanner(System.in);
		MemberVO mvo = new MemberVO();
		
		// 회원가입
		System.out.println("=== 회원가입 === ");
		System.out.print("아이디: ");
		String id = sc.next();
		System.out.print("비밀번호: ");
		String pw = sc.next();
		System.out.print("이름: ");
		String name = sc.next();
		mvo.setId(id);
		mvo.setPassword(pw);
		mvo.setName(name);
		mvo.setRole("user");
		ms.insertMember(mvo);
		
		// 멤버 로그인	
		System.out.println("=== 로그인 === ");
		System.out.print("아이디: ");
		id = sc.next();
		System.out.print("비밀번호: ");
		pw = sc.next();
		mvo.setId(id);
		mvo.setPassword(pw);
		ms.getMember(mvo);
		
//		// 로그인 테스트
//		mvo.setId("garen");
//		mvo.setPassword("12345");
		
		// 게시물 입력
		BoardVO bvo = new BoardVO();
		bvo.setContent("내용 작성중~~");
		bvo.setTitle("제목입니다!!");
		bvo.setWriter("관리자");
		bs.insertBoard(bvo);
				
		// 검색
		List<BoardVO> datas=bs.getBoardList("검색");
		for(BoardVO data:datas) {
			System.out.println(data);
		}
		
		factory.close();
	}
}

