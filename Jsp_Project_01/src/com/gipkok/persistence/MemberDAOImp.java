package com.gipkok.persistence;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.king.domain.MemberVO;
import com.king.orm.DBBuilder;

public class MemberDAOImp implements MemberDAO{
	private static Logger logger = LoggerFactory.getLogger(MemberDAOImp.class);
	private SqlSession sql;
	private static String namespace = "com.king.mappers.memberMapper"; //네임스페이스 주소값이 아닌이름. 
	
	public MemberDAOImp() {
		new DBBuilder();
		sql = DBBuilder.getFactory().openSession();
	}

	@Override
	public int insert(MemberVO mvo) {
		int isOk = sql.insert(namespace+".join", mvo); //sql에 있는 insert가 바로뜸
		if(isOk>0) {
			sql.commit();
			return isOk;
			}else {
				logger.info(">> insert error");
				return 0;
			}
		//return sql.insert(namespace+".join", mvo);
	}

	@Override
	public MemberVO selectOne(MemberVO mvo) {
		return sql.selectOne(namespace+".login", mvo);
	}

	@Override
	public ArrayList<MemberVO> selectList() {  //selectList가 return타입이 List이기 때문에 바꿔야함 ArrayList에서 List로 바꿈
		List<MemberVO> list = new ArrayList<>();
		list = sql.selectList(namespace+".list");
		return (ArrayList<MemberVO>) list;
	}

	@Override
	public int update(MemberVO mvo) {
		int isUp = sql.update(namespace+".edit",mvo);
		if(isUp>0) {
			sql.commit();
			return isUp;
			}else {
				logger.info(">> update error");
				return 0;
			}
	}

	@Override
	public int delete(String email) {
		int isDel = sql.delete(namespace+".remove", email);
		if(isDel>0) {
			sql.commit();
			return isDel;
			}else {
				logger.info(">> update error");
				return 0;
			}
	}

	@Override
	public MemberVO selectOne(String email) {
		return sql.selectOne(namespace+".info",email);
	}

	@Override
	public int selectCount(String email) {
		return sql.selectOne(namespace+".emailCount", email);
	}

	@Override
	public int selectCount() {
		return sql.selectOne(namespace+".cnt");
	}
}
