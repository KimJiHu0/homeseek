<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Q n A</title>
<%@ include file="form/header.jsp"%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/qnaList.css"
	type="text/css" />
<script src="${pageContext.request.contextPath}/resources/js/qnaList.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/js/paging.js"
	type="text/javascript"></script>

</head>
<style>
.off-screen {
	display: none;
}

.eval-contents {
	cursor: pointer;
}
.header ul.nav2{
	width:940px;
}
.header ul.nav{
	width:800px;
}
dialog {
	border: 2px solid black;
	background: red;
	color: #fff;
}

dialog span {
	display: block;
	cursor: pointer;
}
</style>
<body>
	<!-- header.jsp -->
	<section>
		<div id="products">

			<h1>Q N A 리 스 트</h1>
			
			<div>
				<a> 검 색  :</a>
				<input id="qnaSearch" type="search" value="" placeholder="QNA검색해주세여" />
			</div>

<!-- 			<div class="panel-heading">
				<button id='regBtn' type="button" class="btn btn-xs pull-right">Register
					New QNA</button>
			</div>
 -->
			<form action="" id="setRows">
				<input type="hidden" name="rowPerPage" value="5">
			</form>

			<table border="1">
				<thead>
					<tr>
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
									<td>${dto.qna_no}</td>
									<td>${dto.qna_id }</td>
									<td>${dto.qna_title }</td>
									<td><fmt:formatDate pattern="yyyy-MM-dd"
											value="${dto.qna_regdate}" /></td>
									<td>${dto.qna_secretflag}</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
				<tr>
					<td colspan="5" align="right"><input type="button" value="글작성"
						onclick="location.href='qnainsertform.do'" /></td>
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
					html += `<tr class='eval-contents' onclick="location.href='qnadetail.do?qna_no=` + list.qna_no + `'">`;
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
<!-- 	<script type="text/javascript">
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
</html>