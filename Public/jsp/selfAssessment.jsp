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

<jsp:include page="../common/style.jsp" />

<%=lessonId%>
<form action="ReceiveSelfAssessmentServlet" method="POST">
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
				<input type="radio" name="per1" value=1>
				</td>
				<td>すこしできている
				<input type="radio" name="per1" value=2>
				</td>
				<td>ふつう
				<input type="radio" name="per1" value=3>
				</td>
				<td>よくできている
				<input type="radio" name="per1" value=4>
				</td>
				<td>非常によくできている
				<input type="radio" name="per1" value=5>
				</td>
			</tr>
			<tr>
				<td>～～について</td>
				<td>できていない
				<input type="radio" name="per2" value=1>
				</td>
				<td>すこしできている
				<input type="radio" name="per2" value=2>
				</td>
				<td>ふつう
				<input type="radio" name="per2" value=3>
				</td>
				<td>よくできている
				<input type="radio" name="per2" value=4>
				</td>
				<td>非常によくできている
				<input type="radio" name="per2" value=5>
				</td>
			</tr>
			<tr>
				<td>～～について</td>
				<td>できていない
				<input type="radio" name="per3" value=1>
				</td>
				<td>すこしできている
				<input type="radio" name="per3" value=2>
				</td>
				<td>ふつう
				<input type="radio" name="per3" value=3>
				</td>
				<td>よくできている
				<input type="radio" name="per3" value=4>
				</td>
				<td>非常によくできている
				<input type="radio" name="per3" value=5>
				</td>
			</tr>
			<tr>
				<td>～～について</td>
				<td>できていない
				<input type="radio" name="per4" value=1>
				</td>
				<td>すこしできている
				<input type="radio" name="per4" value=2>
				</td>
				<td>ふつう
				<input type="radio" name="per4" value=3>
				</td>
				<td>よくできている
				<input type="radio" name="per4" value=4>
				</td>
				<td>非常によくできている
				<input type="radio" name="per4" value=5>
				</td>
			</tr>
		</tbody>
	</table>
	<input type="submit" value="登録する">
</form>



</body>
</html>