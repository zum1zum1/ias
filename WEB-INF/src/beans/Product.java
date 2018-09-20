package beans;

public class Product {

	private int id = 0;
	private String title = null;
	private String path = null;
	private String productName = null;
	private String date = null;
	private String comment = null;
	private String userId = null;

	public Product(int id, String title, String path, String productName, String date, String comment, String userId) {
		super();
		this.id = id;
		this.title = title;
		this.path = path;
		this.productName = productName;
		this.date = date;
		this.comment = comment;
		this.userId = userId;
	}

	public Product() {
		// TODO 自動生成されたコンストラクター・スタブ
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

}