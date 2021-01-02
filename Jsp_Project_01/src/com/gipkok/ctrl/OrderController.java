package com.gipkok.ctrl;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.gipkok.domain.CartVO;
import com.gipkok.service.OrderService;
import com.gipkok.service.OrderServiceImp;



@WebServlet("/ordera/*")
public class OrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private OrderService osvc;
	private static Logger logger = LoggerFactory.getLogger(OrderController.class);
    
	public OrderController() {
		osvc = new OrderServiceImp();
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/heml;charset=utf-8");
		
		String uri = request.getRequestURI();
	    String ctxPath = request.getContextPath();
	    logger.info("ctxpath : "+ ctxPath);
	    String svlPath = request.getServletPath();
	    logger.info("svlPath : " + svlPath);
	    String mapping = uri.substring(ctxPath.length()+svlPath.length()); 
	    logger.info(mapping);
		
	    String destPage ="";
		
	    	    
		switch (mapping) {
		case "/odr":
			String json_test = request.getParameter("prdinfo");
			String jsonString = "{\"posts\":" +json_test+ "}";
			
			JSONParser parse = new JSONParser();
			try {
				Object jObject = (JSONObject) parse.parse(jsonString);
				JSONArray jArray = (JSONArray) jObject;

				for (Object key : jArray) {
					System.out.println(key);
				}
				
			} catch (ParseException e) {
				e.printStackTrace();
			}

			
			
			
			logger.info("what is??? json?? : ");
			destPage = "index.jsp?rp=cList";
			break;
			
		case "list":
			//int clPage = request.getParameter("cp") != null ?
			//Integer.parseInt(request.getParameter("cp")) : 1;
			//int total = osvc.totalCount();
			//Paging paging = new Paging(clPage, total);
			ArrayList<CartVO> cList = new ArrayList<>();
			//cList = (ArrayList<CartVO>) osvc.getlist(paging);
			//request.setAttribute("cList", cList);
			//request.setAttribute("paging", paging);
			destPage = "index.jsp?rp=oList";
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
		service(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		service(request,response);
	}

}
