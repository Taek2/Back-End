//package com.oh.app.common;
//
//import org.aspectj.lang.JoinPoint;
//import org.aspectj.lang.annotation.AfterThrowing;
//import org.aspectj.lang.annotation.Aspect;
//import org.springframework.stereotype.Service;
//
//@Service
//@Aspect
//public class AfterThrowingAdvice {
//	@AfterThrowing(value="PointcutCommon.cPointcut()", throwing= "excep")
//	public void printException(JoinPoint jp, Exception excep) throws RuntimeException{
//		System.out.println("�α��� ����!");
//		System.out.println("����: " + excep);
//	}
//}
