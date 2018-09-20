package dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import com.mysql.jdbc.PreparedStatement;

import utility.DriverAccessor;

public class ProductDAO extends DriverAccessor {

	public void registProduct(String title, String path, String productName, String comment, String userId) {

		Calendar c = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd/HH:mm:ss");

		Connection con = null;
		con = createConnection();

		try {
			String sql = "insert into products(id,title,path,product_name,date,comment,user_id) values(?, ?, ?, ?, ?,?,?)";
			PreparedStatement stmt = (PreparedStatement) con.prepareStatement(sql);
			stmt.setInt(1, 0);
			stmt.setString(2, title);
			stmt.setString(3, path);
			stmt.setString(4, productName);
			stmt.setString(5, sdf.format(c.getTime()));
			stmt.setString(6, comment);
			stmt.setString(7, userId);
			stmt.executeUpdate();
			stmt.close();

		} catch (

		SQLException e) {
			e.printStackTrace();
			return;
		} finally {
		}
	}
}