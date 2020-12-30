package com.gipkok.ctrl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.gipkok.domain.Paging;
import com.gipkok.domain.ProductVO;
import com.gipkok.service.ProductService;
import com.gipkok.service.ProductServiceImp;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.coobird.thumbnailator.Thumbnails;

@WebServlet("/product")
public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 2L;
	private ProductService psv;
	
	private static Logger logger = LoggerFactory.getLogger(ProductController.class);
    public ProductController() {
		psv = new ProductServiceImp();

    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.info(">>> Product Service start");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String sv = request.getParameter("sv");
		String destPage = "";
		logger.info(sv);
		switch (sv) {
		case "upl": 
			String realPath=request.getServletContext().getRealPath("/");
			String savePath=realPath+"upload";
			int maxSize=5*1024*1024; //1메가바이트
			logger.info(">>>>> real path : " + realPath);
			logger.info(">>>>> save path : " + savePath);
			MultipartRequest multi
				= new MultipartRequest(request, savePath, maxSize, "utf-8", new DefaultFileRenamePolicy());
			ProductVO pvo= new ProductVO();
			pvo.setCategory(multi.getParameter("category"));
			pvo.setPname(multi.getParameter("pname"));
			pvo.setContent(multi.getParameter("content"));
			pvo.setPrice(Double.parseDouble(multi.getParameter("price")));
			
			try {
			Enumeration files = multi.getFileNames();
			
			if(files.hasMoreElements()) {
				
				String uploadPath = multi.getFile("imgfile").getAbsolutePath();
				
				String paramName = (String)files.nextElement();
				logger.info(">>> paramName:"+paramName);
				String fileName = multi.getFilesystemName(paramName);
				logger.info(">>> fileName:"+fileName);
				
				if(fileName != null && fileName.trim().length() !=0) {
					
					String fileExt = fileName.substring(fileName.lastIndexOf(".")+1);
					String thumbSavePath =savePath+"\\s_"+fileName;
					switch (fileExt) {
					case "jpg": case "JPG": case "JPEG": case "jpeg": case "png": case "PNG":
						Thumbnails.of(new File(uploadPath))
				        .size(270, 270)
				        .toFile(new File(thumbSavePath));
					
							pvo.setThumb(thumbSavePath.substring(savePath.length()+1));
							logger.info(">>> 썸네일 생성 성공");
						break;
						default:
							break;
						}					
					}
					pvo.setImgfile(fileName);
				}else {
					pvo.setImgfile("Unattached");
				}						
			}catch (Exception e) {
				logger.info(">>> file upload fail");
			}
			
			int isUpl = psv.upload(pvo);
			logger.info(">>> 상품등록 : " + (isUpl> 0 ? "성공" : "실패"));
			destPage = "index.jsp";
			
			break;
		
		case "li":
			Paging page = new Paging(0, 10);
			ArrayList<ProductVO> pList = (ArrayList<ProductVO>) psv.getList(page);
			ArrayList<ProductVO> pvList = (ArrayList<ProductVO>) psv.getViewCList();
			ArrayList<ProductVO> poList = (ArrayList<ProductVO>) psv.getOrderCList();
			request.setAttribute("pList", pList);
			request.setAttribute("pvList", pvList);
			request.setAttribute("poList", poList);
			request.setAttribute("paging", page);
			destPage = "index.jsp?rp=main";
			break;
			
		case "lic":
			String cate = request.getParameter("ca");
			ArrayList<ProductVO> pcList = (ArrayList<ProductVO>) psv.getCateCList(cate);
			request.setAttribute("pcList", pcList);
			destPage = "index.jsp?rp=cate";
			break;
		
		case "list":
			int clPage = request.getParameter("cp") != null ? 
					Integer.parseInt(request.getParameter("cp")) : 1;
			int total = psv.totalCount();
			Paging paging = new Paging(clPage, total); //클릭값이랑 토탈페이지를 알기위해 DAO로 다녀와야함
			ArrayList<ProductVO> pList1 = (ArrayList<ProductVO>) psv.getList(paging);
			request.setAttribute("pList", pList1);
			request.setAttribute("paging", paging);
			destPage = "index.jsp?rp=pli";
			break;
		case "info":
			//info를 가져오기 위해서는? 무엇을?
			int pno = Integer.parseInt(request.getParameter("pno"));
			ProductVO pvo1 = psv.getInfo(pno);
			request.setAttribute("pvo", pvo1);
			destPage = "index.jsp?rp=dtl";
			break; 
		case "mod":
			int pno1 = Integer.parseInt(request.getParameter("pno"));
			ProductVO pvo2 = psv.getInfo(pno1);
			request.setAttribute("pvo", pvo2);
			destPage = "index.jsp?rp=pmod";
			break;
		case "upd":
			String realPath_up=request.getServletContext().getRealPath("/");
			String savePath_up=realPath_up+"upload";
			int maxSize_up=1024*1024; //1메가바이트
			
			MultipartRequest multi1
			= new MultipartRequest(request, savePath_up, maxSize_up, "utf-8", new DefaultFileRenamePolicy());
		ProductVO pvo3= new ProductVO();
		pvo3.setCategory(multi1.getParameter("category"));
		pvo3.setPname(multi1.getParameter("pname"));
		pvo3.setContent(multi1.getParameter("content"));
		pvo3.setPrice(Double.parseDouble(multi1.getParameter("price")));
		
		try {
		Enumeration files = multi1.getFileNames();
		
		if(files.hasMoreElements()) {
			
			String uploadPath = multi1.getFile("imgfile").getAbsolutePath();
			
			String paramName = (String)files.nextElement();
			logger.info(">>> paramName:"+paramName);
			String fileName = multi1.getFilesystemName(paramName);
			logger.info(">>> fileName:"+fileName);
			
			if(fileName != null && fileName.trim().length() !=0) {
				
				String fileExt = fileName.substring(fileName.lastIndexOf(".")+1);
				String thumbSavePath =savePath_up+"\\s_"+fileName;
				switch (fileExt) {
				case "jpg": case "JPG": case "JPEG": case "jpeg": case "png": case "PNG":
					Thumbnails.of(new File(uploadPath))
			        .size(270, 270)
			        .toFile(new File(thumbSavePath));
				
						pvo3.setThumb(thumbSavePath.substring(savePath_up.length()+1));
						logger.info(">>> 썸네일 생성 성공");
					break;
					default:
						break;
					}					
				}
				pvo3.setImgfile(fileName);
			}else {
				pvo3.setImgfile("Unattached");
			}						
		}catch (Exception e) {
			logger.info(">>> file re-upload fail");
		}
			
			int isUp = psv.modify(pvo3);
			logger.info(">>> 상품 수정 : " + (isUp> 0 ? "성공" : "실패"));
			request.setAttribute("pvo", pvo3);
			destPage = "index.jsp?rp=dtl";
			
			break;
		case "rm":
			//ProductVO pvo4 = (ProductVO) (request.getAttribute("pvo"));
			//int pno4 = pvo4.getPno();
			int pno4 = Integer.parseInt(request.getParameter("pno"));
			int isRem = psv.remove(pno4);
			destPage = "product?sv=list";
			
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
