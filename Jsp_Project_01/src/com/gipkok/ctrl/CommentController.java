package com.gipkok.ctrl;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.gipkok.domain.CommentVO;
import com.gipkok.service.CommentService;
import com.gipkok.service.CommentServiceImp;

@WebServlet("/comment/*")
public class CommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
      private CommentService csv;
      private static Logger logger = LoggerFactory.getLogger(MemberController.class);
    
      public CommentController() {
    	  csv = new CommentServiceImp();
    }
    
      protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    req.setCharacterEncoding("utf-8");
	   	resp.setCharacterEncoding("utf-8");
	   	resp.setContentType("text/html;charset=utf-8");
	    
	    String uri = req.getRequestURI();
	    String ctxPath = req.getContextPath();
	    logger.info("ctxpath : "+ ctxPath);//project name
	    String svlPath = req.getServletPath();
	    logger.info("svlPath : " + svlPath);//@WebServlet : /comment
	    String mapping = uri.substring(ctxPath.length()+svlPath.length()); 
    	
	    switch (mapping) {
		case "/add": 
			int pno = Integer.parseInt(req.getParameter("pno"));
			String writer = req.getParameter("writer");
			String comment = req.getParameter("comment");
			
			CommentVO cvo = new CommentVO(pno, writer, comment);
			int isOk = csv.write(cvo);
			PrintWriter out = resp.getWriter();
			out.print(isOk);
			break;

		case "/list": 
			int pno2 = Integer.parseInt(req.getParameter("pno"));
			List<CommentVO> cList = csv.getList(pno2);
			JSONArray cmtArr = new JSONArray();
			for (int i = 0; i < cList.size(); i++) {
				JSONObject cmtObj = new JSONObject();
				cmtObj.put("cno", cList.get(i).getCno());
				cmtObj.put("pno", cList.get(i).getPno());
				cmtObj.put("writer", cList.get(i).getWriter());
				cmtObj.put("comment", cList.get(i).getComment());
				cmtObj.put("regdate", cList.get(i).getRegdate());
				cmtArr.add(cmtObj);
			}
			String jsonCmtStringData = cmtArr.toJSONString();
			logger.info(">>>jsonCmtStringData : " + jsonCmtStringData);
			
			PrintWriter out2 = resp.getWriter();
			out2.print(jsonCmtStringData);
			
			
			break;
		case "mod": 
			break;
		case "rm": 
			break;
		default:
			break;
	    }
    	
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	service(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	service(request,response);


}
}

