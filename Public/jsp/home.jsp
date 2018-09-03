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
	<table class="table table-hover">
		<thead class="thead-light">
			<tr>
				<th>LessonId</th>
				<%
					for(int i=0;i<responseDataList.size();i++){
				%>
				<th>
					<% responseDataList.get(i).getLessonId(); %>
				</th>
				<%
					}
				%>
			</tr>
			<tr>
				<th>LessonId</th>
				<%
					for(int i=0;i<responseDataList.size();i++){
					%>
				<th>
				<% responseDataList.get(i).getLessonId(); %>
				</th>
				<%
					}
				%>
			</tr>
		</thead>
</div>
</body>
</html>