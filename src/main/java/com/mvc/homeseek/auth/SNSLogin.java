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
		this.oauthService = new ServiceBuilder(sns.getClientId()).apiSecret(sns.getClientSecret())
				.callback(sns.getRedirectUrl())
				// .scope()가 없어서 대체 / 어떤정보를 갖고올지 정함.
				.scope("profile").build(sns.getApi20Instance());

		this.sns = sns;
	}

	public String getNaverAuthURL() {
		return this.oauthService.getAuthorizationUrl();
	}

	public MemberDto getUserProfile(String code) throws Exception {
		OAuth2AccessToken accessToken = oauthService.getAccessToken(code);

		OAuthRequest request = new OAuthRequest(Verb.GET, this.sns.getProfileUrl());
		oauthService.signRequest(accessToken, request);

		Response response = oauthService.execute(request);

		return parseJson(response.getBody());

	}

	private MemberDto parseJson(String body) throws Exception {
		System.out.println("==========================\n" + body + "\n============================");
		MemberDto user = new MemberDto();
		/*
		 * boolean isNaver = StringUtils.equalsIgnoreCase("naver", this.service);
		 * boolean isGoogle = StringUtils.equalsIgnoreCase("google", this.service);
		 */

		ObjectMapper mapper = new ObjectMapper();
		JsonNode rootNode = mapper.readTree(body);

		if (this.sns.isGoogle()) {

			// 아이디
			String id = rootNode.get("id").asText();
			if (sns.isGoogle()) {
				user.setMember_googleid(id);

			}

			/* String displayName = rootNode.get("displayName").asText(); */

			// 이름
			// name = familyName + givenName
			JsonNode nameNode = rootNode.path("name");
			String name = nameNode.get("familyName").asText() + nameNode.get("givenName").asText();
			user.setMember_name(name);
			// 이메일
			// email
			Iterator<JsonNode> iterEmails = rootNode.path("emails").elements();
			while (iterEmails.hasNext()) {
				JsonNode emailNode = iterEmails.next();
				String type = emailNode.get("type").asText();
				if (StringUtils.equals(type, "account")) {
					user.setMember_email(emailNode.get("value").asText());
					break;
				}

			}

		} else if (this.sns.isNaver()) {
			JsonNode resNode = rootNode.get("response");
			user.setMember_naverid(resNode.get("id").asText());
			user.setMember_email(resNode.get("email").asText());
		}

		return null;
	}
}
