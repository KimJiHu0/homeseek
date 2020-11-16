<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>homeseek : Q&A</title>
<%@ include file="form/header.jsp"%>

<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/qnaList.css"
   type="text/css" />
<script src="${pageContext.request.contextPath}/resources/js/qnaList.js"
   type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/js/paging.js"
   type="text/javascript"></script>

</head>

<body>
   <!-- header.jsp -->
   <section>
      <div id="products">

         <form action="" id="setRows">
            <input type="hidden" name="rowPerPage" value="10">
         </form>

         <h1> < Q  N  A > </h1>

         <div id="qnaSearch_bar" class="search_wrap">
            <a> 검 색 : <input width="300px" id="qnaSearch" class="notice_search"  type="search" value=""
               placeholder="내 용 을 검 색 해 주 세 요" /></a>
         </div>

         <table border="1" class="table_notice">
            <thead>
               <tr class="even">
                  <th style="width: 50px;">번호</th>
                  <th style="width: 100px;">작성자</th>
                  <th style="width: 500px;">제목</th>
                  <th style="width: 150px;">작성일</th>
                  <th style="width: 50px;">비밀글여부</th>
               </tr>
            </thead>
            <tbody id="qnaTable">
               <c:choose>
                  <c:when test="${empty list }">
                     <tr>
                        <th colspan="5">--작성된 글이 존재하지 않습니다--</th>
                     </tr>
                  </c:when>
                  <c:otherwise>
                     <c:forEach items="${list }" var="dto">
                        <tr class="eval-contents"
                           onclick="location.href='qnadetail.do?qna_no=${dto.qna_no}'">
                           <td id="td_notice_point2">${dto.qna_no}</td>
                           <td>${dto.qna_id }</td>
                           <td>${dto.qna_title }</td>
                           <td><fmt:formatDate pattern="yyyy-MM-dd" value="${dto.qna_regdate}" /></td>
                           <c:choose>
                              <c:when test="${dto.qna_secretflag eq 'Y'.charAt(0) }">
                                 <td>비밀글</td>
                              </c:when>
                              <c:otherwise>
                                 <td>공개글</td>
                              </c:otherwise>
                           </c:choose>
                        </tr>
                     </c:forEach>
                  </c:otherwise>
               </c:choose>
            </tbody>
            <tr>
               <c:if test="${ empty login }">
                  <td colspan="5" align="right">
                     <div align="right" class="btn_wrap">
                        <input width="300px" class="notice_search login2" type="button" value="로그인 후 글작성" onclick="getSnsUrl();" />
                     </div>   
                  </td>
               </c:if>
               <c:if test="${ not empty login }">
                  <td colspan="5" align="right">
                     <div align="right" class="btn_wrap">
                        <input class="notice_button" type="button" value="글작성" class="btn_1" onclick="location.href='qnainsertform.do'" />
                     </div>   
                  </td>
               </c:if>
            </tr>
         </table>
      </div>


   </section>

   <script>
      $("#qnaSearch")
            .keyup(
                  function() {
                     var keyword = $(this).val();
                     console.log(keyword);
                     $
                           .ajax({
                              url : "${ pageContext.request.contextPath}/qnaSearch.do",
                              data : {
                                 keyword : keyword
                              },
                              dataType : "json",
                              method : "GET",
                              success : function(data) {
                                 console.log(data.list);
                                 displayResultTable("qnaTable",
                                       data.list);

                                 var $setRows = $('#setRows');

                                 $setRows
                                       .submit(function(e) {
                                          e.preventDefault();
                                          var rowPerPage = $(
                                                '[name="rowPerPage"]')
                                                .val() * 1;// 1 을  곱하여 문자열을 숫자형로 변환

                                          var zeroWarning = 'Sorry, but we cat\'t display "0" rows page. + \nPlease try again.'
                                          if (!rowPerPage) {
                                             alert(zeroWarning);
                                             return;
                                          }
                                          $('#nav').remove();
                                          var $products = $('#products');
                                          var $products2 = $('#paging');

                                          $products
                                                .after('<div id="nav" class="paging pagination">');

                                          var $tr = $($products)
                                                .find(
                                                      '.eval-contents');
                                          var rowTotals = $tr.length;

                                          var pageTotal = Math
                                                .ceil(rowTotals
                                                      / rowPerPage);
                                          var i = 0;

                                          for (; i < pageTotal; i++) {
                                             $('<a></a>')
                                                   .attr(
                                                         'rel',
                                                         i)
                                                   .html(i + 1)
                                                   .appendTo(
                                                         '#nav');
                                          }

                                          $tr
                                                .addClass(
                                                      'off-screen')
                                                .slice(0,
                                                      rowPerPage)
                                                .removeClass(
                                                      'off-screen');

                                          var $pagingLink = $('#nav a');
                                          $pagingLink
                                                .on(
                                                      'click',
                                                      function(
                                                            evt) {
                                                         evt
                                                               .preventDefault();
                                                         var $this = $(this);
                                                         if ($this
                                                               .hasClass('active')) {
                                                            return;
                                                         }
                                                         $pagingLink
                                                               .removeClass('active');
                                                         $this
                                                               .addClass('active');

                                                         var currPage = $this
                                                               .attr('rel');
                                                         var startItem = currPage
                                                               * rowPerPage;
                                                         var endItem = startItem
                                                               + rowPerPage;

                                                         $tr
                                                               .css(
                                                                     'opacity',
                                                                     '0.0')
                                                               .addClass(
                                                                     'off-screen')
                                                               .slice(
                                                                     startItem,
                                                                     endItem)
                                                               .removeClass(
                                                                     'off-screen')
                                                               .animate(
                                                                     {
                                                                        opacity : 1
                                                                     },
                                                                     100);

                                                      });

                                          $pagingLink
                                                .filter(
                                                      ':first')
                                                .addClass(
                                                      'active');

                                       });

                                 $setRows.submit();

                              },
                              error : function(xhr, status, err) {
                                 console.log("처리실패", xhr, status,
                                       err);
                              }
                           });
                  });

      function displayResultTable(id, data) {
         var $container = $("#" + id);

         var html = "";
         var dateFormat = "";
         if (Object.keys(data).length > 0) {
            html += "<form action='' id='setRows'><input type='hidden' name='rowPerPage' value='10'></form>"
            for ( var i in data) {
               var list = data[i];
               html += `<tr class='eval-contents' onclick="location.href='qnadetail.do?qna_no=`
                     + list.qna_no + `'">`;
               html += "<td>" + list.qna_no + "</td>";
               html += "<td>" + list.qna_id + "</td>";
               html += "<td>" + list.qna_title + "</td>";
               html += "<td>" + list.qna_regdate + "</td>";
               html += "<td>" + list.qna_secretflag + "</td>";
               html += "</td>";
               html += "</tr>";
            }
         } else {
            html += "<tr><td colspan='5'>검색된 결과가 없습니다.</td></tr>";
         }

         $container.html(html);

      }
   </script>
   <!--    <script type="text/javascript">
      $(document).ready(function() {

         $("#regBtn").on("click", function() {
            self.location = "qnainsertform.do";
         });
         /* 목록에서 버튼으로 이동하기 jquery */

      });
   </script> -->

   <!-- footer.jsp -->
   <%@ include file="form/footer.jsp"%>
</body>
<script type="text/javascript">
$(".login2").click(function() {
    $(".modal-back").show();
    $(".modal_login").css("z-index", "20");
    $(".modal_login").css("top", "100px");
    $(".modal_login").css("opacity", "1");
 });

 $(".modal-back").click(function() {
    $(this).hide();
    $(".modal_login").css("top", "50px");
    $(".modal_login").css("opacity", "0");
    $(".modal_login").css("z-index", "-1");
 });
</script>
</html>