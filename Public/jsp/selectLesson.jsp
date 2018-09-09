<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="beans.Lesson"%>
<%@ page import="java.util.ArrayList"%>

<%
	@SuppressWarnings("unchecked")
	ArrayList<Lesson> lessonList = (ArrayList<Lesson>) request.getAttribute("lessonList");
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../common/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<title>授業選択画面</title>
</head>

<jsp:include page="../common/jsp/userLayout.jsp" />

<div class="container">
	<div class="row" style="padding: 90px 0 0 0">
		<form action="GoSelfAssessmentServlet" method="POST">
			<div class="col-xs-12 col-sm-12 col-md-12">
				<div class="alert alert-info" role="alert">
					<h4>今日の授業の「入力」ボタンをおしてください</h4>
				</div>
				<table class="table">
					<thead>
						<tr>
							<th>タイトル</th>
							<th>日付け</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<%
								for (int i = 1; i <= lessonList.size(); i++) {
							%>
						<tr>
							<td><%=lessonList.get(i - 1).getTitle()%></td>
							<td><%=lessonList.get(i - 1).getDate()%></td>
							<td>
								<button type="submit" name="lessonId" class="btn btn-info"
									value=<%=lessonList.get(i - 1).getId()%>>入力</button>
							</td>
						</tr>
						<%
								}
							%>
					</tbody>
				</table>
				<div style="text-align: right">
					<a href="GoHomeServlet" class="btn btn-default">ホーム画面にもどる</a>
					<br> <br>
				</div>
			</div>
		</form>
	</div>
</div>