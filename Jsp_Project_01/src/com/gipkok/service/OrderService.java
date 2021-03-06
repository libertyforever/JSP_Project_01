package com.gipkok.service;

import java.util.List;

import com.gipkok.domain.OrderVO;
import com.gipkok.domain.Paging;

public interface OrderService {
	public int regist(OrderVO ovo);
	public List<OrderVO> getlist(String id);
	public OrderVO getlistone(int ono);
	public int update(OrderVO ovo);
	public int totalCount();
}
