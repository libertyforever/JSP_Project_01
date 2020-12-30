package com.gipkok.ctrl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.gipkok.domain.CartVO;
import com.gipkok.domain.MemberVO;
import com.gipkok.domain.Paging;
import com.gipkok.service.CartService;
import com.gipkok.service.CartServiceImp;


@WebServlet("/Cart")
public class CartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Logger logger = LoggerFactory.getLogger(CartController.class);
    private CartService casv; 
    
    public CartController() {
       casv = new CartServiceImp();
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
			int pno = Integer.parseInt( request.getParameter("pno"));
			String pname = request.getParameter("pname");
			int cnt = Integer.parseInt( request.getParameter("cnt"));
			String thumb= request.getParameter("thumb");
			CartVO cavo = new CartVO(id, pno, pname, cnt, thumb);
			int isJoin = casv.join(cavo);
			logger.info(">>> CartController > join : "
					+ (isJoin > 0 ? "카트등록성공":"카트등록실패"));
			destPage ="index.jsp"; 
			break;
			
		case "list":
			int clPage = request.getParameter("cp") != null ?
					Integer.parseInt(request.getParameter("cp")) : 1;
			int total = casv.totalCount();
			Paging paging = new Paging(clPage, total);
			ArrayList<CartVO> cList = new ArrayList<>();
			cList = (ArrayList<CartVO>) casv.getlist(paging);
			request.setAttribute("cList", cList);
			request.setAttribute("paging", paging);
			destPage = "index.jsp?rp=cList";
			break;
			
		case "rm":
			int cavo1 =Integer.parseInt(request.getParameter("cano"));
			int cavo2 = casv.remove(cavo1); 
			request.setAttribute("pvo", cavo2);
			destPage  = "index.jsp?rp=cList";
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
