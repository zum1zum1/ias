<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ログインフォーム</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<a class="navbar-brand text-white">Individual Assessment System</a>
	</nav>
	<br>
	<div class="container py-5">
		<div class="row">
			<div class="col-md-12">
				<!-- <h2 class="text-center text-black mb-4">Login Form</h2> -->
				<div class="row">
					<div class="col-md-6 mx-auto">
						<!-- form card login -->
						<div class="card rounded-0 shadow">
							<div class="card-header bg-primary">
								<h2 class="mb-0 text-white">Login Form</h2>
							</div>
							<div class="card-body">
								<form class="form" method="post" action="/ias/Public/jsp/LoginUserServlet">
									<div class="form-group">
										<label>UserID</label>
										<input type="text" class="form-control form-control-lg rounded" name="userId" required>
									</div>
									<div class="form-group">
										<label>Password</label>
										<input type="password" class="form-control form-control-lg rounded" name="password" required>
									</div>
									<button type="submit" class="btn btn-primary">ログイン</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>