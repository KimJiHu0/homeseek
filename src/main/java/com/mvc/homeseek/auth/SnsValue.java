package com.mvc.homeseek.auth;

import org.apache.commons.lang3.StringUtils;

import com.github.scribejava.apis.GoogleApi20;
import com.github.scribejava.core.builder.api.DefaultApi20;

public class SnsValue implements SnsUrls {
	private String service;
	private String clientId;
	private String clientSecret;
	private String redirectUrl;
	private DefaultApi20 api20Instance;
	//sns마다 토큰을 받는 url이 다르기때문에 생성
	private String profileUrl;
	//인지 아닌지 판단
	private boolean isNaver;
	private boolean isGoogle;
	
	


	public SnsValue(String service, String cid, String cs, String rurl) {
		this.service = service;
		this.clientId = cid;
		this.clientSecret = cs;
		this.redirectUrl = rurl;
		
		this.isNaver = StringUtils.equalsIgnoreCase("naver", this.service);
		this.isGoogle = StringUtils.equalsIgnoreCase("google", this.service);
		
		if(isNaver) {
			this.api20Instance = NaverAPI20.instance();
			this.profileUrl = NAVER_PROFILE_URL;
			
		}else if(isGoogle){
			this.api20Instance = GoogleApi20.instance();
			this.profileUrl = GOOGLE_PROFILE_URL;
		}
	}
	
	
	public String getProfileUrl() {
		return profileUrl;
	}
	public void setProfileUrl(String profileUrl) {
		this.profileUrl = profileUrl;
	}


	public String getService() {
		return service;
	}
	public void setService(String service) {
		this.service = service;
	}


	public String getClientId() {
		return clientId;
	}
	public void setClientId(String clientId) {
		this.clientId = clientId;
	}
	
	
	public String getClientSecret() {
		return clientSecret;
	}
	public void setClientSecret(String clientSecret) {
		this.clientSecret = clientSecret;
	}


	public String getRedirectUrl() {
		return redirectUrl;
	}
	public void setRedirectUrl(String redirectUrl) {
		this.redirectUrl = redirectUrl;
	}


	public DefaultApi20 getApi20Instance() {
		return api20Instance;
	}
	public void setApi20Instance(DefaultApi20 api20Instance) {
		this.api20Instance = api20Instance;
	}

	public boolean isNaver() {
		return isNaver;
	}
	
	
	public void setNaver(boolean isNaver) {
		this.isNaver = isNaver;
	}
	
	
	public boolean isGoogle() {
		return isGoogle;
	}
	
	
	public void setGoogle(boolean isGoogle) {
		this.isGoogle = isGoogle;
	}

}
