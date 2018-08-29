package beans;

public class Lesson {

	private int id = 0;
	private String title = null;
	private String date = null;

	public Lesson(int id, String title, String date) {
		super();
		this.id = id;
		this.title = title;
		this.date = date;
	}

	public Lesson(){

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

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

}
