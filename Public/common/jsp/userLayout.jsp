<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="beans.User"%>
<%
	User user = (User) session.getAttribute("user");
	String userName = user.getUserId();
%>
<body>

	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="navbar-header">
			<div class="navbar-brand">
				<font color="#FFFFFF">Individual Assessment Support System</font>
			</div>
		</div>

		<div class="collapse navbar-collapse navbar-fixed-top">
			<ul class="nav navbar-nav navbar-right">
				<li class="navbar-text"><font size="+1"> 利用者：<%=userName%>
				</font></li>
				<li><a href="GoHomeServlet"> <span
						class="glyphicon glyphicon-home" aria-hidden="true"></span> <font
						size="+1">ホーム画面</font>
				</a></li>
				<li><a href="##" onClick="check()"> <span
						class="glyphicon glyphicon-log-out" aria-hidden="true"></span> <font
						size="+1">ログアウト</font>
				</a></li>
			</ul>
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