package com.gipkok.domain;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ProductVO {

	private static Logger logger = LoggerFactory.getLogger(ProductVO.class);
	
	private int pno;
	private String category;
	private String pname;
	private String content;
	private double price;
	private String regdate;
	private String moddate;
	private String imgfile;
	private String thumb;
	
	public ProductVO() {
	}
	//생성
	public ProductVO(String category, String pname, String content, double price, String imgfile) {
		this.category = category;
		this.pname = pname;
		this.content = content;
		this.price = price;
		this.imgfile = imgfile;
	}
	//리스트
	public ProductVO(int pno, String category, String pname, double price, String moddate, String thumb) {
		this.pno = pno;
		this.category = category;
		this.pname = pname;
		this.price = price;
		this.moddate = moddate;
		this.thumb = thumb;
	}
	
	//수정
	public ProductVO(int pno, String category, String pname, String content, double price, String moddate,
			String imgfile) {
		this.pno = pno;
		this.category = category;
		this.pname = pname;
		this.content = content;
		this.price = price;
		this.moddate = moddate;
		this.imgfile = imgfile;
	}
	//디테일
		public ProductVO(int pno, String category, String pname, String content, double price, String regdate,
				String moddate, String imgfile, String thumb) {
			this(pno,category,pname,price,content,imgfile);
			this.regdate = regdate;
			this.moddate = moddate;
			this.thumb = thumb;
		}
	
	public static Logger getLogger() {
		return logger;
	}
	public static void setLogger(Logger logger) {
		ProductVO.logger = logger;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getModdate() {
		return moddate;
	}
	public void setModdate(String moddate) {
		this.moddate = moddate;
	}
	public String getImgfile() {
		return imgfile;
	}
	public void setImgfile(String imgfile) {
		this.imgfile = imgfile;
	}
	public String getThumb() {
		return thumb;
	}
	public void setThumb(String thumb) {
		this.thumb = thumb;
	}
	
	
	
	
}
