package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Lesson;
import dao.LessonDAO;

public class SelectLessonServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//文字コードの設定
		request.setCharacterEncoding("UTF-8");

		//ArrayListでLessonオブジェクトをlessonとして宣言
		ArrayList<Lesson> lessonList = new ArrayList<Lesson>();

		 //LessonDAOのオブジェクトをleesonDAOとして宣言
		LessonDAO lessonDAO = new LessonDAO();

		//lessonListにDBから受け取った値を格納
		lessonList = lessonDAO.searchLesson();

		//.jspに渡せるようにrequestで宣言
		request.setAttribute("lessonList", lessonList);

		getServletContext().getRequestDispatcher("/Public/jsp/selectLesson.jsp").forward(request, response);
	}

}
