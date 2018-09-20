package servlet;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import beans.User;
import dao.ProductDAO;

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

		// ユーザ情報の獲得
		HttpSession session = request.getSession(false);
		User user = (User) session.getAttribute("user");
		String userId = user.getUserId();

		// ファイル以外の入力情報の取得
		String title = request.getParameter("title");
		String comment = request.getParameter("comment");

		// ファイル保存先
		final File uploadDir = new File("C:/" + userId);
		Part fl = request.getPart("fl");

		// ファイル名が重複するのを防ぐため、時間を取得する
		SimpleDateFormat timeSub = new SimpleDateFormat("ss");
		String time = timeSub.format(new Date()); // 20161205124121559
		String changeProductName = time.concat(fl.getSubmittedFileName()).toString();

		if (changeProductName.length() == 2) {

			changeProductName = null;
			String path = null;

			// DBに保存
			ProductDAO productDAO = new ProductDAO();
			productDAO.registProduct(title, path, changeProductName, comment, userId);

		} else {

			// ファイルの保存
			save(fl, new File(uploadDir, changeProductName));

			// uploadDirをStirngに変換
			String path = uploadDir.toString();

			// DBに保存
			ProductDAO productDAO = new ProductDAO();
			productDAO.registProduct(title, path, changeProductName, comment, userId);

		}

		getServletContext().getRequestDispatcher("/Public/jsp/home.jsp").forward(request, response);
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