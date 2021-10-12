package com.oh.app.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Service;


@Service
@Aspect
public class BeforeAdvice {
	
	@Before("PointcutCommon.aPointcut()") 
	public void printLogBoard(JoinPoint jp) {
		System.out.println("board ������ ����� ���۵˴ϴ�..");
	}
	
	@Before("PointcutCommon.cPointcut()")
	public void printLogMember(JoinPoint jp) {
		System.out.println("member ������ ����� ���۵˴ϴ�..");
	}
}
