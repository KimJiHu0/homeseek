package com.mvc.homeseek.model.biz;
import java.security.MessageDigest;

// sha256 암호화를 해주는 메서드가 들어갈 클래스
public class UserSha256 {
	//static이여서 클래스 어디다 만들어서 상관없음
	//encrypt()라는 메서드 명을 가진 메서드
	//매개변수(String planText)에 param 값으로 넘어온 비밀번호를 넣어주면 됩
	public static String encrypt(String planText) {
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.update(planText.getBytes());
			byte byteData[] = md.digest();
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < byteData.length; i++) {
				sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
			}
			StringBuffer hexString = new StringBuffer();
			for (int i = 0; i < byteData.length; i++) {
				String hex = Integer.toHexString(0xff & byteData[i]);
				if (hex.length() == 1) {
					hexString.append('0');
				}
				hexString.append(hex);
			}
			return hexString.toString();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
	}
}

