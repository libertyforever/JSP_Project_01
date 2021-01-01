package com.gipkok.persistence;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.gipkok.domain.MemberVO;
import com.gipkok.orm.DBBuilderForPjt;

public class MemberDAOImp implements MemberDAO{
	private static Logger logger = LoggerFactory.getLogger(MemberDAOImp.class);
	private SqlSession sql;
	private static String namespace = "com.gipkok.mappers.memberMapper";
	
	public MemberDAOImp() {
		new DBBuilderForPjt();
		sql = DBBuilderForPjt.getFactory().openSession();
	}

	@Override
	public int insert(MemberVO mvo) {
		int isOk = sql.insert(namespace+".join", mvo);
		if(isOk > 0) {
			sql.commit();
			return isOk;
		}else {
			return 0;
		}		 
	}

	@Override
	public MemberVO selectOne(MemberVO mvo) {
		return sql.selectOne(namespace+".login", mvo);
	}

	@Override
	public ArrayList<MemberVO> selectList() {
		List<MemberVO> list = new ArrayList<>();
		list = sql.selectList(namespace+".list");
		return (ArrayList<MemberVO>) list;
	}
	
	@Override
	public MemberVO selectOne(String email) {
		return sql.selectOne(namespace+".info" , email);
	}


	@Override
	public int update(MemberVO mvo) {
		return sql.update(namespace+".edit", mvo);
	}

	@Override
	public int delete(String email) {

		int isok= sql.delete(namespace+".rm",email);
		if(isok > 0) {
			sql.commit();
			return isok;
		}else {
			return 0;
		}
	}


	@Override
	public int selectCount(String id) {
		return sql.selectOne(namespace+".chk",id);
	}

	
	


}
