<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	@SuppressWarnings("unchecked")
	int lessonId = (int) session.getAttribute("lessonId");
%>


<html>
<body>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="../common/bootstrap.jsp" />
<title>ルーブリック選択画面</title>
</head>
				<%=lessonId%>
				<form action="ReceiveSelfAssessmentServlet" method="POST">
					<table class="table">
						<thead>
							<tr>
								<th>小項目</th>
								<th>A</th>
								<th>B</th>
								<th>C</th>
								<th>D</th>
								<th>E</th>
							</tr>
						</thead>
						<tbody>
							<tr>
							<td>～～について</td>
							<td>できていない</td>
							<td>すこしできている</td>
							<td>ふつう</td>
							<td>よくできている</td>
							<td>非常によくできている</td>
							<td><input type="radio" name="per1" value=1></td>
							<td><input type="radio" name="per1" value=2></td>
							<td><input type="radio" name="per1" value=3></td>
							<td><input type="radio" name="per1" value=4></td>
							<td><input type="radio" name="per1" value=5></td>

							</tr>
						</tbody>
					</table>
				</form>



</body>
</html>