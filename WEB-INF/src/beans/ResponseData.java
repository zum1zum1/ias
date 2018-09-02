package beans;

public class ResponseData {

	private int id = 0;
	private int userId = 0;
	private int lessonId = 0;
	private int per1 = 0;
	private int per2 = 0;
	private int per3 = 0;
	private int per4 = 0;

	public ResponseData(int id,int userId,int lessonId,int per1,int per2,int per3,int per4){
		super();
		this.id = id;
		this.userId = userId;
		this.lessonId = lessonId;
		this.per1 = per1;
		this.per2 = per2;
		this.per3 = per3;
		this.per4 = per4;
	}


	public ResponseData() {
		// TODO 自動生成されたコンストラクター・スタブ
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public int getUserId() {
		return userId;
	}


	public void setUserId(int userId) {
		this.userId = userId;
	}


	public int getLessonId() {
		return lessonId;
	}


	public void setLessonId(int lessonId) {
		this.lessonId = lessonId;
	}


	public int getPer1() {
		return per1;
	}


	public void setPer1(int per1) {
		this.per1 = per1;
	}


	public int getPer2() {
		return per2;
	}


	public void setPer2(int per2) {
		this.per2 = per2;
	}


	public int getPer3() {
		return per3;
	}


	public void setPer3(int per3) {
		this.per3 = per3;
	}


	public int getPer4() {
		return per4;
	}


	public void setPer4(int per4) {
		this.per4 = per4;
	}



}
