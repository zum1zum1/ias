package dao;

import java.sql.SQLException;

import beans.User;
import utility.DriverAccessor;

public class UserDAO extends DriverAccessor {
	// ユーザーIDを引数として受け取ってそのユーザーIDと一致するレコードの情報を全て返り値として返すメソッド
	public User loginUser(String userId) {
		// データベースと繋げるおまじない
		// Connectionを宣言する

		// コネクションを作る

		try {

			// sql文を書く   引数として受け取ったユーザーIDと一致するユーザーIDのレコードをusersテーブルからSELECTする



			// Statementの宣言

			// ResultSetの宣言とsqlの実行

			// ResultSetで次のレコードを見る



			// 新しくuserを宣言し、SELECTした結果を代入する

			// Statementを閉じる

			// ResultSetを閉じる

			// コネクションを閉じる


			// userを返す
			return "user";

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