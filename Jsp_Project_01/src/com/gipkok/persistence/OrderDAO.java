package com.gipkok.persistence;

import java.util.List;
import com.gipkok.domain.OrderVO;
import com.gipkok.domain.Paging;

public interface OrderDAO {

	public int insert(OrderVO ovo);
	public List<OrderVO> selectlist(String id);
	public int moidfy(OrderVO ovo);
	public int totalCount();
	public OrderVO selectlistone(int ono);
}
