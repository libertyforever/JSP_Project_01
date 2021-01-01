package com.gipkok.ctrl;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.gipkok.service.OrderService;
import com.gipkok.service.OrderServiceImp;

import sun.security.krb5.internal.LastReqEntry;

@WebServlet("/order/*")
public class OrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Logger logger = LoggerFactory.getLogger(OrderController.class);
	private OrderService osvc;
    
	public OrderController() {
		osvc = new OrderServiceImp();
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/heml;charset=utf-8");
		
		String uri = request.getRequestURI();
		String contextPath = request.getContextPath();
		String servletPath = request.getServletPath();
		String mapping = uri.substring(contextPath.length()+servletPath.length()+1);
		
		switch (mapping) {
		case "odr":
			
			break;

		default:
			break;
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
