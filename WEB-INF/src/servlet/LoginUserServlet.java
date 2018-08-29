package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.ResponseData;
import beans.User;
import control.UserManager;
import dao.ResponseDataDAO;
import dao.UserDAO;

public class LoginUserServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		// 入力された値を受け取る
		String userId = request.getParameter("userId");
		String password = request.getParameter("password");

		// DBで検索
		UserDAO loginDAO = new UserDAO();
		User user = loginDAO.loginUser(userId);

		// controlで正確なログイン情報が入力されているか確認
		UserManager checkLoginManager = new UserManager();
		int checkId = checkLoginManager.checkUser(user, userId, password);

		// checkIDが0であったらエラー画面に、1であっらた次の画面に飛ばす
		if (checkId == 0) {
			response.sendRedirect("/ias/");
		} else if (checkId == 1) {

			ResponseDataDAO responseDataDAO = new ResponseDataDAO();
			ArrayList<ResponseData> responseDataList = responseDataDAO.selectResponseData(user.getUserId());

			// sessionの開始
			HttpSession session = request.getSession(true);
			session.setAttribute("user", user);
			session.setAttribute("responseDataList",responseDataList);

			getServletContext().getRequestDispatcher("/Public/jsp/home.jsp").forward(request, response);
		}
	}
}
