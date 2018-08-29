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
	// ユーザーのidからそのユーザーが記録した反応データを全て返すメソッド
	public ArrayList<ResponseData> selectResponseData(int userId) {
		// データベースと繋げるおまじない
		// Connectionを宣言する
		Connection con = null;
		// コネクションを作る
		con = createConnection();
		try {

			// sql文を書く   引数として持ってきたユーザーのidと一致するuser_idのレコードをresponse_dataテーブルからSELECTしてくる。必要に応じてorder by ooo descとかで並べ替える必要があるかもしれない。。。
			String sql = "select * from response_data where user_id = '" + userId + "' order by lesson_id desc;";



			// Statementの宣言
			Statement stmt = con.createStatement();
			// ResultSetの宣言とsqlの実行
			ResultSet rs = stmt.executeQuery(sql);
			// 反応データのArrayListを宣言する
			ArrayList<ResponseData> responseDataList = new ArrayList<ResponseData>();


			//一行ごとにArrayListに検索結果を格納する(while文)
			while (rs.next()) {
				ResponseData responseData = new ResponseData(rs.getInt("id"), rs.getInt("user_id"),
						rs.getInt("lesson_id"), rs.getInt("per1"), rs.getInt("per2"), rs.getInt("per3"),
						rs.getInt("per4"));
				responseDataList.add(responseData);
			}


			// Statementを閉じる
			stmt.close();
			// ResultSetを閉じる
			rs.close();
			// コネクションを閉じる
			closeConnection(con);


			// 反応データのArrayListを返す
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

			//テーブルに値をset
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