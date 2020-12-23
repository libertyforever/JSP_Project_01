package com.gipkok.orm;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.SocketException;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class FtpManager {
   private static Logger logger = LoggerFactory.getLogger(FtpManager.class);
   
   public boolean fileUpload(String localFilePath, String remoteFilePath, String fileName, HttpServletRequest req) throws Exception {
      FTPClient ftp = null;
      FileInputStream fis = null;
      File uploadFile = new File(localFilePath);
      
      String url = "hyeong5273pg.dothome.co.kr";
      String id ="hyeong5273pg";
      String pwd = "waseda*5273";
      int port = 21;
      
      try {
         ftp = new FTPClient();
         ftp.setControlEncoding("UTF-8");
         ftp.connect(url, port);
         ftp.login(id, pwd);
         ftp.enterLocalPassiveMode();
         ftp.changeWorkingDirectory(remoteFilePath);
         ftp.setFileType(FTP.BINARY_FILE_TYPE);         
         
         fis = new FileInputStream(uploadFile);      
         return ftp.storeFile(fileName, fis);         
      } catch (SocketException e) {
         e.printStackTrace();
      } catch (FileNotFoundException e) {
         e.printStackTrace();
      } catch (IOException e) {
         e.printStackTrace();
      } finally {
         fis.close();
         ftp.logout();
      }
      return false;
   }
   
   public boolean fileRemove(String localFilePath, String remoteFilePath, String fileName, HttpServletRequest req) throws Exception {
	   FTPClient ftp = null;
	   //FileInputStream fis = null;
	   //File uploadFile = new File(localFilePath); 쓸모없음
	   
	   String url = "hyeong5273pg.dothome.co.kr";
	   String id ="hyeong5273pg";
	   String pwd = "waseda*5273";
	   int port = 21;
	   
	   try {
	         ftp = new FTPClient();
	         ftp.setControlEncoding("UTF-8");
	         ftp.connect(url, port);
	         ftp.login(id, pwd);
	         ftp.enterLocalPassiveMode();
	         ftp.changeWorkingDirectory(remoteFilePath);
	         ftp.setFileType(FTP.BINARY_FILE_TYPE);   
	         
	         return ftp.deleteFile(fileName);
	         
	         
	   }catch(Exception e) {
		   logger.info("FTP Delete : error");
		   return false;
	   }finally {
	         //fis.close();
	         ftp.logout();
	      }
   }
}