package servlet;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import beans.Lesson;
import beans.Product;
import beans.ResponseData;
import beans.User;
import dao.ProductDAO;
import dao.ResponseDataDAO;

@SuppressWarnings("serial")
// 最大MaxSize
@MultipartConfig(maxFileSize = 104857600)
public class UploadProductServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		// sessionの宣言
		HttpSession session = request.getSession(false);
		User user = (User) session.getAttribute("user");
		String userId = user.getUserId();

		Lesson lesson = (Lesson) session.getAttribute("lesson");
		int lessonId = lesson.getId();

		// ファイル以外の入力情報の取得
		String title = request.getParameter("title");
		String comment = request.getParameter("comment");

		// ファイル保存先
		final File uploadDir = new File("C:/ias_product/" + userId + "/" + lessonId);
		Part fl = request.getPart("fl");

		// ファイル名が重複するのを防ぐため、時間を取得する
		SimpleDateFormat timeSub = new SimpleDateFormat("ss");
		String time = timeSub.format(new Date());
		String changeProductName = time.concat(fl.getSubmittedFileName()).toString();

		// ファイルの保存
		save(fl, new File(uploadDir, changeProductName));

		// uploadDirをStirngに変換
		String path = uploadDir.toString();

		// DBに保存
		ProductDAO productDAO = new ProductDAO();
		productDAO.registProduct(title, path, changeProductName, comment, userId, lessonId);

		// lessonId（とuserId）が一致する成果物をDBから検索する
		ProductDAO searchProductDAO = new ProductDAO();
		ArrayList<Product> productList = (ArrayList<Product>) searchProductDAO.searchAllProduct(userId, lessonId);
		session.setAttribute("productList", productList);

		// 以降は、ルーブリックを用いた自己評価の記録について
		// 反応データを読み出すためのDAOを宣言する
		ResponseDataDAO responseDataDAO = new ResponseDataDAO();
		// ログインしているユーザーのIDと選択されているlessonIdを用いて，その回の自己評価が既に行われているかをチェックする
		int selfAssessmentCheck = responseDataDAO.checkDoneSelfAssessment(user.getId(), lessonId);

		// 既に行われていた場合、その自己評価を取ってきて、そうでない場合は、持ってこない
		if (selfAssessmentCheck == 1) {
			ResponseData responseData = responseDataDAO.selectOneResponseData(user.getId(), lessonId);
			request.setAttribute("responseData", responseData);
		}

		// 後のservletで使うからsessionで保持
		session.setAttribute("lesson", lesson);
		request.setAttribute("selfAssessmentCheck", selfAssessmentCheck);

		getServletContext().getRequestDispatcher("/Public/jsp/selfAssessment.jsp").forward(request, response);
	}

	public void save(Part in, File out) throws IOException {
		BufferedInputStream br = new BufferedInputStream(in.getInputStream());
		try (BufferedOutputStream bw = new BufferedOutputStream(new FileOutputStream(out))) {
			int len = 0;
			byte[] buff = new byte[1024];
			while ((len = br.read(buff)) != -1) {
				bw.write(buff, 0, len);
			}
		}
	}
}