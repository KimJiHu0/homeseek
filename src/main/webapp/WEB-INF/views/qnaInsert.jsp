<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QNA 등록</title>
<script type="text/javascript"
   src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/qnaInsert.css"
   type="text/css" />
<script
   src="${pageContext.request.contextPath}/resources/js/qnaInsert.js"
   type="text/javascript"></script>
</head>
<body>
   <!-- header.jsp -->
   <%@ include file="form/header.jsp"%>
   <section>

      <h1>Q n A 등 록</h1>

   <form  action="qnainsert.do" method="post">
   
      <table border="1" class="table_notice_type02">
         
            <tr>
               <th>제목</th>
               <td><input class="form-control" name='qna_title' style="width:100%; border: 0;"></td>
            </tr>
            <tr id="content_style">
               <th>내용</th>
               <td><textarea class="form-control" name='qna_content' rows="30" style="width:800px; border: 0;" ></textarea></td>
            </tr>
            <tr>
               <th>글 비밀번호</th>
               <td><input type="password" class="form-control"  name='qna_pwd'  style="width:100%; border: 0;"></td>
            </tr>
            <tr>
            <th>비밀글 여부</th>
            <td>
               <label><input type="radio" name="qna_secretflag" value="Y"> YES</label>
                  <label><input type="radio" name="qna_secretflag" value="N" checked> NO</label>
               <input type="hidden" name="qna_secretflag" value="${dto.qna_secretflag }"> 
               </td>
         </tr>
            
         </table>
         
      <div class="btn_wrap">
      <button type="submit" class="notice_button btn btn-default login2">등록</button>
      </div>
      
      <div class="btn_wrap">
      <button type="reset" class="notice_button btn btn-default">초기화</button>
      </div>
      
      <div class="btn_wrap">
      <button type="button" onclick="location.href='qnalist.do'" class="notice_button btn btn-default">취소</button>
      </div>
      
   </form>
   
   </section>
   
   <!-- footer.jsp -->
   <%@ include file="form/footer.jsp"%>

</body>

</html>