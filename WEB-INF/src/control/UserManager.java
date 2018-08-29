package control;

import beans.User;

public class UserManager {

	// ログインが正常にできているかcheckする 上手くいってればcheckId=1,checkId=0
	public int checkUser(User user, String userId, String password) {


		// もしuserがnullの場合(userIdが見つからなかった)
		// checkId = 0

		// もし入力されたuserIdとデータベースのuserIdが一致している 且つ 入力されたpasswordとデータベースのpasswordが一致している場合
		// checkId = 1

		// もし入力されたuserIdとデータベースのuserIdが一致していない もしくは 入力されたpasswordとデータベースのpasswordが一致していない場合
		// checkId = 0

		return 0;
	}
}
