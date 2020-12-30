package com.gipkok.persistence;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.gipkok.domain.CartVO;
import com.gipkok.domain.Paging;
import com.gipkok.orm.DBBuilderForPjt;


public class CartDAOImp implements CartDAO {
	private static Logger logger = LoggerFactory.getLogger(CartDAOImp.class);
 
	private SqlSession sql;
	private static String namespace = "com.gipkok.mappers.cartMapper";
	
	public CartDAOImp() {
		new DBBuilderForPjt();
		sql = DBBuilderForPjt.getFactory().openSession();
	}

	
	
	@Override
	public int insert(CartVO cavo) {
		int isOk = sql.insert(namespace+".join", cavo);
		if(isOk > 0) {
			sql.commit();
			return isOk;
		}else {
			return 0;
		}		 
	}

	@Override
	public List<CartVO> selectList(Paging paging) {
		return sql.selectList(namespace + ".list", paging);
	}

	@Override
	public int delete(int cano) {
		
		int isok= sql.delete(namespace+".rm",cano);
		if(isok > 0) {
			sql.commit();
			return isok;
		}else {
			return 0;
		}
	}



	@Override
	public int selectCount() {
		return sql.selectOne(namespace+ ".cnt");
	}

}
