package com.bit.springboard.common;

import org.aspectj.lang.JoinPoint;

public class Before {
	public void beforeLog(JoinPoint jp) {
		String methodName = jp.getSignature().getName();
		Object[] methodArgs = jp.getArgs();
		if(methodArgs.length != 0)
		System.out.println("[사전 처리]"+methodName+"()의 매개변수 정보:"+methodArgs[0].toString());
		else
			System.out.println("[사전 처리]"+methodName+"()는 매개변수가 없습니다.");

	}
}
