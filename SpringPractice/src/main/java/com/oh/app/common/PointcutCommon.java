package com.oh.app.common;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

@Aspect
public class PointcutCommon {
	@Pointcut("execution(* model..*Impl.*(..))")
	public void allPointcut() {};
	@Pointcut("execution(* model.board.*Impl.get*(..))")
	public void aPointcut() {};
	@Pointcut("execution(* model.board.*Impl.*(..))")
	public void bPointcut() {};
	@Pointcut("execution(* model.member.*Impl.get*(..))")
	public void cPointcut() {};
	@Pointcut("execution(* model.member.*Impl.*(..))")
	public void dPointcut() {};
}

