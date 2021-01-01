package com.gipkok.persistence;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.gipkok.domain.OrderVO;
import com.gipkok.domain.Paging;

public class OrderDAOImp implements OrderDAO {

	private static Logger logger = LoggerFactory.getLogger(OrderDAOImp.class);

	@Override
	public int insert(OrderVO ovo) {
		return 0;
	}

	@Override
	public List<OrderVO> selectlist(Paging paging) {
		return null;
	}

	@Override
	public int moidfy(OrderVO ovo) {
		return 0;
	}

	@Override
	public int totalCount() {
		return 0;
	}
}
