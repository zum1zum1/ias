<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="beans.User"%>
<%
	User user = (User) session.getAttribute("user");
	String userName = user.getUserId();
%>

<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<a class="navbar-brand" href="GoHomeServlet">Individual Assessment System</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<div class="ml-auto">
				<ul class="nav navbar-nav pull-right">
					<li class="navbar-text">
						<font size="+1">
							利用者：<%=userName%>
						</font>
					</li>

					<li>
						<a href="##">
							<button type="button" class="btn btn-outline-light" onClick="check()">Logout</button>
						</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>

	<script type="text/javascript">
		function check() {
			if (window.confirm('ログアウトしてよろしいでしょうか？(ログイン画面に戻ります)')) {
				location.href = "LogoutUserServlet";
				return true;
			} else {
				window.alert('キャンセルされました');
				return false;
			}
		}
	</script>