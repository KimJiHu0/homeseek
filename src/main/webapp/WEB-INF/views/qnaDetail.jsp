<%@page import="com.mvc.homeseek.model.dto.QnaDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Qna 상세 글보기</title>
<script type="text/javascript"
   src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/qnaDetail.css"
   type="text/css" />
<script
   src="${pageContext.request.contextPath}/resources/js/qnaDetail.js"
   type="text/javascript"></script>
</head>
<script>
   $(document).ready(function(){
      var pwdCheck = prompt('비밀번호를 입력해주세요');
      console.log(typeof pwdCheck == $('#qna_pwd').val());//false
      console.log(typeof pwdCheck);//String
      console.log(Number(pwdCheck));//111
      console.log($('#qna_pwd').val());
      console.log($('input[name=qna_pwd]').val());
      console.log(document.getElementById("qna_pwd").value);
      console.log(document.getElementById("qna_pwd").value);
      
      
      
      if(Number(pwdCheck) == $('input[name=qna_pwd]').val()){//qna_pwd값을 가져와야하는데 뭘써야 할지 모르겠어요  값이 0이떠요
         $('section').css('display','block');
      }else{
         //뒤로가기
         window.history.back();
      }
   });
</script>
<body>

   <!-- header.jsp -->
   <%@ include file="form/header.jsp"%>

   <section style="display:none;">
      <h1>Q N A 상 세 보 기</h1>


      <table border="1" class="table_notice_type02">
         <tr>
            <th>글 번 호</th>
            <td><input type="hidden" name="qna_no" value="${dto.qna_no }">
               <c:out value="${dto.qna_no}" /></td>
         </tr>
         <tr>
            <th>작 성 자</th>
            <td><input type="hidden" name="qna_id" value="${dto.qna_id }">
               <c:out value="${dto.qna_id}" /></td>
         </tr>
         <tr>
            <th>작 성 일</th>
            <td><input type="hidden" name="qna_regdate"
               value="${dto.qna_regdate }"> <c:out
                  value="${dto.qna_regdate}" /></td>
         </tr>
         <tr>
            <th>제 목</th>
            <td><input type="hidden" name="qna_title"
               value="${dto.qna_title }"> <c:out value="${dto.qna_title}" /></td>
         </tr>
         <tr id="content_style">
            <th>내 용</th>
            <td class="even">
               <input type="hidden" name="qna_content" value="${dto.qna_content }"> 
               <input type="hidden" id = "qna_pwd" name="qna_pwd" value="${dto.qna_pwd }">
               <c:out value="${dto.qna_content}" />
            </td>
         </tr>

      </table>
      

      <div class="btn_wrap">
          <button class="notice_button" onclick="location.href='qnaupdateform.do?qna_no=<c:out value="${dto.qna_no}"/>'">Update</button>
      </div>
      <div class="btn_wrap">
           <button class="notice_button" onclick="location.href='qnadelete.do?qna_no=<c:out value="${dto.qna_no}"/>'">Delete</button>
      </div>
      <div class="btn_wrap">
           <button class="notice_button" onclick="location.href='qnalist.do'">List</button>
      </div>
   
    
    <!--                     추가                         -->
    <!--  댓글  -->
    <div class="container">
        <label for="content"></label>
        <form name="commentInsertForm">
            <div class="input-group">
               <input type="hidden" name="qna_no" value="${dto.qna_no}"/>
               <input type="hidden" name="comm_regdate" value="comm_regdate"/>
               
               
               <!-- <input type="text" class="form-control" id="comm_content" name="comm_content" placeholder="내용을 입력하세요."> -->
               
               <div class="form__group field form-control">
                 <input type="text" class="form__field" placeholder="___________________________" name="comm_content" id='comm_content' required />
                   <label for="name" class="form__label">R e p l y</label>
            </div>

               <div class="input-group-btn">
                    <button class="btn btn-default notice_button" type="button" name="commentInsertBtn">댓 글 등 록</button>
               </div>
              </div>
        </form>
    </div>
    
    <div class="container" id="notice_form">
        <div class="commentList"></div>
    </div>

 
<!--            추가                         -->
<%@ include file="qnaComment.jsp" %>


   
   </section>



   <!-- footer.jsp -->
   <%@ include file="form/footer.jsp"%>

</body>

</html>