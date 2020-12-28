package com.gipkok.persistence;

import java.util.List;

import com.gipkok.domain.CommentVO;

public interface CommentDAO {
	public int insert(CommentVO cvo); // 코멘트 작성
	public CommentVO selectOne(CommentVO cvo); //필요하나?
	public List<CommentVO> selectList(Integer pno);
	public CommentVO selectOne(Integer cno);
	public int update(CommentVO cvo);
	public int delete(Integer cno);
}
