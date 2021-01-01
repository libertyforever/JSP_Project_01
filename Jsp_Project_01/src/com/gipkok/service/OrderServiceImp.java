package com.gipkok.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.gipkok.domain.OrderVO;
import com.gipkok.domain.Paging;

public class OrderServiceImp implements OrderService {

	private static Logger logger = LoggerFactory.getLogger(OrderServiceImp.class);

	@Override
	public int regist(OrderVO ovo) {
		return 0;
	}

	@Override
	public List<OrderVO> getlist(Paging paging) {
		return null;
	}

	@Override
	public int update(OrderVO ovo) {
		return 0;
	}

	@Override
	public int totalCount() {
		return 0;
	}
}
