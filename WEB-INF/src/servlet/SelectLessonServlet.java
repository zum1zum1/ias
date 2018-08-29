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

		request.setCharacterEncoding("UTF-8");

		/*
		 * 授業をすべてDBから持ってくる
		 */
		LessonDAO lessonDAO = new LessonDAO();
		ArrayList<Lesson> lessonList = new ArrayList<Lesson>();
		lessonList = lessonDAO.searchLesson();
		request.setAttribute("lessonList", lessonList);

		getServletContext().getRequestDispatcher("/Public/jsp/selectLesson.jsp").forward(request, response);
	}

}
