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



		// 入力された値を受け取る
		// ユーザーID

		// パスワード



		// ユーザーのデータベースを操作するためのDAOを宣言する

		// データベースから、入力されたuserIdと同じuserIdを持つものを検索する

		// 入力されたパスワードとデータベースに格納されているパスワードを比較するマネージャーを宣言する

		// controlで正確なログイン情報が入力されているか確認




		// checkIDが0であったらエラー画面に、1であったら次の画面に飛ばす

		// リダイレクトさせる



			// 反応データを読み出すためのDAOを宣言する

			// ログインしたユーザーが記録した反応データをデータベースから読み出す（配列になるので、ArrayList）



			// sessionの開始

			// ユーザーをセッションに格納する

			// 反応データのArrayListをセッションに格納する


			// home.jspに飛ばす
			getServletContext().getRequestDispatcher("/Public/jsp/home.jsp").forward(request, response);
		}
	}
}
