package com.oh.app.common;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Service;
import org.springframework.util.StopWatch;

@Service
@Aspect
public class AroundAdvice {
	@Around("PointcutCommon.allPointcut()" ) 
	public Object printLog(ProceedingJoinPoint pjp) throws Throwable {
		StopWatch sw = new StopWatch();
		
		sw.start();
		Object obj=pjp.proceed();
		sw.stop();
		
		System.out.println("소요시간: " + sw.getTotalTimeMillis());
		return obj;
	}
}
