<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="beans.Lesson"%>
<%@ page import="java.util.ArrayList"%>

<%
	@SuppressWarnings("unchecked")
	ArrayList<Lesson> lessonList = (ArrayList<Lesson>) request.getAttribute("lessonList");
%>

<!DOCTYPE html>
<html>
<head>
<link href="../common/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<title>授業選択画面</title>
</head>

<jsp:include page="../common/style.jsp" />

<div class="container">
	<div class="row" style="padding: 90px 0 0 0">
		<form action="SearchRubricStudentServlet" method="POST">
			<div class="col-xs-12 col-sm-12 col-md-12">
				<div style="margin-top: 0px; padding-bottom: 0px;">
					<div class="alert alert-info" role="alert">
						<h3>該当する授業の、入力ボタンを押してください</h3>
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
									out.println("<tr>");

									out.println("<td>");
									out.println(lessonList.get(i - 1).getTitle());
									out.println("</td>");

									out.println("<td>");
									out.println(lessonList.get(i - 1).getDate());
									out.println("</td>");

									out.println("<td>");
									out.println("<button type='submit' name='lessonId' value=" + lessonList.get(i - 1).getId()
											+ ">入力</button>");
									out.println("</td>");

									out.println("</tr>");
								}
							%>
						</tbody>
					</table>
				</div>
			</div>
		</form>
	</div>
</div>