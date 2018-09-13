<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="beans.ResponseData"%>
<%@ page import="beans.Lesson"%>

<%
	Lesson lesson = (Lesson) session.getAttribute("lesson");
	int selfAssessmentCheck = (int) request.getAttribute("selfAssessmentCheck");
	ResponseData responseData = (ResponseData) request.getAttribute("responseData");
%>

<html>
<body>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/ias/Public/common/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<title>Self-Assessment画面</title>
</head>

<jsp:include page="../common/jsp/userLayout.jsp" />

<br>
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

			<!-- 以降はルーブリックを表示 -->
			<%
				if (selfAssessmentCheck == 0) {
					out.println("<form action='ReceiveSelfAssessmentServlet' method='POST'>");
				} else {
					out.println("<form action='UpdateSelfAssessmentServlet' method='POST'>");
				}
			%>

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

				<%
					if (selfAssessmentCheck == 0) {
				%>
				<tbody>
					<tr>
						<td>～～について</td>
						<td>できていない <input type="radio" name="per1" value=1>
						</td>
						<td>すこしできている <input type="radio" name="per1" value=2>
						</td>
						<td>ふつう <input type="radio" name="per1" value=3>
						</td>
						<td>よくできている <input type="radio" name="per1" value=4>
						</td>
						<td>非常によくできている <input type="radio" name="per1" value=5>
						</td>
					</tr>
					<tr>
						<td>～～について</td>
						<td>できていない <input type="radio" name="per2" value=1>
						</td>
						<td>すこしできている <input type="radio" name="per2" value=2>
						</td>
						<td>ふつう <input type="radio" name="per2" value=3>
						</td>
						<td>よくできている <input type="radio" name="per2" value=4>
						</td>
						<td>非常によくできている <input type="radio" name="per2" value=5>
						</td>
					</tr>
					<tr>
						<td>～～について</td>
						<td>できていない <input type="radio" name="per3" value=1>
						</td>
						<td>すこしできている <input type="radio" name="per3" value=2>
						</td>
						<td>ふつう <input type="radio" name="per3" value=3>
						</td>
						<td>よくできている <input type="radio" name="per3" value=4>
						</td>
						<td>非常によくできている <input type="radio" name="per3" value=5>
						</td>
					</tr>
					<tr>
						<td>～～について</td>
						<td>できていない <input type="radio" name="per4" value=1>
						</td>
						<td>すこしできている <input type="radio" name="per4" value=2>
						</td>
						<td>ふつう <input type="radio" name="per4" value=3>
						</td>
						<td>よくできている <input type="radio" name="per4" value=4>
						</td>
						<td>非常によくできている <input type="radio" name="per4" value=5>
						</td>
					</tr>
				</tbody>
				<%
					} else if (selfAssessmentCheck == 1) {
				%>
				<tbody>
					<tr>
						<td>～～について</td>
						<td>できていない <%
							if (responseData.getPer1() == 1) {
						%> <input type="radio" name="per1" value=1 checked> <%
 	} else {
 %> <input type="radio" name="per1" value=1> <%
 	}
 %>
						</td>
						<td>すこしできている <%
							if (responseData.getPer1() == 2) {
						%> <input type="radio" name="per1" value=2 checked> <%
 	} else {
 %> <input type="radio" name="per1" value=2> <%
 	}
 %>
						</td>
						<td>ふつう <%
							if (responseData.getPer1() == 3) {
						%> <input type="radio" name="per1" value=3 checked> <%
 	} else {
 %> <input type="radio" name="per1" value=3> <%
 	}
 %>
						</td>
						<td>よくできている <%
							if (responseData.getPer1() == 4) {
						%> <input type="radio" name="per1" value=4 checked> <%
 	} else {
 %> <input type="radio" name="per1" value=4> <%
 	}
 %>
						</td>
						<td>非常によくできている <%
							if (responseData.getPer1() == 5) {
						%> <input type="radio" name="per1" value=5 checked> <%
 	} else {
 %> <input type="radio" name="per1" value=5> <%
 	}
 %>
						</td>
					</tr>
					<tr>
						<td>～～について</td>
						<td>できていない <%
							if (responseData.getPer2() == 1) {
						%> <input type="radio" name="per2" value=1 checked> <%
 	} else {
 %> <input type="radio" name="per2" value=1> <%
 	}
 %>
						</td>
						<td>すこしできている <%
							if (responseData.getPer2() == 2) {
						%> <input type="radio" name="per2" value=2 checked> <%
 	} else {
 %> <input type="radio" name="per2" value=2> <%
 	}
 %>
						</td>
						<td>ふつう <%
							if (responseData.getPer2() == 3) {
						%> <input type="radio" name="per2" value=3 checked> <%
 	} else {
 %> <input type="radio" name="per2" value=3> <%
 	}
 %>
						</td>
						<td>よくできている <%
							if (responseData.getPer2() == 4) {
						%> <input type="radio" name="per2" value=4 checked> <%
 	} else {
 %> <input type="radio" name="per2" value=4> <%
 	}
 %>
						</td>
						<td>非常によくできている <%
							if (responseData.getPer2() == 5) {
						%> <input type="radio" name="per2" value=5 checked> <%
 	} else {
 %> <input type="radio" name="per2" value=5> <%
 	}
 %>
						</td>
					</tr>
					<tr>
						<td>～～について</td>
						<td>できていない <%
							if (responseData.getPer3() == 1) {
						%> <input type="radio" name="per3" value=1 checked> <%
 	} else {
 %> <input type="radio" name="per3" value=1> <%
 	}
 %>
						</td>
						<td>すこしできている <%
							if (responseData.getPer3() == 2) {
						%> <input type="radio" name="per3" value=2 checked> <%
 	} else {
 %> <input type="radio" name="per3" value=2> <%
 	}
 %>
						</td>
						<td>ふつう <%
							if (responseData.getPer3() == 3) {
						%> <input type="radio" name="per3" value=3 checked> <%
 	} else {
 %> <input type="radio" name="per3" value=3> <%
 	}
 %>
						</td>
						<td>よくできている <%
							if (responseData.getPer3() == 4) {
						%> <input type="radio" name="per3" value=4 checked> <%
 	} else {
 %> <input type="radio" name="per3" value=4> <%
 	}
 %>
						</td>
						<td>非常によくできている <%
							if (responseData.getPer3() == 5) {
						%> <input type="radio" name="per3" value=5 checked> <%
 	} else {
 %> <input type="radio" name="per3" value=5> <%
 	}
 %>
						</td>
					</tr>
					<tr>
						<td>～～について</td>
						<td>できていない <%
							if (responseData.getPer4() == 1) {
						%> <input type="radio" name="per4" value=1 checked> <%
 	} else {
 %> <input type="radio" name="per4" value=1> <%
 	}
 %>
						</td>
						<td>すこしできている <%
							if (responseData.getPer4() == 2) {
						%> <input type="radio" name="per4" value=2 checked> <%
 	} else {
 %> <input type="radio" name="per4" value=2> <%
 	}
 %>
						</td>
						<td>ふつう <%
							if (responseData.getPer4() == 3) {
						%> <input type="radio" name="per4" value=3 checked> <%
 	} else {
 %> <input type="radio" name="per4" value=3> <%
 	}
 %>
						</td>
						<td>よくできている <%
							if (responseData.getPer4() == 4) {
						%> <input type="radio" name="per4" value=4 checked> <%
 	} else {
 %> <input type="radio" name="per4" value=4> <%
 	}
 %>
						</td>
						<td>非常によくできている <%
							if (responseData.getPer4() == 5) {
						%> <input type="radio" name="per4" value=5 checked> <%
 	} else {
 %> <input type="radio" name="per4" value=5> <%
 	}
 %>
						</td>
					</tr>
				</tbody>
				<%
					}
				%>
			</table>

			<div style="text-align: right">
				<a href="SelectLessonServlet" class="btn btn-default">授業を選択する画面にもどる</a>
				<button type='submit' class="btn btn-info" value="登録する"
					id="submit">登録する</button>
			</div>
			<br>
			<%
				out.println("</form>");
			%>
		</div>
	</div>
</div>

</body>
</html>

<script type="text/javascript">
	$(function() {
		$('#submit')
				.click(
						function() {
							if (($('input[name=per1]').is(':checked') === false)
									|| ($('input[name=per2]').is(':checked') === false)
									|| ($('input[name=per3]').is(':checked') === false)
									|| ($('input[name=per4]').is(':checked') === false)) {
								if (!alert('全てのボタンを選択してください')) {
									return false;
								}
							}
						});
	});
</script>