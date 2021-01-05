<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   <footer id="footer"><!--Footer-->
            
      <div class="footer-widget">
         <div class="container">
            <div class="row">
               <div class="col-sm-2">
                  <div class="single-widget">
                     <h2>Service</h2>
                     <ul class="nav nav-pills nav-stacked">
                        <li><a href="index.jsp?rp=login">Login</a></li>
                        <li><a href="index.jsp?rp=logout">Logout</a></li>
                        <c:choose>
                        <c:when test="${ses_mvo.id ne '' && ses_mvo.id ne null }">
                        <li><a href="./ordera?sv=li&id=${ses_mvo.id }">Order Status</a></li>
                        </c:when><c:otherwise>
                        <li><a href="./Cart?sv=list">My Cart</a></li>
                        </c:otherwise>
                        </c:choose>
                     </ul>
                  </div>
               </div>
               <div class="col-sm-2">
                  <div class="single-widget">
                     <h2>Quick Shop</h2>
                     <ul class="nav nav-pills nav-stacked">
                        <li><a href="./product?sv=lic&ca=pm">Plastic Figure</a></li>
                        <li><a href="./product?sv=lic&ca=lg">Block</a></li>
                        <li><a href="./product?sv=lic&ca=pg">3D Puzzle</a></li>
                        <li><a href="./product?sv=lic&ca=ss">Quilt/Drawing</a></li>
                     </ul>
                  </div>
               </div>
               <div class="col-sm-3 col-sm-offset-1">
                  <div class="single-widget">
                     <h2>Ask to Shopper</h2>
                     <form action="mailto:hyeong5273pg@gmail.com" class="searchform">
                        <input type="text" placeholder="email to manager" readonly="readonly"/>
                        <button type="submit" class="btn btn-default"><i class="fa fa-arrow-circle-o-right"></i></button>
                     </form>
                  </div>
               </div>
               
            </div>
         </div>
      </div>
      
      <div class="footer-bottom">
         <div class="container">
            <div class="row">
               <p class="pull-left">Copyright © GipKok. All rights reserved.</p>
               <p class="pull-right">Designed by <span><a target="_blank" href="">Themeum</a></span><span> Modified by <a>J.G.Lee, Y.J.Shin, and Y.H.Cho</a></span></p>
            </div>
         </div>
      </div>
      
   </footer><!--/Footer-->
   

  
    <script src="js/jquery.js"></script>
   <script src="js/bootstrap.min.js"></script>
   <script src="js/jquery.scrollUp.min.js"></script>
   <script src="js/price-range.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
</body>
</html>