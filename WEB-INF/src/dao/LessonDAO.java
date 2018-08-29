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

			String sql = "select * from lessons";
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);

			ArrayList<Lesson> lessonList = new ArrayList<Lesson>();
			while (rs.next()) {
				Lesson lesson = new Lesson(rs.getInt("id"), rs.getString("title"), rs.getString("date"));
				lessonList.add(lesson);
			}
			stmt.close();
			rs.close();
			return lessonList;

		} catch (SQLException e) {
			e.printStackTrace();
			return null;

		} finally {
		}
	}

}
