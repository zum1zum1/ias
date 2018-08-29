package control;

import beans.User;

public class UserManager {

	// ログインが正常にできているかcheckする 上手くいってればcheckId=1,checkId=0
	public int checkUser(User user, String userId, String password) {

		if (user == null) {
			int checkId = 0;
			return checkId;

		} else if (user.getUserId().equals(userId) && user.getPassword().equals(password)) {
			int checkId = 1;
			return checkId;

		} else if (!user.getUserId().equals(userId) || !user.getPassword().equals(password)) {
			int checkId = 0;
			return checkId;
		}
		return 0;
	}
}
