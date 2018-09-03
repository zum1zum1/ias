<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="beans.ResponseData"%>
<%
	@SuppressWarnings("unchecked")
	ArrayList<ResponseData> responseDataList = (ArrayList<ResponseData>) session.getAttribute("responseDataList");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="../common/bootstrap.jsp" />
<title>トップ画面</title>
</head>

<jsp:include page="../common/style.jsp" />
<br>
<br>
<div class="col col-12 col-lg-12">
<% responseDataList.size(); %>
	<table class="table table-hover">
			<thead class="thead-light">
			<tr>
				<th>LessonId</th>
				<%
					for(int i=0;i<responseDataList.size();i++){
				%>
				<th>
					<%=responseDataList.get(i).getLessonId()%>
				</th>
				<%
					}
				%>
			</tr>
			</thead>
			<tr>
				<th>per1</th>
				<%
					for(int i=0;i<responseDataList.size();i++){
					%>
				<th>
					<%=responseDataList.get(i).getPer1()%>
				</th>
				<%
					}
				%>
			</tr>
			<tr>
				<th>per2</th>
				<%
					for(int i=0;i<responseDataList.size();i++){
					%>
				<th>
					<%=responseDataList.get(i).getPer2()%>
				</th>
				<%
					}
				%>
			</tr>
			<tr>
				<th>per3</th>
				<%
					for(int i=0;i<responseDataList.size();i++){
					%>
				<th>
					<%=responseDataList.get(i).getPer3()%>
				</th>
				<%
					}
				%>
			</tr>
			<tr>
				<th>per4</th>
				<%
					for(int i=0;i<responseDataList.size();i++){
					%>
				<th>
					<%=responseDataList.get(i).getPer4()%>
				</th>
				<%
					}
				%>
			</tr>
	</table>

	<a href="SelectLessonServlet" role="button">自己評価を行う</a>
</div>
</body>
</html>