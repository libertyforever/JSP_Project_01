package com.gipkok.service;

import java.util.List;

import com.gipkok.domain.Paging;
import com.gipkok.domain.ProductVO;

public interface ProductService {
	public int upload(ProductVO pvo);
	public ProductVO login(ProductVO pvo);
	public List<ProductVO> getList(Paging paging);
	public ProductVO getInfo(Integer pno);
	public int modify(ProductVO pvo);
	public int remove(Integer pno);
	public int pnoCheck(String pno);
	public int totalCount();
	public List<ProductVO> getViewCList();
	public List<ProductVO> getOrderCList();
	public List<ProductVO> getCateCList(String pvo);
	public int countUp(Integer pno);
	
}
