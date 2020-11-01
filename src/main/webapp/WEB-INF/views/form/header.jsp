<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mvc.homeseek.model.dto.MemberDto" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOMESEEK</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">
<script
	src="${pageContext.request.contextPath}/resources/js/header.js"
	type="text/javascript"></script>
</head>
<body>
<%
	MemberDto dto = (MemberDto)request.getSession().getAttribute("login"); 
%>
   <header> 
   <c:choose>
      	<c:when test="${pageContext.request.requestURI eq '/homeseek/'}">
			<div class="mainheader">
      	</c:when> 
      	<c:when test="${main eq 'main'}">
      		<div class="mainheader">
      	</c:when >
      	<c:otherwise>
	      	<div class="header">
      	</c:otherwise>
   </c:choose>
         <div class="logo">
            <a class="headeratag" href="main.do">HOME<span>SEE</span>K</a>
         </div> 

<% if(dto == null) { %>         
         <ul class="nav">
<% }else{ %>
 		 <ul class="nav2">
<% } %> 		 	  
         <c:choose>
         	<c:when test="${pageContext.request.requestURI eq '/homeseek/'}">
				
         	</c:when> 
         	<c:when test="${main eq 'main'}">
      			
         	</c:when >
         	<c:otherwise>
	         	<li class="searchbox">
	         		<div class="search">
	         			<form action="listroom.do" class="navsearchform">
	         				<input type="text" id="navsearchtxt" name="word" value="${word }" placeholder="지역,지하철명,대학교">
	         			</form>
	         		</div>
	         	</li>
         	</c:otherwise>
         </c:choose>   


         	<!-- 엘라스틱서치로 변경시 search.do 로 변경 -->
            <li><a class="headeratag" href="listroom.do">전체 방 조회</a></li>
            <li><a class="headeratag" href="insertroom.do">방 올리기</a></li> 
            
            <li><div class="dropdown">
                 <button class="dropbtn">게시판</button>
                    <div class="dropdown-content">
                      <a class="headeratag" href="#">공지사항</a>
                      <a class="headeratag" href="#">Q & A</a>
                    </div>
            </div></li>
                        
            <li><a class="headeratag" href="#">채팅</a></li> 
            <li><a class="headeratag" href="donateform.do">후원하기</a></li> 
            <li><a class="headeratag" href="#">Kr | En</a></li>
            <% if(dto == null) { %> 
            <li>
            	<span class="login">
                <a class="headeratag" href="loginform.do">LOGIN | REGIST</a>
            	</span>
            </li>
           
           	<% } else if(dto.getMember_role() == 'A') { %>
               
            <li><div class="dropdown">
                 <button class="dropbtn"><strong><%= dto.getMember_name()%>님 환영합니다</strong></button>
                    <div class="dropdown-content">
                      <a class="headeratag" href="#">전체 회원 관리</a>
                      <a class="headeratag" href="#">전체 후원 내역</a>
                    </div>
            </div></li>
            <li>
            	<span class="logout">
                <a class="headeratag" href="logout.do"><strong>| LOGOUT</strong></a>
            	</span>
            </li>
            <% } else if(dto.getMember_role() == 'N'){ %>
              <li><div class="dropdown">
                 <button class="dropbtn"><strong><%= dto.getMember_name()%>님 환영합니다</strong></button>
                    <div class="dropdown-content">
                      <a class="headeratag" href="#">내 정보 보기</a>
                      <a class="headeratag" href="#">나의 후원 내역</a>
                    </div>
            </div></li>
            <li>
            	<span class="logout">
                <a class="headeratag" href="logout.do"><strong>| LOGOUT</strong></a>
            	</span>
            </li>
             <% } %>
 
         </ul>
      </div>
   </header>
</body>
</html>