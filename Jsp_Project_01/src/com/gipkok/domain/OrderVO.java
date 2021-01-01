package com.gipkok.domain;


public class OrderVO {
	int ono;
	String id;
	String prdinfo;
	String regdate;
	int status;

	public OrderVO() {
	}

	public OrderVO(String id, String prdinfo, int status) {
		this.id = id;
		this.prdinfo = prdinfo;
		this.status = status;
	}
	
	public int getOno() {
		return ono;
	}

	public void setOno(int ono) {
		this.ono = ono;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPrdinfo() {
		return prdinfo;
	}

	public void setPrdinfo(String prdinfo) {
		this.prdinfo = prdinfo;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	
	
}

