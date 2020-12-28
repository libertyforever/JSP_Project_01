package com.gipkok.ctrl;

import java.awt.Image;
import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
import com.gipkok.orm.FtpManager;
import com.gipkok.service.ProductService;
import com.gipkok.service.ProductServiceImp;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sun.jimi.core.Jimi;
import com.sun.jimi.core.JimiException;
import com.sun.jimi.core.JimiUtils;

import net.coobird.thumbnailator.Thumbnails;


@WebServlet("/product")
public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
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
	
	switch (sv) {
	case "upl": 
		String realPath=request.getServletContext().getRealPath("/");
		String savePath=realPath+"upload";
		int maxSize=1024*1024; //1메가바이트
		
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
			String paramName = (String)files.nextElement();
			logger.info(">>> paramName:"+paramName);
			String fileName = multi.getFilesystemName(paramName);
			logger.info(">>> fileName:"+fileName);
			if(fileName != null && fileName.trim().length() !=0) {
				String fileExt = fileName.substring(fileName.lastIndexOf(".")+1);
				boolean isImage = (fileExt.equalsIgnoreCase("JPG") ||
						fileExt.equalsIgnoreCase("JPEG") ||
						fileExt.equalsIgnoreCase("PNG"));
				if(isImage) {
					String thumbSavePath = realPath + "\\s_" + fileName;
					int width = 250;
					int height = 250;
					Image thumbNail = 
							JimiUtils.getThumbnail(realPath+"/"+fileName,
									width, height, Jimi.IN_MEMORY);
					try {
						Jimi.putImage(thumbNail, thumbSavePath);
						pvo.setThumb(thumbSavePath.substring(realPath.length()+1));
					} catch (JimiException e) {
						logger.info(">>> 썸네일 생성 실패");
						e.printStackTrace();
					}					
				}
				pvo.setImgfile(fileName);
			}else {
				pvo.setImgfile("Unattached");
			}						
		}
		}catch (Exception e) {
			logger.info(">>> file upload fail");
		}
		
		int isUpl = psv.upload(pvo);
		logger.info(">>> 상품등록 : " + (isUpl> 0 ? "성공" : "실패"));
		destPage = "index.jsp";
		
		break;
		
	case "list":
		//PrintWriter out = response.getWriter();
		//out.print("<script>alert('등록성공?');</script>");
		int clPage = request.getParameter("cp") != null ? 
				Integer.parseInt(request.getParameter("cp")) : 1;
		int total = psv.totalCount();
		Paging paging = new Paging(clPage, total); //클릭값이랑 토탈페이지를 알기위해 DAO로 다녀와야함
		ArrayList<ProductVO> pList = (ArrayList<ProductVO>) psv.getList(paging);
		request.setAttribute("pList", pList);
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
		
		MultipartRequest multi_up
			= new MultipartRequest(request, savePath_up, maxSize_up, "utf-8", new DefaultFileRenamePolicy());
		ProductVO pvo3= new ProductVO();
		pvo3.setPno(Integer.parseInt(multi_up.getParameter("pno")));
		pvo3.setCategory(multi_up.getParameter("category"));
		pvo3.setPname(multi_up.getParameter("pname"));
		pvo3.setContent(multi_up.getParameter("content"));
		pvo3.setPrice(Double.parseDouble(multi_up.getParameter("price")));
		
		if(multi_up.getFile("imgfile") != null) {
			String uploadPath_up = multi_up.getFile("imgfile").getAbsolutePath();
			LocalDateTime now = LocalDateTime.now();
			DateTimeFormatter form = DateTimeFormatter.ofPattern("yyMMddHHmmss");
			String dateForm = now.format(form);
			
			String fileName = uploadPath_up.substring(uploadPath_up.lastIndexOf("\\")+1);
			String uploadFileName = dateForm +"_"+ fileName;			    
		    logger.info(">>> uploadFileName : " + uploadFileName);			    
			
		    FtpManager fm = new FtpManager();
		    try {
				fm.fileUpload(uploadPath_up, "/html/jspimg", uploadFileName, request);
				pvo3.setImgfile("http://hyeong5273pg.dothome.co.kr/jspimg/"+uploadFileName);
			} catch (Exception e) {
				logger.info(">>> 파일 업로드 실패!");
				e.printStackTrace();
			}
		    String fileExt = fileName.substring(fileName.lastIndexOf(".")+1);
		    switch (fileExt) {
			case "jpg": case "JPG": case "JPEG": case "jpeg": case "png": case "PNG":
				Thumbnails.of(new File(uploadPath_up))
		        .size(270, 270)
		        .toFile(new File(savePath_up+"\\s_"+fileName));
				
				try {
					fm.fileUpload(savePath_up+"\\s_"+fileName,
							"/html/jspimg", "s_"+ uploadFileName, request);
					pvo3.setThumb("http://hyeong5273pg.dothome.co.kr/jspimg/"+"s_"+ uploadFileName);
				} catch (Exception e) {
					logger.info(">>> 썸네일 업로드 실패!");
					e.printStackTrace();
				}
				break;

			default:
				break;
			}		
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
