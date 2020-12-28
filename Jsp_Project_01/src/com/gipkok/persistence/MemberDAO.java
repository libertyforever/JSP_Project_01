package com.gipkok.persistence;

import java.util.ArrayList;

import com.gipkok.domain.MemberVO;

public interface MemberDAO {
	public int insert(MemberVO mvo); // 가입
	public MemberVO selectOne(MemberVO mvo); //로그인 //맴버객체에서 grade등 속성을 가지고오기위해
	public ArrayList<MemberVO> selectList();
	public MemberVO selectOne(String email);
	public int update(MemberVO mvo);
	public int delete(String email);
	public int selectCount(String email);
	public int selectCount();
}
