package com.gipkok.service;


import java.util.List;

import com.gipkok.domain.CartVO;
import com.gipkok.domain.Paging;


public interface CartService {
	public int join(CartVO cavo);
	public List<CartVO> getlist(Paging paging);
	public int remove(int cano);
	public int totalCount();
}
