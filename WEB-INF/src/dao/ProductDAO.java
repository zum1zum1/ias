package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import com.mysql.jdbc.PreparedStatement;

import beans.Product;
import utility.DriverAccessor;

public class ProductDAO extends DriverAccessor {

	public void registProduct(String title, String path, String productName, String comment, String userId,int lessonId) {

		Calendar c = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd/HH:mm:ss");

		Connection con = null;
		con = createConnection();

		try {
			String sql = "insert into products(id,title,path,product_name,date,comment,user_id) values(?, ?, ?, ?, ?,?,?,?)";
			PreparedStatement stmt = (PreparedStatement) con.prepareStatement(sql);
			stmt.setInt(1, 0);
			stmt.setString(2, title);
			stmt.setString(3, path);
			stmt.setString(4, productName);
			stmt.setString(5, sdf.format(c.getTime()));
			stmt.setString(6, comment);
			stmt.setString(7, userId);
			stmt.setInt(8, lessonId);
			stmt.executeUpdate();
			stmt.close();

		} catch (

		SQLException e) {
			e.printStackTrace();
			return;
		} finally {
		}
	}

	public ArrayList<Product> searchAllProduct(int userId, int lessonId) {

		Connection con = null;
		con = createConnection();

		try {
			String sql = "select * from products where user_id = '" + userId + "' AND lesson_id =" + lessonId;

			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			ArrayList<Product> productList = new ArrayList<Product>();

			while (rs.next()) {

				// productの集合体がproductListなので、変数名は、product
				Product product = new Product();
				product.setId(rs.getInt("id"));
				product.setTitle(rs.getString("title"));
				product.setPath(rs.getString("path"));
				product.setProductName(rs.getString("product_name"));
				product.setDate(rs.getString("date"));
				product.setComment(rs.getString("comment"));
				product.setUserId(rs.getString("user_id"));
				product.setLessonId(rs.getInt("lesson_id"));
				productList.add(product);
			}

			stmt.close();
			rs.close();
			closeConnection(con);

			return productList;

		} catch (

		SQLException e)

		{
			e.printStackTrace();
			return null;
		} finally

		{
		}
	}

}