package com.gipkok.service;

import java.util.List;

import com.king.domain.CommentVO;

public interface CommentService {
	public int write(CommentVO cvo);
	public List<CommentVO> getList(Integer pno);
	public int modify(CommentVO cvo);
	public int remove(Integer cno);
	public int totalCount();
}
