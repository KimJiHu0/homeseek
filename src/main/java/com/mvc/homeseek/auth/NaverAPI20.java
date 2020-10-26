package com.mvc.homeseek.auth;

import com.github.scribejava.core.builder.api.DefaultApi20;

public class NaverAPI20 extends DefaultApi20 implements SnsUrls{
//기본적으로 scribe java가 구글GoogleAPI20은 가지고 있지만, 네이버는 가지고있지 않기 때문에  DefaultAPI20의 메소드를 가져와서 직접 구현해 사용한다.
	//싱글톤으로 만들어야한다. -> 여기서는 InstanceHolder를 쓰는 방식으로 하자.
	private NaverAPI20() {		
	}
	
	// InstanceHolder
	private static class InstanceHolder{
		private static final NaverAPI20 INSTANCE = new NaverAPI20();	
	}
	public static NaverAPI20 instance() {
		return InstanceHolder.INSTANCE;
	}
	
	//DefaultApi20에서 abstract메소드 @오버라이드 해준것 !
	//NAVER_ACCESS_TOKEN 으로 네이버프로필을 가져올것이다.
	@Override
	public String getAccessTokenEndpoint() {
		return NAVER_ACCESS_TOKEN;
	}
	
	//NAVER_AUTH로 인증받아올수있다.
	@Override
	protected String getAuthorizationBaseUrl() {
		return NAVER_AUTH;
	}
}
