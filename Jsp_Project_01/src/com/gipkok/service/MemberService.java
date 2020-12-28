package com.gipkok.service;

import java.util.ArrayList;

import com.gipkok.domain.MemberVO;

public interface MemberService {
	public int join(MemberVO mvo);
	public MemberVO login(MemberVO mvo);
	public ArrayList<MemberVO> getList();
	public MemberVO getInfo(String email);
	public int modify(MemberVO mvo);
	public int remove(String email);
	public int emailCheck(String email5);
	public int totalCount();
}
