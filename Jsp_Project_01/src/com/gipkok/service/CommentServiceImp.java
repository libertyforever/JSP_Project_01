package com.gipkok.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.gipkok.domain.CommentVO;
import com.gipkok.persistence.CommentDAO;
import com.gipkok.persistence.CommentDAOimp;

public class CommentServiceImp implements CommentService {

	private static Logger logger = LoggerFactory.getLogger(CommentServiceImp.class);
	private CommentDAO cdao;
	
	public CommentServiceImp() {
		cdao = new CommentDAOimp();
	}
	
	@Override
	public int write(CommentVO cvo) {
		return cdao.insert(cvo);
	}

	@Override
	public List<CommentVO> getList(Integer pno) {
		return cdao.selectList(pno);
	}

	@Override
	public int modify(CommentVO cvo) {
		return cdao.update(cvo);
	}

	@Override
	public int remove(Integer cno) {
		return cdao.delete(cno);
	}

	@Override
	public int totalCount() {
		return 0;
	}
}
