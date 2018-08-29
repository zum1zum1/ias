package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.ResponseData;
import dao.ResponseDataDAO;

public class ReceiveSelfAssessmentServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//文字コードの設定
		request.setCharacterEncoding("UTF-8");

		//sessionの宣言
		HttpSession session = request.getSession(true);

		//sessionでuserIdの受け取り
		int userId = (int) session.getAttribute("userId");

		//sessionでlessonIdの受け取り
		int lessonId = (int) session.getAttribute("lessonId");

		//.jspで入力されたrubricの値を受け取る(4回分)
		int per1 = Integer.parseInt(request.getParameter("per1"));
		int per2 = Integer.parseInt(request.getParameter("per2"));
		int per3 = Integer.parseInt(request.getParameter("per3"));
		int per4 = Integer.parseInt(request.getParameter("per4"));

		//ResponseDataオブジェクトをresponseDataとして宣言し、コンストラクタ化
		ResponseData responseData = new ResponseData(0,userId,lessonId,per1,per2,per3,per4);

		 //ResponseDataDAOのオブジェクトをresponseDataDAOとして宣言
		ResponseDataDAO responseDataDAO = new ResponseDataDAO();

		//responseDataをDBに登録
		responseDataDAO.registResponseData(responseData);

		getServletContext().getRequestDispatcher("/Public/jsp/home.jsp").forward(request, response);
	}

}
