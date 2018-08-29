package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import beans.Lesson;
import utility.DriverAccessor;

public class LessonDAO extends DriverAccessor {

	public ArrayList<Lesson> searchLesson() {

		Connection con = null;
		con = createConnection();

		try {

			//sql文（今回は検索なので、select）
			String sql = "select * from lessons";

			//Statementの宣言
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);

			//一行ごとにArrayListに検索結果を格納する(while文)
			ArrayList<Lesson> lessonList = new ArrayList<Lesson>();
			while (rs.next()) {
				Lesson lesson = new Lesson(rs.getInt("id"), rs.getString("title"), rs.getString("date"));
				lessonList.add(lesson);
			}

			//Statement及びResultSetの終了
			stmt.close();
			rs.close();

			//検索結果をreturnする
			return lessonList;

		} catch (SQLException e) {
			e.printStackTrace();
			return null;

		} finally {
		}
	}

}
