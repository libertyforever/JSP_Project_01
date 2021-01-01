package com.gipkok.domain;


public class CartVO  {
	private int cano; // 카트 번호
	private String id;  //구매자 아이디
	private int pno;  // 프로덕트 번호
	private int cnt; // 구매수량 
	private String pname;  
	private String thumb;
	private int price;
	
 public CartVO() {}
//입력
   public CartVO(String id, int pno, String pname, int cnt, String thumb, int price) {
	   this(id, pno, pname, cnt, thumb);
	   this.price=price;
   }
   public CartVO(String id, int pno, String pname, int cnt, String thumb) {
	   this.id = id;
	   this.pno = pno;
	   this.pname = pname;
	   this.cnt = cnt;
	   this.thumb = thumb;
   }

public int getPrice() {
	return price;
}
public void setPrice(int price) {
	this.price = price;
}
public String getid() {
		return id;
	}
	public void setid(String id) {
		this.id = id;
	}
	public int getcano() {
		return cano;
	}
	public void setid(int cano) {
		this.cano = cano;
	}
	public int getpno() {
		return pno;
	}
	public void setpno(int pno) {
		this.pno = pno;
	}
	public int getcnt() {
		return cnt;
	}
	public void setcnt(int cnt) {
		this.cnt = cnt;
	}
	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getThumb() {
		return thumb;
	}

	public void setThumb(String thumb) {
		this.thumb = thumb;
	}

}