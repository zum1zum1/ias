package dao;

import java.sql.SQLException;
import java.util.ArrayList;

import beans.Lesson;
import utility.DriverAccessor;

public class LessonDAO extends DriverAccessor {

	public ArrayList<Lesson> searchLesson() {


		try {

			//sql文（今回は検索なので、select）

			//Statementの宣言

			//一行ごとにArrayListに検索結果を格納する(while文)

			//Statement及びResultSetの終了

			//検索結果をreturnする

		} catch (SQLException e) {
			e.printStackTrace();
			return null;

		} finally {
		}
	}

}
