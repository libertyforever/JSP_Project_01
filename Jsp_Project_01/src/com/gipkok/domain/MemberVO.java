package com.gipkok.domain;

public class MemberVO {
	private String id;
	private String nickname;
	private String pwd;
	private int grade;
	private int cpn;
	
	
	public MemberVO() {}	
	//로그인
	public MemberVO(String id, String pwd) {
		this.id = id;
		this.pwd = pwd;
	}
	//입력
	public MemberVO(String id,  String pwd,String nickname) {
		this.id = id;
		this.pwd = pwd;
		this.nickname = nickname;
	}
	//입력
		public MemberVO(String id,  String pwd, String nickname, int grade) {
			this.id = id;
			this.pwd = pwd;
			this.nickname = nickname;
			this.grade = grade;
		}
	//조회
	public MemberVO(String id, String nickname, int grade,int cpn) {
		this.id = id;
		this.nickname = nickname;
		this.grade = grade;
		this.cpn = cpn;
	}
	public String getid() {
		return id;
	}
	public void setid(String id) {
		this.id = id;
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
	public int getCpn() {
		return cpn;
	}
	public void setCpn(int cpn) {
		this.cpn = cpn;
	}
}
