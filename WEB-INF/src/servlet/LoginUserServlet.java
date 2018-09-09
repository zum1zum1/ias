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

		// 文字コードの指定
		request.setCharacterEncoding("UTF-8");



		// 入力された値を受け取る
		// ユーザーID
		String userId = request.getParameter("userId");
		// パスワード
		String password = request.getParameter("password");



		// ユーザーのデータベースを操作するためのDAOを宣言する
		UserDAO loginDAO = new UserDAO();
		// データベースから、入力されたuserIdと同じuserIdを持つものを検索する
		User user = loginDAO.loginUser(userId);

		// 入力されたパスワードとデータベースに格納されているパスワードを比較するマネージャーを宣言する
		UserManager checkLoginManager = new UserManager();
		// controlで正確なログイン情報が入力されているか確認
		int checkId = checkLoginManager.checkUser(user, userId, password);



		// checkIDが0であったらエラー画面に、1であったら次の画面に飛ばす
		if (checkId == 0) {
			// リダイレクトさせる
			response.sendRedirect("/ias/");
		} else if (checkId == 1) {

			// 反応データを読み出すためのDAOを宣言する
			ResponseDataDAO responseDataDAO = new ResponseDataDAO();
			// ログインしたユーザーが記録した反応データをデータベースから読み出す（配列になるので、ArrayList）
			ArrayList<ResponseData> responseDataList = responseDataDAO.selectResponseData(user.getId());

			// sessionの開始
			HttpSession session = request.getSession(true);
			// ユーザーをセッションに格納する
			session.setAttribute("user", user);
			// 反応データのArrayListをセッションに格納する
			session.setAttribute("responseDataList",responseDataList);

			// home.jspに飛ばす
			getServletContext().getRequestDispatcher("/Public/jsp/home.jsp").forward(request, response);
		}
	}
}
