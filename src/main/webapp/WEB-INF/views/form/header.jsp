<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="com.mvc.homeseek.model.dto.MemberDto"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   MemberDto dto = (MemberDto) request.getSession().getAttribute("login");
%>
<%
   response.setHeader("Pragma", "no-cache");
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setDateHeader("Expires", 0L);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOMESEEK</title>
<script type="text/javascript"
   src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/header.css">
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/section.css">

<script type="text/javascript"
   src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<script src="resources/js/login.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/js/header.js"
   type="text/javascript"></script>

</head>
<style>
@charset "UTF-8";

.modal_wrap {
   display: none;
   width: 500px;
   height: 500px;
   position: absolute;
   top: 50%;
   left: 50%;
   margin: -250px 0 0 -250px;
   background: #eee;
   z-index: 2;
}

.black_bg {
   display: none;
   position: absolute;
   content: "";
   width: 100%;
   height: 100%;
   background-color: rgba(0, 0, 0, 0.5);
   top: 0;
   left: 0;
   z-index: 1;
}

.modal_close {
   width: 26px;
   height: 26px;
   position: absolute;
   top: -30px;
   right: 0;
}

.modal_close>a {
   display: block;
   width: 100%;
   height: 100%;
   background: url(https://img.icons8.com/metro/26/000000/close-window.png);
   text-indent: -9999px;
}

a {
   text-decoration: none;
}

.snslogin {
   position: absolute;
   left: 23px;
   top: 350px;
}

.loginlogo {
   font-size: 50px;
   position: absolute;
   width: 326px;
   height: 75px;
   left: 105px;
   top: 75px;
}

.loginlogo>a {
   color: black;
   font-style: italic;
}

.loginlogo>a>span {
   color: green;
   font-style: italic;
}

.memberid1 {
   position: absolute;
   width: 300px;
   height: 54px;
   left: 55px;
   top: 199px;
   background: #C4C4C4;
}

.memberpw1 {
   position: absolute;
   width: 300px;
   height: 54px;
   left: 55px;
   top: 264px;
   background: #C4C4C4;
}

#loginbtn {
   position: absolute;
   width: 80px;
   height: 125px;
   left: 370px;
   top: 199px;
   background: #C4C4C4;
}

.idpwlink {
   position: absolute;
   top: 410px;
   left: 110px;
}

.idpwlink li {
   display: inline-block;
   margin-right: 5px;
}

/* 로그인모달 */
.modal_login {
   width: 500px;
   height: 500px;
   position: fixed;
   top: 50px;
   left: calc(50% - 250px);
   opacity: 0;
   z-index: -1;
   border-radius: 30px;
   transition: 0.6s;
   background: rgb(255,255,177);
   background: radial-gradient(circle, rgba(255,255,177,1) 0%, rgba(255,255,235,0.8690826672465861) 100%);
}

.modal-back {
   width: 100%;
   height: 100%;
   position: fixed;
   top: 0px;
   display: none;
   z-index: 20;
   background-color: black;
   opacity: 0.8;
}
</style>
<body>

   <header>
      <c:choose>
         <c:when test="${pageContext.request.requestURI eq '/'}">
            <div class="mainheader">
         </c:when>
         <c:when test="${pageContext.request.requestURI eq '/homeseek/'}">
            <div class="mainheader">
         </c:when>
         <c:when test="${main eq 'main'}">
            <div class="mainheader">
         </c:when>
         <c:otherwise>
            <div class="header">
         </c:otherwise>
      </c:choose>
      <div class="logo">
         <a class="headeratag" href="main.do">HOME<span>SEE</span>K
         </a>
      </div>

      <%
         if (dto == null) {
      %>
      <ul class="nav">
         <%
            } else {
         %>
         <ul class="nav2">
            <%
               }
            %>
            <c:choose>
               <c:when test="${pageContext.request.requestURI eq '/'}">

               </c:when>
               <c:when test="${pageContext.request.requestURI eq '/homeseek/'}">

               </c:when>
               <c:when test="${main eq 'main'}">

               </c:when>
               <c:otherwise>
                  <li class="searchbox">
                     <div class="search">
                        <!--  엘라스틱 시현시 search.do 로 변경 -->
                        <form action="search.do" class="navsearchform">
                           <input type="text" id="navsearchtxt" name="word"
                              value="${word }" placeholder="<spring:message code='h.searchplaceholder' text='지역,지하철명,아이디'/>">
                        </form>
                     </div>
                  </li>
               </c:otherwise>
            </c:choose>


            <!-- 엘라스틱서치로 변경시 search.do 로 변경 -->
            <li><a class="headeratag" href="search.do"><spring:message
                     code="h.list" text="전체 방 보기" /></a></li>
            <%
               if (dto == null) {
            %>
            <li><a class="headeratag login2" onclick="getSnsUrl();"><spring:message
                     code="h.insert" text="방 올리기" /></a></li>
            <%
               } else {
            %>
            <li><a class="headeratag" href="insertroom.do"><spring:message
                     code="h.insert" text="방 올리기" /></a></li>
            <%
               }
            %>
            <li><div class="dropdown">
                  <button class="dropbtn">
                     <spring:message code="h.board" text="게시판" />
                  </button>
                  <div class="dropdown-content">
                     <a class="headeratag" href="noticelist.do"><spring:message
                           code="h.notice" text="공지사항" /></a> <a class="headeratag"
                        href="qnalist.do">Q & A</a>
                  </div>
               </div></li>

            <%
               if (dto == null) {
            %>
            <li><a class="headeratag login2" onclick="getSnsUrl();"><spring:message
                     code="h.chat" text="채팅" /></a></li>
            <%
               } else {
            %>
            <li><a class="headeratag" href="javascript:chat();"><spring:message
                     code="h.chat" text="채팅" /></a></li>
            <%
               }
            %>
            <%
               if (dto == null) {
            %>
            <li><a class="headeratag login2" onclick="getSnsUrl();"><spring:message
                     code="h.donate" text="후원하기" /></a></li>
            <%
               } else {
            %>
            <li><a class="headeratag" href="donateform.do"><spring:message
                     code="h.donate" text="후원하기" /></a></li>         
            <%
               }
            %>
            <li><a class="headeratag" href="?lang=en">ENG</a></li>
            <li><a class="headeratag" href="?lang=ko">KOR</a></li>
            <!-- <li><p class="headeratag" id="translate">Kr | En</p></li> -->
            <%
               if (dto == null) {
            %>


            <li><span class="login2"> <a onclick="getSnsUrl();"
                  class="headeratag">LOGIN | REGIST</a>
            </span></li>

            <%
               } else if (dto.getMember_role() == 'A') {
            %>

            <li><div class="dropdown">
                  <button class="dropbtn">
                     <strong><%=dto.getMember_name()%><spring:message
                           code="h.welcome" text="님 환영합니다" /></strong>
                  </button>
                  <div class="dropdown-content">
                     <a class="headeratag" href="admin.do"><spring:message
                           code="h.admin" text="전체 회원 관리" /></a> <a class="headeratag"
                        href="admindona.do"><spring:message code="h.admindona"
                           text="전체 후원 내원" /></a>
                  </div>
               </div></li>
            <li><span class="logout"> <a class="headeratag"
                  href="logout.do"><strong>| LOGOUT</strong></a>
            </span></li>
            <%
               } else if (dto.getMember_role() == 'N') {
            %>
            <li><div class="dropdown">
                  <button class="dropbtn">
                     <strong><%=dto.getMember_name()%><spring:message
                           code="h.welcome" text="님 환영합니다" /></strong>
                  </button>
                  <div class="dropdown-content">
                     <a class="headeratag" href="javascript:myPage();"><spring:message
                           code="h.mypage" text="내 정보 보기" /></a> <a class="headeratag"
                        href="javascript:myDona();"><spring:message code="h.mydona"
                           text="나의 후원 내역" /></a> <a class="headeratag"
                        href="javascript:myMsg();"><spring:message code="h.mymsg"
                           text="쪽지함" /></a>
                  </div>
               </div></li>
            <li><span class="logout"> <a class="headeratag"
                  href="logout.do"><strong>| LOGOUT</strong></a>
            </span></li>
            <%
               }
            %>

         </ul>

         </div>
         <div class="modal-back" onclick="closeModal();"></div>
         <div class="modal_login"></div>
   </header>
</body>
<script>
   let naver_url;
   let google_url;
   let kakao_url;
   function getSnsUrl() {
      $.ajax({
         type : "post",
         url : "snsinfo.do",
         contentType : "application/json",
         dataType : "json",
         success : function(msg) {
            //console.log(msg.naver_url);
            naver_url = msg.naver_url;
            google_url = msg.google_url;
            kakao_url = msg.kakao_url;

            clickLogin();
         }
      });
   }
   function clickLogin() {

      //console.log(naver_url);
      //console.log(google_url);
      //console.log(kakao_url);

      let modal_login = document.getElementsByClassName("modal_login")[0];
      modal_login.innerHTML = "";

      let modal_close = document.createElement("div");
      modal_close.setAttribute("class", "modal_close");
      let a_close = document.createElement("a");
      //모달클로즈
      a_close.setAttribute("href","main.do");
      a_close.setAttribute("onclick","closeModal();");
      a_close.textContent = "close";
      modal_close.appendChild(a_close);
      modal_login.appendChild(modal_close);

      let modal = document.createElement("div");

      let loginlogo = document.createElement("div");
      loginlogo.setAttribute("class", "loginlogo");
      let a_home = document.createElement("a");
      a_home.setAttribute("href", "#");
      a_home.innerHTML = "HOME<span>SEE</span>K";
      loginlogo.appendChild(a_home);
      modal.appendChild(loginlogo);

      let table = document.createElement("table");
      let tr1 = document.createElement("tr");
      let td1 = document.createElement("td");
      let input_id = document.createElement("input");
      input_id.setAttribute("type", "text");
      input_id.setAttribute("placeholder", "I D");
      input_id.setAttribute("id", "member_id_modal");
      input_id.setAttribute("class", "memberid1");
      td1.appendChild(input_id);
      tr1.appendChild(td1);
      let tr2 = document.createElement("tr");
      let td2 = document.createElement("td");
      let input_pw = document.createElement("input");
      input_pw.setAttribute("type", "password");
      input_pw.setAttribute("placeholder", "P W");
      input_pw.setAttribute("id", "member_pw_modal");
      input_pw.setAttribute("class", "memberpw1");
      td2.appendChild(input_pw);
      tr2.appendChild(td2);
      let tr3 = document.createElement("tr");
      let td3 = document.createElement("td");
      td3.setAttribute("colspan", "2");
      let input_loginbtn = document.createElement("input");
      input_loginbtn.setAttribute("type", "button");
      input_loginbtn.setAttribute("value", "login");
      input_loginbtn.setAttribute("id", "loginbtn");
      input_loginbtn.setAttribute("onclick", "loginPrc();");
      td3.appendChild(input_loginbtn);
      tr3.appendChild(td3);

      let tr4 = document.createElement("tr");
      let td4 = document.createElement("td");
      td4.setAttribute("colspan", "2");
      td4.setAttribute("align", "center");
      td4.setAttribute("id", "loginchk");
      tr4.appendChild(td4);

      table.appendChild(tr1);
      table.appendChild(tr2);
      table.appendChild(tr3);
      table.appendChild(tr4);
      modal.appendChild(table);

      let snslogin = document.createElement("div");
      snslogin.setAttribute("class", "snslogin");

      let a1 = document.createElement("a");
      a1.setAttribute("id", "naver_url");
      a1.setAttribute("href", naver_url);
      let img1 = document.createElement("img");
      img1.setAttribute("width", "150");
      img1.setAttribute("height", "37");
      img1
            .setAttribute("src",
                  "${pageContext.request.contextPath}/resources/img/naver-login.png");
      img1.setAttribute("alt", "Naver Login");
      a1.appendChild(img1);

      let a2 = document.createElement("a");
      a2.setAttribute("id", "google_url");
      a2.setAttribute("href", google_url);
      let img2 = document.createElement("img");
      img2.setAttribute("width", "150");
      img2.setAttribute("height", "38");
      img2
            .setAttribute("src",
                  "${pageContext.request.contextPath}/resources/img/google-login.jpg");
      img2.setAttribute("alt", "Google Login");
      a2.appendChild(img2);

      let a3 = document.createElement("a");
      a3.setAttribute("id", "kakao_url");
      a3.setAttribute("href", kakao_url);
      let img3 = document.createElement("img");
      img3.setAttribute("width", "150");
      img3.setAttribute("height", "38");
      img3
            .setAttribute(
                  "src",
                  "${pageContext.request.contextPath}/resources/img/kakao_login_medium_narrow.png");
      img3.setAttribute("alt", "Kakao Login");
      a3.appendChild(img3);

      snslogin.appendChild(a1);
      snslogin.appendChild(a2);
      snslogin.appendChild(a3);
      modal.appendChild(snslogin);

      let idpwlink = document.createElement("ul");
      idpwlink.setAttribute("class", "idpwlink");

      let li1 = document.createElement("li");
      let lia1 = document.createElement("a");
      lia1.setAttribute("href", "findidform.do");
      lia1.textContent = "아이디 찾기";
      li1.appendChild(lia1);
      idpwlink.appendChild(li1);
      let li2 = document.createElement("li");
      let lia2 = document.createElement("a");
      lia2.textContent = "|";
      li2.appendChild(lia2);
      idpwlink.appendChild(li2);
      let li3 = document.createElement("li");
      let lia3 = document.createElement("a");
      lia3.setAttribute("href", "findpwdform.do");
      lia3.textContent = "비밀번호 찾기";
      li3.appendChild(lia3);
      idpwlink.appendChild(li3);
      let li4 = document.createElement("li");
      let lia4 = document.createElement("a");
      lia4.textContent = "|";
      li4.appendChild(lia4);
      idpwlink.appendChild(li4);
      let li5 = document.createElement("li");
      let lia5 = document.createElement("a");
      lia5.setAttribute("href", "registform.do");
      lia5.textContent = "회원가입";
      li5.appendChild(lia5);
      idpwlink.appendChild(li5);
      modal.appendChild(idpwlink);
      modal_login.appendChild(modal);

   }
   function closeModal(){
       let modal_login = document.getElementsByClassName("modal_login")[0];
       modal_login.innerHTML = "";
   }
</script>

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

   /*    
    function translate(){
    var userLang = navigator.language || navigator.userLanguage;
    if(userLang==ko){
    FacesContext.getCurrentInstance().getViewRoot().setLocale(new Locale("en"));
    }else{
    FacesContext.getCurrentInstance().getViewRoot().setLocale(new Locale("ko"));
    }
    } */
</script>
</html>