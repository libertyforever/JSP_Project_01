package com.gipkok.domain;

public class MemberVO {

	private String email ;
	private String nickname;
	private String pwd;
	private int grade;
	
	public MemberVO() {}
	public MemberVO(String email, String pwd) {
		this.email = email;
		this.pwd = pwd;
	}

	public MemberVO(String email, String nickname, String pwd) {
		this.email = email;
		this.nickname = nickname;
		this.pwd = pwd;
	}


	public MemberVO(String email, String nickname, int grade) {
		this.email = email;
		this.nickname = nickname;
		this.grade = grade;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}
	
	
	
}
