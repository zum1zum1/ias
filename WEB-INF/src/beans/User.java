package beans;

public class User {

	private int id = 0;
	private String userId = null;
	private String userName = null;
	private String password = null;

	public User(int id, String userId,String userName,String password) {
		super();
		this.id = id;
		this.userId = userId;
		this.userName = userName;
		this.password = password;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
