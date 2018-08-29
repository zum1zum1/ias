<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
										<th>ID</th>
										<th>LessonId</th>
										<th>UserId</th>
										<th>per1</th>
										<th>per2</th>
										<th>per3</th>
										<th>per4</th>
									</tr>
								</thead>
								<tbody >
									<!-- listの長さだけテーブルを作成する -->
									<%
										for (int i = 0; i < responseDataList.size(); i++) {
									%>
									<tr>
										<td>
											<%=responseDataList.get(i).getId()%>
										</td>
										<td>
											<%=responseDataList.get(i).getLessonId()%>
										</td>
										<td>
											<%=responseDataList.get(i).getUserId()%>
										</td>
										<td>
											<%=responseDataList.get(i).getPer1()%>
										</td>
										<td>
											<%=responseDataList.get(i).getPer2()%>
										</td>
										<td>
											<%=responseDataList.get(i).getPer3()%>
										</td>
										<td>
											<%=responseDataList.get(i).getPer4()%>
										</td>
									</tr>
									<%
										}
									%>
								</tbody>
							</table>
</div>
</body>
</html>