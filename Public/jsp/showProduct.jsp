<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="beans.ResponseData"%>
<%@ page import="beans.Lesson"%>
<%@ page import="beans.Product"%>
<%@ page import="beans.User"%>

<%
	Lesson lesson = (Lesson) session.getAttribute("lesson");
	int selfAssessmentCheck = (int) request.getAttribute("selfAssessmentCheck");
	ResponseData responseData = (ResponseData) request.getAttribute("responseData");
	@SuppressWarnings("unchecked")
	ArrayList<Product> productList = (ArrayList<Product>) session.getAttribute("productList");
	User user = (User) session.getAttribute("user");
	String userId = user.getUserId();

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="../common/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<title>成果物確認画面</title>
</head>
<jsp:include page="../common/jsp/userLayout.jsp" />

<div class="container">
	<div class="row" style="padding: 70px 0 0 0">
		<div class="col-xs-12 col-sm-12 col-md-12">
			<!-- 前のページでどの授業を選んだか表示 -->
			<font size="+1">選択した授業</font>
			<table class="table table-striped table-bordered">
				<tr class="success">
					<td class="td-name">授業名</td>
					<td class="td-price">日付</td>
				</tr>
				<tr>
					<td><%=lesson.getTitle()%></td>
					<td><%=lesson.getDate()%></td>
				</tr>
			</table>
			<div class="row" style="padding: 100px 0 0 0">
				<div class="col-xs-12 col-sm-12 col-md-12">
					<div class="image-box graph" align="center">
						<canvas id="canvassample" width="600" height="500"> </canvas>
					</div>
				</div>
			</div>
		</div>
		<!-- 以降は、蓄積した学習成果物を表示する部分 -->
		<div class="col-xs-4 col-sm-4 col-md-4">
			<font size="+1">蓄積した成果物</font>
			<table class="table table-hover">
				<thead class="thead-light">
					<tr>
						<th>タイトル</th>
						<th>日時</th>
						<th>振り返りの記録</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<!-- listの長さだけテーブルを作成する -->

					<%
						if (productList.size() != 0) {
						for (int i = 0; i < productList.size(); i++) {
					%>
					<tr>
						<td style="word-break: break-all;">
							<%=productList.get(i).getTitle()%>
						</td>
						<td>
							<%=productList.get(i).getDate()%>
						</td>
						<td>
							<%=productList.get(i).getComment()%>
						</td>
						<td>
							<a href="/ias_product/<%=userId + '/' + lesson.getId() + '/' + productList.get(i).getProductName()%>" target="_blank">確認する</a>
						</td>
					</tr>
					<% }} %>
					<% if (productList.size() == 0) { %>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<% } %>
				</tbody>
			</table>
		</div>
		<div class="container">
			<div class="row" style="padding: 70px 0 0 0">
				<div class="col-xs-8 col-sm-8 col-md-8">
					<font size="+1">自己評価</font>
					<table class="table">
						<thead>
							<tr>
								<th>小項目</th>
								<th>1</th>
								<th>2</th>
								<th>3</th>
								<th>4</th>
								<th>5</th>
							</tr>
						</thead>

						<tbody>
							<tr>
								<td>～～について</td>
								<td>できていない
								<% if (responseData.getPer1() == 1) { out.println("〇"); } %>
								</td>
								<td>すこしできている
								<% if (responseData.getPer1() == 2) { out.println("〇"); } %>
								</td>
								<td>ふつう
								<% if (responseData.getPer1() == 3) { out.println("〇"); } %>
								</td>
								<td>よくできている
								<% if (responseData.getPer1() == 4) { out.println("〇"); } %>
								</td>
								<td>非常によくできている
								<% if (responseData.getPer1() == 5) { out.println("〇"); } %>
								</td>
							</tr>
							<tr>
								<td>～～について</td>
								<td>できていない
								<% if (responseData.getPer2() == 1) { out.println("〇"); } %>
								</td>
								<td>すこしできている
								<% if (responseData.getPer2() == 2) { out.println("〇"); } %>
								</td>
								<td>ふつう
								<% if (responseData.getPer2() == 3) { out.println("〇"); } %>
								</td>
								<td>よくできている
								<% if (responseData.getPer2() == 4) { out.println("〇"); } %>
								</td>
								<td>非常によくできている
								<% if (responseData.getPer2() == 5) { out.println("〇"); } %>
								</td>
							</tr>
							<tr>
								<td>～～について</td>
								<td>できていない
								<% if (responseData.getPer3() == 1) { out.println("〇"); } %>
								</td>
								<td>すこしできている
								<% if (responseData.getPer3() == 2) { out.println("〇"); } %>
								</td>
								<td>ふつう
								<% if (responseData.getPer3() == 3) { out.println("〇"); } %>
								</td>
								<td>よくできている
								<% if (responseData.getPer3() == 4) { out.println("〇"); } %>
								</td>
								<td>非常によくできている
								<% if (responseData.getPer3() == 5) { out.println("〇"); } %>
								</td>
							</tr>
							<tr>
								<td>～～について</td>
								<td>できていない
								<% if (responseData.getPer4() == 1) { out.println("〇"); } %>
								</td>
								<td>すこしできている
								<% if (responseData.getPer4() == 2) { out.println("〇"); } %>
								</td>
								<td>ふつう
								<% if (responseData.getPer4() == 3) { out.println("〇"); } %>
								</td>
								<td>よくできている
								<% if (responseData.getPer4() == 4) { out.println("〇"); } %>
								</td>
								<td>非常によくできている
								<% if (responseData.getPer4() == 5) { out.println("〇"); } %>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div style="text-align: right">
			<a href="SelectLessonServlet" class="btn btn-default">授業を選択する画面にもどる</a>
		</div>
	</div>
</div>
</body>
</html>

<jsp:include page="../common/jsp/visualization.jsp" />
