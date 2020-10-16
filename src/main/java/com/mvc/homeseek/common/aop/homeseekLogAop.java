package com.mvc.homeseek.common.aop;

import org.aspectj.lang.JoinPoint;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class homeseekLogAop {
	 int a = 3;
	/*
	 *  getTarget() : 대상 객체 (포인트랑 연결되어있는 cc는 누구인지 알려준다.) 
	 *  getArgs() : 대상 파라미터들을 다 가지고 와준다.
	 *  getSignature() : 대상 메소드 정보를 가지고 있다.
	 */
	
	public void beforeLog(JoinPoint join) {
		Logger logger = LoggerFactory.getLogger(join.getTarget() + "");
		logger.info("\n ----------Aop Start----------");
		
		Object[] args = join.getArgs();
		if(args != null) {
			logger.info("\n *Method : " + join.getSignature().getName()); 
			for(int i = 0; i < args.length; i++) {
				logger.info("\n" + i + "번째" + args[i]);
			}
		}
	}
	
	public void afterLog(JoinPoint join) {
		Logger logger = LoggerFactory.getLogger(join.getTarget() + "");
		logger.info("\n ----------Aop End----------");
	}
	
	public void afterThrowingLog(JoinPoint join) {
		Logger logger = LoggerFactory.getLogger(join.getTarget() + "");
		logger.info("\n -----------Aop Error----------");
		logger.info("\n Error : " + join.getArgs());
		logger.info("\n Error : " + join.toString());
	}

}
