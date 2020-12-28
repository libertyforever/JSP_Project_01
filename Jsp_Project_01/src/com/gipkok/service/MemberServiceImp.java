package com.gipkok.service;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.gipkok.domain.MemberVO;
import com.gipkok.persistence.MemberDAO;
import com.gipkok.persistence.MemberDAOImp;

public class MemberServiceImp implements MemberService{
	private static Logger logger = LoggerFactory.getLogger(MemberServiceImp.class);
	private MemberDAO mdao;
	
	public MemberServiceImp() {
		mdao = new MemberDAOImp();
	}	
	@Override
	public int join(MemberVO mvo) {		
		return mdao.insert(mvo);
	}

	@Override
	public MemberVO login(MemberVO mvo) {
		return mdao.selectOne(mvo);
	}

	@Override
	public ArrayList<MemberVO> getList() {
		return mdao.selectList();
	}

	@Override
	public MemberVO getInfo(String email) {
		return mdao.selectOne(email);
	}
	@Override
	public int modify(MemberVO mvo) {
		return mdao.update(mvo);
	}

	@Override
	public int remove(String email) {
		return mdao.delete(email);
	}
	@Override
	public int emailCheck(String email) {
		return mdao.selectCount(email); //뭔가의 수치값 받을때 count
	}
	@Override
	public int totalCount() {
		return mdao.selectCount();
	}
}
