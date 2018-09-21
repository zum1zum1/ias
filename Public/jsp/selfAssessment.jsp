<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

<html>
<body>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/ias/Public/common/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<title>Self-Assessment画面</title>
</head>

<jsp:include page="../common/jsp/userLayout.jsp" />

<br>
<div class="container">

	<div class="row" style="padding: 70px 0 0 0">
		<!-- 以降は、学習成果物を蓄積する部分を表示 -->
		<div class="col-xs-4 col-sm-4 col-md-4">
			<form class="form-inline" enctype="multipart/form-data" method="post" action="UploadProductServlet">
				<h5>タイトル</h5>
				<input type="text" style="width: 100%" class="form-control form-control-lg rounded" required name="title">
				<br>
				<br>
				<div class="input-group">
					<input type="file" id="file_input" name="fl" size="75" style="display: none;" required>
					<span class="input-group-btn">
						<button class="btn btn-default" type="button" onclick="$('#file_input').click();">
							<i class="glyphicon glyphicon-folder-open"></i>
						</button>
					</span>
					<div class="input-group">
						<input id="file" type="text" class="form-control" size="75" required disabled>
					</div>
				</div>
				<br>
				<br>
				<h5>振り返り</h5>
				<div class="form-group">
					<textarea class="form-control" name="comment" required rows="5" style="width: 100%"></textarea>
				</div>
				<br>
				<br>
				<button type="submit" class="btn btn-info" id="submit">▶成果物を保存する</button>
				<br>
			</form>
		</div>

		<!-- 以降は、蓄積した学習成果物を表示する部分 -->
		<div class="col-xs-8 col-sm-8 col-md-8">
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
					%>
					<%
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
							<a class="btn btn-default" href="/ias_product/<%=userId + '/' + lesson.getId() + '/' + productList.get(i).getProductName()%>" target="_blank">確認する</a>
						</td>
					</tr>
					<%
						}
					%>
					<%
						}
					%>
					<%
						if (productList.size() == 0) {
					%>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
		</div>
	</div>

	<hr />

	<div class="row">
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

				<% if (selfAssessmentCheck == 0) { %>
				<tbody>
					<tr>
						<td>～～について</td>
						<td>
							<label for="per1_1">
							できていない
							</label>
							<input type="radio" name="per1" value=1 id="per1_1">
						</td>
						<td>
							<label for="per1_2">
							すこしできている
							</label>
							<input type="radio" name="per1" value=2 id="per1_2">
						</td>
						<td>
							<label for="per1_3">
							ふつう
							</label>
							<input type="radio" name="per1" value=3 id="per1_3">
						</td>
						<td>
							<label for="per1_4">
							よくできている
							</label>
							<input type="radio" name="per1" value=4 id="per1_4">
						</td>
						<td>
							<label for="per1_5">
							非常によくできている
							</label>
							<input type="radio" name="per1" value=5 id="per1_5">
						</td>
					</tr>
					<tr>
						<td>～～について</td>
						<td>
							<label for="per2_1">
							できていない
							</label>
							<input type="radio" name="per2" value=1 id="per2_1">
						</td>
						<td>
							<label for="per2_2">
							すこしできている
							</label>
							<input type="radio" name="per2" value=2 id="per2_2">
						</td>
						<td>
							<label for="per2_3">
							ふつう
							</label>
							<input type="radio" name="per2" value=3 id="per2_3">
						</td>
						<td>
							<label for="per2_4">
							よくできている
							</label>
							<input type="radio" name="per2" value=4 id="per2_4">
						</td>
						<td>
							<label for="per2_5">
							非常によくできている
							</label>
							<input type="radio" name="per2" value=5 id="per2_5">
						</td>
					</tr>
					<tr>
						<td>～～について</td>
						<td>
							<label for="per3_1">
							できていない
							</label>
							<input type="radio" name="per3" value=1 id="per3_1">
						</td>
						<td>
							<label for="per3_2">
							すこしできている
							</label>
							<input type="radio" name="per3" value=2 id="per3_2">
						</td>
						<td>
							<label for="per3_3">
							ふつう
							</label>
							<input type="radio" name="per3" value=3 id="per3_3">
						</td>
						<td>
							<label for="per3_4">
							よくできている
							</label>
							<input type="radio" name="per3" value=4 id="per3_4">
						</td>
						<td>
							<label for="per3_5">
							非常によくできている
							</label>
							<input type="radio" name="per3" value=5 id="per3_5">
						</td>
					</tr>
					<tr>
						<td>～～について</td>
						<td>
							<label for="per4_1">
							できていない
							</label>
							<input type="radio" name="per4" value=1 id="per4_1">
						</td>
						<td>
							<label for="per4_2">
							すこしできている
							</label>
							<input type="radio" name="per4" value=2 id="per4_2">
						</td>
						<td>
							<label for="per4_3">
							ふつう
							</label>
							<input type="radio" name="per4" value=3 id="per4_3">
						</td>
						<td>
							<label for="per4_4">
							よくできている
							</label>
							<input type="radio" name="per4" value=4 id="per4_4">
						</td>
						<td>
							<label for="per4_5">
							非常によくできている
							</label>
							<input type="radio" name="per4" value=5 id="per4_5">
						</td>
					</tr>
				</tbody>
				<% } else if (selfAssessmentCheck == 1) { %>
				<tbody>
					<tr>
						<td>～～について</td>
						<td>
							<label for="per1_1">
								できていない
							</label>
							<% if (responseData.getPer1() == 1) { %>
							<input type="radio" name="per1" value=1 checked id="per1_1">
							<% } else { %>
							<input type="radio" name="per1" value=1 id="per1_1">
							<% } %>
						</td>
						<td>
							<label for="per1_2">
							すこしできている
							</label>
							<% if (responseData.getPer1() == 2) { %>
							<input type="radio" name="per1" value=2 checked id="per1_2">
							<% } else { %>
							<input type="radio" name="per1" value=2 id="per1_2">
							<% } %>
						</td>
						<td>
							<label for="per1_3">
							ふつう
							</label>
							<% if (responseData.getPer1() == 3) { %>
							<input type="radio" name="per1" value=3 checked id="per1_3">
							<% } else { %>
							<input type="radio" name="per1" value=3 id="per1_3">
							<% } %>
						</td>
						<td>
							<label for="per1_4">
							よくできている
							</label>
							<% if (responseData.getPer1() == 4) { %>
							<input type="radio" name="per1" value=4 checked id="per1_4">
							<% } else { %>
							<input type="radio" name="per1" value=4 id="per1_4">
							<% } %>
						</td>
						<td>
							<label for="per1_5">
							非常によくできている
							</label>
							<% if (responseData.getPer1() == 5) { %>
							<input type="radio" name="per1" value=5 checked id="per1_5">
							<% } else { %>
							<input type="radio" name="per1" value=5 id="per1_5">
							<% } %>
						</td>
					</tr>
					<tr>
						<td>～～について</td>
						<td>
							<label for="per2_1">
								できていない
							</label>
							<% if (responseData.getPer2() == 1) { %>
							<input type="radio" name="per2" value=1 checked id="per2_1">
							<% } else { %>
							<input type="radio" name="per2" value=1 id="per2_1">
							<% } %>
						</td>
						<td>
							<label for="per2_2">
							すこしできている
							</label>
							<% if (responseData.getPer2() == 2) { %>
							<input type="radio" name="per2" value=2 checked id="per2_2">
							<% } else { %>
							<input type="radio" name="per2" value=2 id="per2_2">
							<% } %>
						</td>
						<td>
							<label for="per2_3">
							ふつう
							</label>
							<% if (responseData.getPer2() == 3) { %>
							<input type="radio" name="per2" value=3 checked id="per2_3">
							<% } else { %>
							<input type="radio" name="per2" value=3 id="per2_3">
							<% } %>
						</td>
						<td>
							<label for="per2_4">
							よくできている
							</label>
							<% if (responseData.getPer2() == 4) { %>
							<input type="radio" name="per2" value=4 checked id="per2_4">
							<% } else { %>
							<input type="radio" name="per2" value=4 id="per2_4">
							<% } %>
						</td>
						<td>
							<label for="per2_5">
							非常によくできている
							</label>
							<% if (responseData.getPer2() == 5) { %>
							<input type="radio" name="per2" value=5 checked id="per2_5">
							<% } else { %>
							<input type="radio" name="per2" value=5 id="per2_5">
							<% } %>
						</td>
					</tr>
					<tr>
						<td>～～について</td>
						<td>
							<label for="per3_1">
								できていない
							</label>
							<% if (responseData.getPer3() == 1) { %>
							<input type="radio" name="per3" value=1 checked id="per3_1">
							<% } else { %>
							<input type="radio" name="per3" value=1 id="per3_1">
							<% } %>
						</td>
						<td>
							<label for="per3_2">
							すこしできている
							</label>
							<% if (responseData.getPer3() == 2) { %>
							<input type="radio" name="per3" value=2 checked id="per3_2">
							<% } else { %>
							<input type="radio" name="per3" value=2 id="per3_2">
							<% } %>
						</td>
						<td>
							<label for="per3_3">
							ふつう
							</label>
							<% if (responseData.getPer3() == 3) { %>
							<input type="radio" name="per3" value=3 checked id="per3_3">
							<% } else { %>
							<input type="radio" name="per3" value=3 id="per3_3">
							<% } %>
						</td>
						<td>
							<label for="per3_4">
							よくできている
							</label>
							<% if (responseData.getPer3() == 4) { %>
							<input type="radio" name="per3" value=4 checked id="per3_4">
							<% } else { %>
							<input type="radio" name="per3" value=4 id="per3_4">
							<% } %>
						</td>
						<td>
							<label for="per3_5">
							非常によくできている
							</label>
							<% if (responseData.getPer3() == 5) { %>
							<input type="radio" name="per3" value=5 checked id="per3_5">
							<% } else { %>
							<input type="radio" name="per3" value=5 id="per3_5">
							<% } %>
						</td>
					</tr>
					<tr>
						<td>～～について</td>
						<td>
							<label for="per4_1">
								できていない
							</label>
							<% if (responseData.getPer4() == 1) { %>
							<input type="radio" name="per4" value=1 checked id="per4_1">
							<% } else { %>
							<input type="radio" name="per4" value=1 id="per4_1">
							<% } %>
						</td>
						<td>
							<label for="per4_2">
							すこしできている
							</label>
							<% if (responseData.getPer4() == 2) { %>
							<input type="radio" name="per4" value=2 checked id="per4_2">
							<% } else { %>
							<input type="radio" name="per4" value=2 id="per4_2">
							<% } %>
						</td>
						<td>
							<label for="per4_3">
							ふつう
							</label>
							<% if (responseData.getPer4() == 3) { %>
							<input type="radio" name="per4" value=3 checked id="per4_3">
							<% } else { %>
							<input type="radio" name="per4" value=3 id="per4_3">
							<% } %>
						</td>
						<td>
							<label for="per4_4">
							よくできている
							</label>
							<% if (responseData.getPer4() == 4) { %>
							<input type="radio" name="per4" value=4 checked id="per4_4">
							<% } else { %>
							<input type="radio" name="per4" value=4 id="per4_4">
							<% } %>
						</td>
						<td>
							<label for="per4_5">
							非常によくできている
							</label>
							<% if (responseData.getPer4() == 5) { %>
							<input type="radio" name="per4" value=5 checked id="per4_5">
							<% } else { %>
							<input type="radio" name="per4" value=5 id="per4_5">
							<% } %>
						</td>
					</tr>
				</tbody>
				<% } %>
			</table>

			<div style="text-align: right">
				<a href="SelectLessonServlet" class="btn btn-default">授業を選択する画面にもどる</a>
				<button type='submit' class="btn btn-info" value="登録する" id="submit">登録する</button>
			</div>
			<br>
			<% out.println("</form>"); %>
		</div>
	</div>
</div>

</body>
</html>

<script src="../common/bootstrap/js/jquery-3.2.1.js"></script>
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
<script type="text/javascript">
	$(function() {
		$('#file_input').change(function() {
			$('#file').val($(this).val());
		});
	})
</script>
