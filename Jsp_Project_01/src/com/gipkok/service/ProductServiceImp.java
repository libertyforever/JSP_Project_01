package com.gipkok.service;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.gipkok.domain.Paging;
import com.gipkok.domain.ProductVO;
import com.gipkok.persistence.ProductDAO;
import com.gipkok.persistence.ProductDAOImp;

public class ProductServiceImp implements ProductService{
	private static Logger logger = LoggerFactory.getLogger(ProductServiceImp.class);
	private ProductDAO pdao;
	
	public ProductServiceImp() {
		pdao = new ProductDAOImp();
	}	
	@Override
	public int upload(ProductVO pvo) {		
		return pdao.insert(pvo);
	}

	@Override
	public ProductVO login(ProductVO pvo) {
		return pdao.selectOne(pvo);
	}

	@Override
	public List<ProductVO> getList(Paging paging) {
		return pdao.selectList(paging);
	}

	@Override
	public int modify(ProductVO pvo) {
		return pdao.update(pvo);
	}

	@Override
	public int remove(Integer pno) {
		return pdao.delete(pno);
	}
	@Override
	public ProductVO getInfo(Integer pno) {
		return pdao.selectOne(pno);
	}
	@Override
	public int pnoCheck(String pno) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int totalCount() {
		return pdao.selectCount();
	}
	@Override
	public List<ProductVO> getViewCList() {
		return pdao.selectViewCList();
	}
	@Override
	public List<ProductVO> getOrderCList() {
		return pdao.selectOrderClist();
	}
	@Override
	public List<ProductVO> getCateCList(String pvo) {
		return pdao.selectCateList(pvo);
	}
}
