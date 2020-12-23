package com.gipkok.service;

import java.util.List;

import com.king.domain.Paging;
import com.king.domain.ProductVO;

public interface ProductService {
	public int regist(ProductVO pvo);
	public ProductVO login(ProductVO pvo);
	public List<ProductVO> getList(Paging paging);
	public ProductVO getInfo(Integer pno);
	public int modify(ProductVO pvo);
	public int remove(Integer pno);
	public int pnoCheck(String pno);
	public int totalCount();
	
}
