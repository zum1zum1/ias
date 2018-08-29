package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import beans.User;
import utility.DriverAccessor;

public class UserDAO extends DriverAccessor {
	// ユーザIDからパスワードを返す
	public User loginUser(String userId) {

		Connection con = null;
		con = createConnection();

		try {
			String sql = "select * from users where user_id = '" + userId + "';";

			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			rs.next();

			User user = new User(rs.getInt("id"), rs.getString("user_id"), rs.getString("password"));

			stmt.close();
			rs.close();
			closeConnection(con);

			return user;

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