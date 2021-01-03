package com.gipkok.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.gipkok.domain.OrderVO;
import com.gipkok.domain.Paging;
import com.gipkok.persistence.OrderDAO;
import com.gipkok.persistence.OrderDAOImp;

public class OrderServiceImp implements OrderService {

	private static Logger logger = LoggerFactory.getLogger(OrderServiceImp.class);
	private OrderDAO odao;
	public OrderServiceImp() {
		odao = new OrderDAOImp();
	}
	
	@Override
	public int regist(OrderVO ovo) {
		return odao.insert(ovo);
	}

	@Override
	public List<OrderVO> getlist(String id) {
		return odao.selectlist(id);
	}

	@Override
	public int update(OrderVO ovo) {
		return 0;
	}

	@Override
	public int totalCount() {
		return 0;
	}

	@Override
	public OrderVO getlistone(int ono) {
		return odao.selectlistone(ono);
	}
}
