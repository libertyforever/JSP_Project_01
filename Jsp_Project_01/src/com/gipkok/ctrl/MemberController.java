package com.gipkok.ctrl;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.king.domain.MemberVO;
import com.king.domain.Paging;
import com.king.service.MemberService;
import com.king.service.MemberServiceImp;


@WebServlet("/member")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService msv;
	
	private static Logger logger = LoggerFactory.getLogger(MemberController.class);
   
	public MemberController() {
		msv = new MemberServiceImp();
    }

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	
	String sv = request.getParameter("sv");
	String destPage = "";
	
	switch (sv) {
	case "join": 
		String email = request.getParameter("email");
		String pwd = request.getParameter("pwd");
		String nickname = request.getParameter("nickname");
		MemberVO mvo = new MemberVO(email, nickname, pwd);
		int isJoin = msv.join(mvo);
		logger.info(">> MemberController > join : " + (isJoin> 0 ? "success" : "fail"));
		
		destPage = "index.jsp"; //가입완료페이지
		break;
	
	case "login":
		String email2 = request.getParameter("email");
		String pwd2 = request.getParameter("pwd");
		MemberVO mvo2 = new MemberVO(email2, pwd2);
		mvo2 = msv.login(mvo2);
		//request.setAttribute("mvo", mvo2); -> 세션에 싩기
		HttpSession ses = request.getSession();
		ses.setAttribute("ses_mvo", mvo2);
		
		destPage = "index.jsp";
		break;
	case "logout":
		HttpSession sesForOut = request.getSession();
		sesForOut.invalidate();
		destPage = "index.jsp";
		break; 
	case "list":
		
		int clPage = request.getParameter("cp") != null ? 
				Integer.parseInt(request.getParameter("cp")) : 1; //page
		int total = msv.totalCount();
		Paging paging = new Paging(clPage, total);
		
		ArrayList<MemberVO> mList = new ArrayList<MemberVO>();
		mList = msv.getList();
		request.setAttribute("mList", mList);
		request.setAttribute("paging", paging);
		destPage = "index.jsp?rp=mList";
		break;
	case "modify":
		String email3 = request.getParameter("email");
		MemberVO mvo3 = msv.getInfo(email3);
		request.setAttribute("mvo", mvo3);
		destPage = "index.jsp?rp=mModify";
		break;
	case "update":
		String email4 = request.getParameter("email");
		String pwd4 = request.getParameter("pwd");
		String nickname4 = request.getParameter("nickname");
		int isUpdate = msv.modify(new MemberVO(email4, nickname4, pwd4));
		logger.info("MemberCtrl >> Update " + (isUpdate > 0 ? "success" : "fail"));
		destPage = "member?sv=list";
		break;
	case "check":
		String email5=request.getParameter("email");
		int isExist = msv.emailCheck(email5);
		// 그페이지에서 카운트를 해서 반환하기 때문에 destpage로 request가 있으면 안 됨.
		PrintWriter out = response.getWriter();
		out.print(isExist);
		break;
	case "remove":
		String email6 = request.getParameter("email");
		msv.remove(email6);
		destPage = "member?sv=list";
		break;
	default:
	break;
	
	}
	if(destPage != "") {
		RequestDispatcher rdp = request.getRequestDispatcher(destPage);
		rdp.forward(request, response);

	}
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		service(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		service(request, response);
	}

}
