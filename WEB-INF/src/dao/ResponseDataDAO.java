package dao;

import java.sql.SQLException;
import java.util.ArrayList;

import beans.ResponseData;
import utility.DriverAccessor;

public class ResponseDataDAO extends DriverAccessor {
	// ユーザーのidからそのユーザーが記録した反応データを全て返すメソッド
	public ArrayList<ResponseData> selectResponseData(int userId) {
		// データベースと繋げるおまじない
		// Connectionを宣言する

		// コネクションを作る

		try {

			// sql文を書く   引数として持ってきたユーザーのidと一致するuser_idのレコードをresponse_dataテーブルからSELECTしてくる。必要に応じてorder by ooo descとかで並べ替える必要があるかもしれない。。。

			// Statementの宣言

			// ResultSetの宣言とsqlの実行

			// 反応データのArrayListを宣言する


			//一行ごとにArrayListに検索結果を格納する(while文)


			// Statementを閉じる

			// ResultSetを閉じる

			// コネクションを閉じる

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

		try {

			//insert文の宣言（例えば、responseData.getUserId()）

			//PreparedStatementの宣言開始（DBに格納するための変数の宣言）

			//テーブルに値をset

			//DBのUpdate

			//PreparedStatementの終了

		} catch (

		SQLException e) {
			e.printStackTrace();
			return;
		} finally {
		}
	}

}