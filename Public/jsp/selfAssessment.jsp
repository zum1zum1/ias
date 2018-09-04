<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="beans.ResponseData"%>

<%
	@SuppressWarnings("unchecked")
	int lessonId = (int) session.getAttribute("lessonId");
	int selfAssessmentCheck = (int) request.getAttribute("selfAssessmentCheck");
//	if(selfAssessmentCheck == 1){
		ResponseData responseData = (ResponseData) request.getAttribute("responseData");
//	}
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
<% if(selfAssessmentCheck == 0) {
out.println("<form action='ReceiveSelfAssessmentServlet' method='POST'>");
 } else {
out.println("<form action='UpdateSelfAssessmentServlet' method='POST'>");
 } %>
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

	<% if(selfAssessmentCheck == 0) { %>
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
	<% } else if(selfAssessmentCheck == 1) {%>
		<tbody>
			<tr>
				<td>～～について</td>
				<td>できていない
				<% if(responseData.getPer1() == 1) {%>
				<input type="radio" name="per1" value=1 checked>
				<% } else {%>
				<input type="radio" name="per1" value=1>
				<% } %>
				</td>
				<td>すこしできている
				<% if(responseData.getPer1() == 2) {%>
				<input type="radio" name="per1" value=2 checked>
				<% } else {%>
				<input type="radio" name="per1" value=2>
				<% } %>
				</td>
				<td>ふつう
				<% if(responseData.getPer1() == 3) {%>
				<input type="radio" name="per1" value=3 checked>
				<% } else {%>
				<input type="radio" name="per1" value=3>
				<% } %>
				</td>
				<td>よくできている
				<% if(responseData.getPer1() == 4) {%>
				<input type="radio" name="per1" value=4 checked>
				<% } else {%>
				<input type="radio" name="per1" value=4>
				<% } %>
				</td>
				<td>非常によくできている
				<% if(responseData.getPer1() == 5) {%>
				<input type="radio" name="per1" value=5 checked>
				<% } else {%>
				<input type="radio" name="per1" value=5>
				<% } %>
				</td>
			</tr>
			<tr>
				<td>～～について</td>
				<td>できていない
				<% if(responseData.getPer2() == 1) {%>
				<input type="radio" name="per2" value=1 checked>
				<% } else {%>
				<input type="radio" name="per2" value=1>
				<% } %>
				</td>
				<td>すこしできている
				<% if(responseData.getPer2() == 2) {%>
				<input type="radio" name="per2" value=2 checked>
				<% } else {%>
				<input type="radio" name="per2" value=2>
				<% } %>
				</td>
				<td>ふつう
				<% if(responseData.getPer2() == 3) {%>
				<input type="radio" name="per2" value=3 checked>
				<% } else {%>
				<input type="radio" name="per2" value=3>
				<% } %>
				</td>
				<td>よくできている
				<% if(responseData.getPer2() == 4) {%>
				<input type="radio" name="per2" value=4 checked>
				<% } else {%>
				<input type="radio" name="per2" value=4>
				<% } %>
				</td>
				<td>非常によくできている
				<% if(responseData.getPer2() == 5) {%>
				<input type="radio" name="per2" value=5 checked>
				<% } else {%>
				<input type="radio" name="per2" value=5>
				<% } %>
				</td>
			</tr>
			<tr>
				<td>～～について</td>
				<td>できていない
				<% if(responseData.getPer3() == 1) {%>
				<input type="radio" name="per3" value=1 checked>
				<% } else {%>
				<input type="radio" name="per3" value=1>
				<% } %>
				</td>
				<td>すこしできている
				<% if(responseData.getPer3() == 2) {%>
				<input type="radio" name="per3" value=2 checked>
				<% } else {%>
				<input type="radio" name="per3" value=2>
				<% } %>
				</td>
				<td>ふつう
				<% if(responseData.getPer3() == 3) {%>
				<input type="radio" name="per3" value=3 checked>
				<% } else {%>
				<input type="radio" name="per3" value=3>
				<% } %>
				</td>
				<td>よくできている
				<% if(responseData.getPer3() == 4) {%>
				<input type="radio" name="per3" value=4 checked>
				<% } else {%>
				<input type="radio" name="per3" value=4>
				<% } %>
				</td>
				<td>非常によくできている
				<% if(responseData.getPer3() == 5) {%>
				<input type="radio" name="per3" value=5 checked>
				<% } else {%>
				<input type="radio" name="per3" value=5>
				<% } %>
				</td>
			</tr>
			<tr>
				<td>～～について</td>
				<td>できていない
				<% if(responseData.getPer4() == 1) {%>
				<input type="radio" name="per4" value=1 checked>
				<% } else {%>
				<input type="radio" name="per4" value=1>
				<% } %>
				</td>
				<td>すこしできている
				<% if(responseData.getPer4() == 2) {%>
				<input type="radio" name="per4" value=2 checked>
				<% } else {%>
				<input type="radio" name="per4" value=2>
				<% } %>
				</td>
				<td>ふつう
				<% if(responseData.getPer4() == 3) {%>
				<input type="radio" name="per4" value=3 checked>
				<% } else {%>
				<input type="radio" name="per4" value=3>
				<% } %>
				</td>
				<td>よくできている
				<% if(responseData.getPer4() == 4) {%>
				<input type="radio" name="per4" value=4 checked>
				<% } else {%>
				<input type="radio" name="per4" value=4>
				<% } %>
				</td>
				<td>非常によくできている
				<% if(responseData.getPer4() == 5) {%>
				<input type="radio" name="per4" value=5 checked>
				<% } else {%>
				<input type="radio" name="per4" value=5>
				<% } %>
				</td>
			</tr>
		</tbody>
		<% } %>
	</table>
	<input type="submit" value="登録する">
</form>



</body>
</html>