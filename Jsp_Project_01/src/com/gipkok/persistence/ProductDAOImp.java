package com.gipkok.persistence;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.gipkok.domain.Paging;
import com.gipkok.domain.ProductVO;
import com.gipkok.orm.DBBuilderForPjt;

public class ProductDAOImp implements ProductDAO{
	private static Logger logger = LoggerFactory.getLogger(ProductDAOImp.class);
	private SqlSession sql;
	private static String namespace = "com.gipkok.mappers.productMapper"; //네임스페이스 주소값이 아닌이름. 
	private SqlSessionFactory sqlsf;
	public ProductDAOImp() {
		new DBBuilderForPjt();
		sqlsf = DBBuilderForPjt.getFactory();		
		sql = sqlsf.openSession();
	}


	@Override
	public int insert(ProductVO pvo) {
		int isReg = sql.insert(namespace+".reg", pvo); //sql에 있는 insert가 바로뜸
		sql.commit(); //의도적으로 commit을 넣음
			return isReg>0? 1:0;
	}

	@Override
	public ProductVO selectOne(Integer pno) {
		return sql.selectOne(namespace+".info",pno);
	}
	@Override
	public List<ProductVO> selectList(Paging paging) {  //selectList가 return타입이 List이기 때문에 바꿔야함 ArrayList에서 List로 바꿈
		return sql.selectList(namespace+".lip", paging); 
	}
	@Override
	public int update(ProductVO pvo) {
		int isUp = sql.update(namespace+".mod",pvo);
		if(isUp>0) {
			sql.commit();
			return isUp;
			}else {
				logger.info(">> update error");
				return 0;
			}
	}

	@Override
	public int delete(Integer pno) {
		int isDel = sql.delete(namespace+".rm", pno);
		if(isDel>0) {
			sql.commit();
			return isDel;
			}else {
				logger.info(">> delete error");
				return 0;
			}
	}

	@Override
	public int selectCount() {
		return sql.selectOne(namespace+".cnt");
	}


	@Override
	public ProductVO selectOne(ProductVO pvo) {
		return sql.selectOne(namespace+".login", pvo);
	}


	@Override
	public List<ProductVO> selectViewCList(Paging page) {
		return sql.selectList(namespace+".vcnt",page);
	}


	@Override
	public List<ProductVO> selectOrderClist(Paging page) {
		return sql.selectList(namespace+".ocnt",page);
	}


	@Override
	public List<ProductVO> selectCateList(String pvo) {
		return sql.selectList(namespace+".cli",pvo);
	}


	@Override
	public int countUp(Integer pno) {
		int isCu = sql.update(namespace+".cntup",pno);
		if(isCu>0) {
			sql.commit();
			return isCu;
			}else {
				logger.info(">> count up error");
				return 0;
			}
	}


	@Override
	public void plusUpOdr(String pno) {
		int isPu = sql.update(namespace+".pluo");
		sql.commit();
	}



	

	
}
