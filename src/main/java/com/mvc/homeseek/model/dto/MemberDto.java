package com.mvc.homeseek.model.dto;

public class MemberDto {
	private String member_id;
	private String member_pw;
	private String member_name;
	private String member_email;
	private String member_phone;
	private char member_enabled;
	private char member_role;
	// 추가: sns로그인 정보를 저장하기위해
	private String member_naverid;
	private String member_googleid;
	private String member_kakaoid;

	// id 찾기용
	public MemberDto(String member_name, String member_phone) {
		super();
		this.member_name = member_name;
		this.member_phone = member_phone;
	}

	// pw 찾기용
	public MemberDto(String member_name, String member_phone, String member_id) {
		super();
		this.member_name = member_name;
		this.member_phone = member_phone;
		this.member_id = member_id;
	}
	// pw 비밀번호 바꾸기
	public MemberDto(String member_name, String member_phone, String member_id, String member_pw) {
		super();
		this.member_name = member_name;
		this.member_phone = member_phone;
		this.member_id = member_id;
		this.member_pw = member_pw;
	}	

	public MemberDto(String member_id, String member_pw, String member_name, String member_email, String member_phone,
			char member_enabled, char member_role, String member_naverid, String member_googleid,
			String member_kakaoid) {

		this.member_id = member_id;
		this.member_pw = member_pw;
		this.member_name = member_name;
		this.member_email = member_email;
		this.member_phone = member_phone;
		this.member_enabled = member_enabled;
		this.member_role = member_role;
		this.member_naverid = member_naverid;
		this.member_googleid = member_googleid;
		this.member_kakaoid = member_kakaoid;
	}

	public MemberDto() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "MemberDto [member_id=" + member_id + ", member_pw=" + member_pw + ", member_name=" + member_name
				+ ", member_email=" + member_email + ", member_phone=" + member_phone + ", member_enabled="
				+ member_enabled + ", member_role=" + member_role + ", member_naverid=" + member_naverid
				+ ", member_googleid=" + member_googleid + ", member_kakaoid=" + member_kakaoid + "]";
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_pw() {
		return member_pw;
	}

	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public String getMember_phone() {
		return member_phone;
	}

	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}

	public char getMember_enabled() {
		return member_enabled;
	}

	public void setMember_enabled(char member_enabled) {
		this.member_enabled = member_enabled;
	}

	public char getMember_role() {
		return member_role;
	}

	public void setMember_role(char member_role) {
		this.member_role = member_role;
	}

	public String getMember_naverid() {
		return member_naverid;
	}

	public void setMember_naverid(String member_naverid) {
		this.member_naverid = member_naverid;
	}

	public String getMember_googleid() {
		return member_googleid;
	}

	public void setMember_googleid(String member_googleid) {
		this.member_googleid = member_googleid;
	}

	public String getMember_kakaoid() {
		return member_kakaoid;
	}

	public void setMember_kakaoid(String member_kakaoid) {
		this.member_kakaoid = member_kakaoid;
	}

}