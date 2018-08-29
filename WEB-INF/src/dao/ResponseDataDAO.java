package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

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
			ResponseData responseData = new ResponseData(rs.getInt("id"),rs.getInt("user_id"),rs.getInt("lesson_id"),rs.getInt("per1"),rs.getInt("per2"),rs.getInt("per3"),rs.getInt("per4"));
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
}