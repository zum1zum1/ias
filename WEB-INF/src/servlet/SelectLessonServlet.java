package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SelectLessonServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//文字コードの設定


		//ArrayListでLessonオブジェクトをlessonとして宣言

		//LessonDAOのオブジェクトをleesonDAOとして宣言

		//lessonListにDBから受け取った値を格納

		//.jspに渡せるようにrequestで宣言

		getServletContext().getRequestDispatcher("/Public/jsp/selectLesson.jsp").forward(request, response);
	}

}
