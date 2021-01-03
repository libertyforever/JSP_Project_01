package com.gipkok.persistence;



import java.util.ArrayList;
import java.util.List;


import com.gipkok.domain.CartVO;
import com.gipkok.domain.Paging;



public interface CartDAO {
	public int insert(CartVO cavo);
	public List<CartVO> selectList();
	public int delete(int cano);
	public int selectCount();
}
