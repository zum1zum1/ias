package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.ResponseData;
import beans.User;
import dao.ResponseDataDAO;

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

		//sessionでuserIdの受け取り
		User user = (User) session.getAttribute("user");

		// 反応データを読み出すためのDAOを宣言する
		ResponseDataDAO responseDataDAO = new ResponseDataDAO();
		// ログインしているユーザーのIDと選択されているlessonIdを用いて，その回の自己評価が既に行われているかをチェックする
		int selfAssessmentCheck = responseDataDAO.checkDoneSelfAssessment(user.getId(),lessonId);


		// 既に行われていた場合、その自己評価を取ってきて、そうでない場合は、持ってこない
		if(selfAssessmentCheck == 1){
			ResponseData responseData =  responseDataDAO.selectOneResponseData(user.getId(),lessonId);
			request.setAttribute("responseData", responseData);
		}
		request.setAttribute("selfAssessmentCheck", selfAssessmentCheck);

		getServletContext().getRequestDispatcher("/Public/jsp/selfAssessment.jsp").forward(request, response);
	}

}
