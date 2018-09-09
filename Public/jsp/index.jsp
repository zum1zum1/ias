<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<link href="/ias/Public/common/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ログインフォーム</title>
</head>

<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="navbar-header">
			<div class="navbar-brand">
				<font color="#FFFFFF">Individual Assessment Support System</font>
			</div>
		</div>
	</nav>
	<br>
	<div class="container">
		<div class="row" style="padding: 60px 0 0 0">
			<h3>Login Form</h3>
			<br>
			<form action='/ias/Public/jsp/LoginUserServlet' method='POST'
				class="form-inline">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="ユーザID"
						name="userId">
				</div>
				<div class="form-group">
					<input type="password" class="form-control" placeholder="パスワード"
						name="password">
				</div>
				<button type="submit" class="btn btn-primary">サインイン</button>
			</form>
			<hr style="margin: 40px 0;">
		</div>
	</div>
</body>
</html>