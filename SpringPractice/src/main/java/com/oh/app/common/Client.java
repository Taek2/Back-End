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
		
		// ȸ������
		System.out.println("=== ȸ������ === ");
		System.out.print("���̵�: ");
		String id = sc.next();
		System.out.print("��й�ȣ: ");
		String pw = sc.next();
		System.out.print("�̸�: ");
		String name = sc.next();
		mvo.setId(id);
		mvo.setPassword(pw);
		mvo.setName(name);
		mvo.setRole("user");
		ms.insertMember(mvo);
		
		// ��� �α���	
		System.out.println("=== �α��� === ");
		System.out.print("���̵�: ");
		id = sc.next();
		System.out.print("��й�ȣ: ");
		pw = sc.next();
		mvo.setId(id);
		mvo.setPassword(pw);
		ms.getMember(mvo);
		
//		// �α��� �׽�Ʈ
//		mvo.setId("garen");
//		mvo.setPassword("12345");
		
		// �Խù� �Է�
		BoardVO bvo = new BoardVO();
		bvo.setContent("���� �ۼ���~~");
		bvo.setTitle("�����Դϴ�!!");
		bvo.setWriter("������");
		bs.insertBoard(bvo);
				
		// �˻�
		List<BoardVO> datas=bs.getBoardList("�˻�");
		for(BoardVO data:datas) {
			System.out.println(data);
		}
		
		factory.close();
	}
}

