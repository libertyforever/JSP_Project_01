package com.gipkok.ctrl;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.gipkok.domain.CartVO;
import com.gipkok.domain.OrderVO;
import com.gipkok.domain.ProductVO;
import com.gipkok.service.OrderService;
import com.gipkok.service.OrderServiceImp;
import com.gipkok.service.ProductService;
import com.gipkok.service.ProductServiceImp;

@WebServlet("/ordera")
public class OrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private OrderService osvc;
	private ProductService psv;
	private static Logger logger = LoggerFactory.getLogger(OrderController.class);

	public OrderController() {
		osvc = new OrderServiceImp();
		psv = new ProductServiceImp();

	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/heml;charset=utf-8");

		// String uri = request.getRequestURI();
		// String ctxPath = request.getContextPath();
		// String svlPath = request.getServletPath();
		// String mapping = uri.substring(ctxPath.length()+svlPath.length());

		String sv = request.getParameter("sv");
		String destPage = "";

		switch (sv) {
		case "odr": // 전체주문
			String prdinfo = request.getParameter("prdinfo");
			prdinfo = prdinfo.substring(1);
			String id = request.getParameter("id");
			int status = 1; // 주문을 1로 하기로함;

			OrderVO ovo = new OrderVO();
			ovo.setId(id);
			ovo.setPrdinfo(prdinfo);
			ovo.setStatus(status);

			int isReg = osvc.regist(ovo);
			logger.info(">>> Order ctrl > order : " + (isReg > 0 ? "주문성공" : "주문실패"));

			String[] prdinfoList = prdinfo.split(",");
			ArrayList<CartVO> ocList = new ArrayList<CartVO>();

			
			for (String prdset : prdinfoList) {
				CartVO cvo = new CartVO();

				logger.info(prdset.toString());
				logger.info(prdset.split(":")[0]);
				logger.info(prdset.split(":")[1]);
				
				psv.countUpOdr(prdset.split(":")[0]);
				cvo.setpno(Integer.parseInt(prdset.split(":")[0]));
				cvo.setcnt(Integer.parseInt(prdset.split(":")[1]));
				ProductVO pvo = psv.getInfo(Integer.parseInt(prdset.split(":")[0]));
				cvo.setPname(pvo.getPname());
				cvo.setPrice(pvo.getPrice());
				cvo.setid(id); 
				ocList.add(cvo);
				// 주문상태를 표출하는 것이라 카트 no는 필요없음
			}
			 
			request.setAttribute("ocList", ocList);
			request.setAttribute("ovo", ovo);

			destPage = "index.jsp?rp=odrComp";
			break;
		case "li":
			String id1 = request.getParameter("id");
			List<OrderVO> oList = osvc.getlist(id1);
			request.setAttribute("oList", oList);
			destPage = "index.jsp?rp=oList";
			break;
			
		case "lio":
			int ono = Integer.parseInt(request.getParameter("ono"));
			OrderVO ovo2 = osvc.getlistone(ono);
			
			String prdinfo1 = ovo2.getPrdinfo();
			//prdinfo1 = prdinfo1.substring(1); 첫글자 안 까도 됨요.
			String[] prdinfoList2 = prdinfo1.split(",");
			int prdCount = prdinfoList2.length - 1;
			String prd1Name = psv.getInfo((Integer.parseInt(prdinfoList2[0].split(":")[0]))).getPname();
			int prdSum = 0;
			for (String prdset : prdinfoList2) {
				ProductVO pvo = psv.getInfo(Integer.parseInt(prdset.split(":")[0]));
				prdSum += pvo.getPrice() * Integer.parseInt(prdset.split(":")[1]);
				//price와 cnt 곱을 더해서 구매 총액 sum 도출.
			}
			
			JSONObject prdordObj = new JSONObject();
			prdordObj.put("prd1Name", prd1Name);
			prdordObj.put("prdCount", prdCount);
			prdordObj.put("prdSum", prdSum);
			
			String jsonPObjStrData = prdordObj.toJSONString();
			
			PrintWriter out2 = response.getWriter();
			out2.print(jsonPObjStrData);
		default:
			break;
		}

		if (destPage != "") {
			RequestDispatcher rdp = request.getRequestDispatcher(destPage);
			rdp.forward(request, response);
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		service(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		service(request, response);
	}

}

/*
 * json 일단 보류 String json_test = request.getParameter("prdinfo"); String
 * jsonString = "{\"posts\":" +json_test+ "}";
 * 
 * JSONParser parse = new JSONParser(); try { Object jObject = (JSONObject)
 * parse.parse(jsonString); JSONArray jArray = (JSONArray) jObject;
 * 
 * for (Object key : jArray) { System.out.println(key); }
 * 
 * } catch (ParseException e) { e.printStackTrace(); }
 */
