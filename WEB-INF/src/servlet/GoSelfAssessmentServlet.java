package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class GoSelfAssessmentServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//文字コードの設定
		request.setCharacterEncoding("UTF-8");

		//.jspで選択されたlessonIdを受け取る
		int lessonId = Integer.parseInt(request.getParameter("lessonId"));

		//sessionの宣言
		HttpSession session = request.getSession(true);

		//後のservletで使うからsessionで保持
		session.setAttribute("lessonId", lessonId);

		getServletContext().getRequestDispatcher("/Public/jsp/selfAssessment.jsp").forward(request, response);
	}

}
