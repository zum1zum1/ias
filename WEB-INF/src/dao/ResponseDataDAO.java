package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.mysql.jdbc.PreparedStatement;

import beans.ResponseData;
import utility.DriverAccessor;

public class ResponseDataDAO extends DriverAccessor {
	// ユーザIDからパスワードを返す
	public ArrayList<ResponseData> selectResponseData(int userId) {

		Connection con = null;
		con = createConnection();

		try {
			String sql = "select * from response_data where user_id = '" + userId + "' order by lesson_id desc;";

			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			ArrayList<ResponseData> responseDataList = new ArrayList<ResponseData>();

			while (rs.next()) {
				ResponseData responseData = new ResponseData(rs.getInt("id"), rs.getInt("user_id"),
						rs.getInt("lesson_id"), rs.getInt("per1"), rs.getInt("per2"), rs.getInt("per3"),
						rs.getInt("per4"));
				responseDataList.add(responseData);
				System.out.println(responseData.getLessonId());
			}
			stmt.close();
			rs.close();
			closeConnection(con);

			return responseDataList;

		} catch (

		SQLException e)

		{
			e.printStackTrace();
			return null;
		} finally

		{
		}
	}

	public void registResponseData(ResponseData responseData) {

		//コネクションの接続開始
		Connection con = null;
		con = createConnection();

		try {

			//insert文の宣言（例えば、responseData.getUserId()）
			String sql = "insert into response_data(id,user_id,lesson_id,per1,per2,per3,per4) values(?, ?, ?, ?, ?,?,?)";

			//PreparedStatementの宣言開始（DBに格納するための変数の宣言）
			PreparedStatement stmt = (PreparedStatement) con.prepareStatement(sql);
			stmt.setInt(1, 0);
			stmt.setInt(2, responseData.getUserId());
			stmt.setInt(3, responseData.getLessonId());
			stmt.setInt(4, responseData.getPer1());
			stmt.setInt(5, responseData.getPer2());
			stmt.setInt(6, responseData.getPer3());
			stmt.setInt(7, responseData.getPer4());

			//DBのUpdate
			stmt.executeUpdate();

			//PreparedStatementの終了
			stmt.close();

		} catch (

		SQLException e) {
			e.printStackTrace();
			return;
		} finally {
		}
	}

}