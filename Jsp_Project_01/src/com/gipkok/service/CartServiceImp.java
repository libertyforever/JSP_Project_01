package com.gipkok.service;


import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.gipkok.domain.CartVO;

import com.gipkok.persistence.CartDAO;
import com.gipkok.persistence.CartDAOImp;
import com.gipkok.domain.Paging;


public class CartServiceImp implements CartService {
	private static Logger logger = LoggerFactory.getLogger(CartServiceImp.class);
	private CartDAO cadao;
	public CartServiceImp() {
	    cadao = new CartDAOImp();
	}	
	
	@Override
	public int join(CartVO cavo) {
		
		return cadao.insert(cavo);
	}

	
	@Override
	public List<CartVO> getlist() {
		
		return cadao.selectList();
	}

	@Override
	public int remove(int cano) {
		
		return cadao.delete(cano);
	}

	@Override
	public int totalCount() {
		return cadao.selectCount();
	}

}
