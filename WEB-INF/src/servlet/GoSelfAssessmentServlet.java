package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GoSelfAssessmentServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//文字コードの設定

		//.jspで選択されたlessonIdを受け取る

		//sessionの宣言

		//後のservletで使うからsessionで保持

		getServletContext().getRequestDispatcher("/Public/jsp/selfAssessment.jsp").forward(request, response);
	}

}
