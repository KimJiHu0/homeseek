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

#qnaSearch_bar, h1 {
	width: 70%;
	margin-left: 15%;
	margin-right: 15%;
}

#nav.paging {
	display: flex;
	justify-content: center;
	align-items: center;
}

#nav.paging>a {
	color: var(- -color-light-grey);
	margin: 8px;
}

#nav.paging>a.active {
	color: green;
	margin: 8px;
}
/* 
.header ul.nav2{
	width:940px;
}
.header ul.nav{
	width:800px;
}

 */
dialog {
	border: 2px solid black;
	background: red;
	color: #fff;
}

dialog span {
	display: block;
	cursor: pointer;
}

table.table_qna {
	/* width:70%; */
	margin-left: 15%;
	margin-right: 15%;
	/* display:flex; */
	justify-content: center;
	align-items: center;
	border-collapse: collapse;
	text-align: left;
	line-height: 1.5;
	border-top: 1px solid #7EAB7D;
	border-bottom: 3px solid #7EAB7D;
	border-left: 3px solid #7EAB7D;
	border-right: 3px solid #7EAB7D;
	margin: 20px 10px;
}

table.table_qna th {
	width: 150px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
}

table.table_qna td {
	width: 350px;
	padding: 10px;
	vertical-align: top;
}

table.table_qna .even {
	background: #7EAB7D;
}

/*=======Button============= */
td>input.btn_1 {
	border: 1px solid transparent;
	-webkit-transition: all 0.4s cubic-bezier(.5, .24, 0, 1);
	transition: all 0.4s cubic-bezier(.5, .24, 0, 1);
}

td>input.btn_1::before {
	content: '';
	position: absolute;
	left: 0px;
	bottom: 0px;
	z-index: -1;
	width: 0%;
	height: 1px;
	background: #6098FF;
	box-shadow: inset 0px 0px 0px #6098FF;
	display: block;
	-webkit-transition: all 0.4s cubic-bezier(.5, .24, 0, 1);
	transition: all 0.4s cubic-bezier(.5, .24, 0, 1)
}

td>input.btn_1:hover::before {
	width: 100%;
}

td>input.btn_1::after {
	content: '';
	position: absolute;
	right: 0px;
	top: 0px;
	z-index: -1;
	width: 0%;
	height: 1px;
	background: #6098FF;
	-webkit-transition: all 0.4s cubic-bezier(.5, .24, 0, 1);
	transition: all 0.4s cubic-bezier(.5, .24, 0, 1)
}

td>input.btn_1:hover::after {
	width: 100%;
}

td>input.btn_1:hover {
	border-left: 1px solid #6098FF;
	border-right: 1px solid #6098FF;
}
</style>
<body>
	<!-- header.jsp -->
	<section>
		<div id="products">

			<form action="" id="setRows">
				<input type="hidden" name="rowPerPage" value="10">
			</form>

			<h1>Q N A 리 스 트</h1>

			<div id="qnaSearch_bar">
				<a> 검 색 : <input id="qnaSearch" type="search" value=""
					placeholder="QNA검색해주세여" /></a>
			</div>

			<table border="1" class="table_qna">
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
									<td>${dto.qna_no}</td>
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
						<td colspan="5" align="right"><input type="button"
							value="로그인 후 글작성하기" class="login2 btn_1" /></td>
					</c:if>
					<c:if test="${ not empty login }">
						<td colspan="5" align="right"><input type="button"
							value="글작성" class="btn_1"
							onclick="location.href='qnainsertform.do'" /></td>
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
<script type="text/javascript">
	$(".login2").click(function() {
		$(".modal-back").show();
		$(".modal").css("z-index", "20");
		$(".modal").css("top", "100px");
		$(".modal").css("opacity", "1");
	});
	$(".modal-back").click(function() {
		$(this).hide();
		$(".modal").css("top", "50px");
		$(".modal").css("opacity", "0");
		$(".modal").css("z-index", "-1");
	});
</script>
</html>