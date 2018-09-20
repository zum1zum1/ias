package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import beans.User;
import utility.DriverAccessor;

public class UserDAO extends DriverAccessor {
	// ユーザーIDを引数として受け取ってそのユーザーIDと一致するレコードの情報を全て返り値として返すメソッド
	public User loginUser(String userId) {
		// データベースと繋げるおまじない
		// Connectionを宣言する
		Connection con = null;
		// コネクションを作る
		con = createConnection();

		try {

			// sql文を書く   引数として受け取ったユーザーIDと一致するユーザーIDのレコードをusersテーブルからSELECTする
			String sql = "select * from users where user_id = '" + userId + "';";



			// Statementの宣言
			Statement stmt = con.createStatement();
			// ResultSetの宣言とsqlの実行
			ResultSet rs = stmt.executeQuery(sql);
			// ResultSetで次のレコードを見る
			rs.next();


			// 新しくuserを宣言し、SELECTした結果を代入する
			User user = new User(rs.getInt("id"), rs.getString("user_id"), rs.getString("user_name"), rs.getString("password"));

			// Statementを閉じる
			stmt.close();
			// ResultSetを閉じる
			rs.close();
			// コネクションを閉じる
			closeConnection(con);

			// userを返す
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