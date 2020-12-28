package com.gipkok.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.gipkok.domain.CommentVO;
import com.gipkok.orm.DBBuilder;

public class CommentDAOimp implements CommentDAO {

	private static Logger logger = LoggerFactory.getLogger(CommentDAOimp.class);
	private SqlSession sql;
	private static String namespace = "com.king.mappers.commentMapper";
	
	public CommentDAOimp() {
		new DBBuilder();
		sql = DBBuilder.getFactory().openSession();
	}
	
	@Override
	public int insert(CommentVO cvo) {
		int isOk = sql.insert(namespace+".add", cvo);
		sql.commit();
		return isOk; 
	}

	@Override
	public CommentVO selectOne(CommentVO cvo) {
		sql.commit();
		return null;
	}

	@Override
	public List<CommentVO> selectList(Integer pno) {
		return sql.selectList(namespace+".list", pno);
	}
	

	@Override
	public CommentVO selectOne(Integer cno) {
		return null;
	}

	@Override
	public int update(CommentVO cvo) {
		return sql.update(namespace+".mod");
	}

	@Override
	public int delete(Integer cno) {
		return sql.delete(namespace);
	}

	
}
