package com.mvc.homeseek.auth;

import java.util.Iterator;

import org.apache.commons.lang3.StringUtils;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;
import com.mvc.homeseek.model.dto.MemberDto;

public class SNSLogin {
	// OAuth20Service : 토큰을 주고받는 기능을 해줌
	private OAuth20Service oauthService;
	private SnsValue sns;
	
	
	public SNSLogin(SnsValue sns) {
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		this.oauthService = new ServiceBuilder(sns.getClientId())
				.apiSecret(sns.getClientSecret())
				//콜백 주소
				.callback(sns.getRedirectUrl())
				//.scope()가 없어서 대체 / 어떤정보를 갖고올지 미리 정함(우리갖은 경우엔 '이름','이메일').
				.defaultScope("profile")
				//sns OOapi20인스턴스 만들어주세요~~ 하는거.
				.build(sns.getApi20Instance());

		this.sns = sns;
	}
	
	//
	public String getNaverAuthURL() {
		System.out.println("#@#@#@#@#@#@#@#@#@##@"+this.oauthService.getAuthorizationUrl());
		return this.oauthService.getAuthorizationUrl();
		
	}

	//callback관련 내용.....
	public MemberDto getUserProfile(String code) throws Exception {
		OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
		
		//com.github.scribejava.core.model.OAuthRequest
		OAuthRequest request = new OAuthRequest(Verb.GET, this.sns.getProfileUrl());
		oauthService.signRequest(accessToken, request);
		
		//com.github.scribejava.core.model.Response
		Response response = oauthService.execute(request);
 
		return parseJson(response.getBody());

	}

	//pom.xml의 jackson라이브러리를 이용하여 json을 object로 변환 작업 
	public MemberDto parseJson(String body) throws Exception {
		System.out.println("==========================시작\n" + body + "\n==========================끝");
		MemberDto user = new MemberDto();
		/*
		 * boolean isNaver = StringUtils.equalsIgnoreCase("naver", this.service);
		 * boolean isGoogle = StringUtils.equalsIgnoreCase("google", this.service);
		 */

		ObjectMapper mapper = new ObjectMapper();
		JsonNode rootNode = mapper.readTree(body);

		// 구글sns의 Json형태데이터 뽑아오기
		if (this.sns.isGoogle()) {

			// 1.아이디
			String id = rootNode.get("id").asText();
			if (sns.isGoogle()) {
				user.setMember_googleid(id);
			}

			/* String displayName = rootNode.get("displayName").asText(); */

			// 2.이름
			// name = familyName + givenName
			JsonNode nameNode = rootNode.path("name");
			String name = nameNode.get("familyName").asText() + nameNode.get("givenName").asText();
			user.setMember_name(name);
			// 3.이메일
			// email
			Iterator<JsonNode> iterEmails = rootNode.path("emails").elements();
			while (iterEmails.hasNext()) {
				JsonNode emailNode = iterEmails.next();
				String type = emailNode.get("type").asText();
				if (StringUtils.equals(type, "account")) {
					user.setMember_id(emailNode.get("value").asText());
					break;
				}
				
			}
		//네이버sns의 Json형태데이터 뽑아오기
		} else if (this.sns.isNaver()) {
			JsonNode resNode = rootNode.get("response");
			//1. naverid 
			user.setMember_naverid(resNode.get("id").asText());
			//2. email
			user.setMember_id(resNode.get("email").asText());
//			String naveremail = resNode.get("email").asText();
//			user.setMember_id(naveremail);
			
			//email값 테스트출력
			System.out.println(resNode.get("email").asText());
			//model.addAttribute("naveremail", resNode.get("email").asText()); 
		}

		return user;
	}
}
