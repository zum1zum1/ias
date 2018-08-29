package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ReceiveSelfAssessmentServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//文字コードの設定

		//sessionの宣言

		//sessionでuserIdの受け取り

		//sessionでlessonIdの受け取り

		//.jspで入力されたrubricの値を受け取る(4回分)

		//ResponseDataオブジェクトをresponseDataとして宣言し、コンストラクタ化

		 //ResponseDataDAOのオブジェクトをresponseDataDAOとして宣言

		//responseDataをDBに登録

		getServletContext().getRequestDispatcher("/Public/jsp/home.jsp").forward(request, response);
	}

}
