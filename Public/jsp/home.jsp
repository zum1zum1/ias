<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="../common/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<title>トップ画面</title>
</head>

<jsp:include page="../common/jsp/userLayout.jsp" />

<div class="container">
	<div class="row" style="padding: 100px 0 0 0">
		<div class="col-xs-12 col-sm-12 col-md-12">
			<a href="SelectLessonServlet"> <font size="+2"> <span
					class="glyphicon glyphicon-phone" aria-hidden="true"></span>
					自己評価を行う画面に移動する
			</font>
			</a>
			<div class="image-box graph" align="center">
				<canvas id="canvassample" width="600" height="500">	</canvas>
			</div>
		</div>
	</div>
</div>
</body>
</html>

<jsp:include page="../common/jsp/visualization.jsp" />
