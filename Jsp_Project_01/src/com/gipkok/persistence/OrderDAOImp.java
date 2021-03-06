package com.gipkok.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.gipkok.domain.OrderVO;
import com.gipkok.domain.Paging;
import com.gipkok.orm.DBBuilderForPjt;

public class OrderDAOImp implements OrderDAO {

	private static Logger logger = LoggerFactory.getLogger(OrderDAOImp.class);
	private SqlSession sql;
	private static String namespace = "com.gipkok.mappers.orderMapper";
	
	public OrderDAOImp() {
		new DBBuilderForPjt();
		sql = DBBuilderForPjt.getFactory().openSession();
	}
	
	@Override
	public int insert(OrderVO ovo) {
		int isReg = sql.insert(namespace+".reg",ovo);
		if(isReg > 0){
			sql.commit();
			return isReg;
		}else{
		return 0;
	}
	}

	@Override
	public List<OrderVO> selectlist(String id) {
		return sql.selectList(namespace+".li", id);
	}

	@Override
	public int moidfy(OrderVO ovo) {
		return 0;
	}

	@Override
	public int totalCount() {
		return 0;
	}

	@Override
	public OrderVO selectlistone(int ono) {
		return sql.selectOne(namespace+".lio",ono);
	}
}
