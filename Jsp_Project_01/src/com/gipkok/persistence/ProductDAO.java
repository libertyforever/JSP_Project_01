package com.gipkok.persistence;

import java.util.List;

import com.king.domain.Paging;
import com.king.domain.ProductVO;

public interface ProductDAO {
	public int insert(ProductVO pvo); // 가입
	public ProductVO selectOne(ProductVO pvo); //로그인 //맴버객체에서 grade등 속성을 가지고오기위해
	public List<ProductVO> selectList(Paging paging); //mybatis 특성상 List를 추구한다
	public ProductVO selectOne(Integer pno);
	public int update(ProductVO pvo);
	public int delete(Integer pno);
	public int selectCount();
}
