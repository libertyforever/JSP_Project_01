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

import com.gipkok.domain.MemberVO;
import com.gipkok.service.MemberService;
import com.gipkok.service.MemberServiceImp;

@WebServlet("/member")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Logger logger = LoggerFactory.getLogger(MemberController.class); 
	private MemberService msv;
	
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
			String id = request.getParameter("id");			
			String pwd = request.getParameter("pwd");
			String nickname = request.getParameter("nickname");
			MemberVO mvo = new MemberVO(id, pwd, nickname);
			int isJoin = msv.join(mvo);
			logger.info(">>> MemberController > join : "
					+ (isJoin > 0 ? "가입성공":"가입실패"));
			destPage ="index.jsp"; 
			break;
		case "login":
			String email2 = request.getParameter("id");
			String pwd2 = request.getParameter("pwd");
			MemberVO mvo2 = new MemberVO(email2, pwd2);
			mvo2 = msv.login(mvo2);
			HttpSession ses = request.getSession();
			ses.setAttribute("ses_mvo", mvo2);
			destPage = "index.jsp";
			break;
		case "logout":
			HttpSession session = request.getSession();
			session.invalidate();
			destPage = "index.jsp";
			break;
		case "list":
			ArrayList<MemberVO> mList = new ArrayList<>();
			mList = msv.getList();
			request.setAttribute("mList", mList);
			destPage = "index.jsp?rp=mList";
			break;
		case "modify":
			String email3 = request.getParameter("id");
			MemberVO mvo3 = msv.getInfo(email3);
			request.setAttribute("mvo", mvo3);
			destPage = "index.jsp?rp=mModify";
			break;
		case "update":
			String email4 = request.getParameter("id");
			String nickname4 = request.getParameter("nickname");
			String pwd4 = request.getParameter("pwd");
			int isUp = msv.modify(new MemberVO(email4, pwd4, nickname4));
			logger.info(">>> MemberController > update : "
					+ (isUp > 0 ? "수정성공":"수정실패"));
			destPage = "member?sv=list";
			break;
		case "check":
			String email5 = request.getParameter("email");
			logger.info(">>> email : " + email5);
			int exist = msv.emailCheck(email5);
			logger.info(">>> exist : " + exist);
			PrintWriter out = response.getWriter();
			out.print(exist);			
			break;
		case "rm":
			String email6=request.getParameter("id");
			msv.remove(email6);
			destPage="./member?sv=list";
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
