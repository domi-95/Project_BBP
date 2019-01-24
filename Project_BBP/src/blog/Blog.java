package blog;

import java.io.InputStream;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

import database.BlogDao;
import user.User;

public class Blog {

	private int id;
	private String title;
	private String category;
	private String content;
	private String create;
	private User user;

	public Blog(int id, String title, String category, String content, String create, User user) {
		super();
		this.id = id;
		this.title = title;
		this.category = category;
		this.content = content;
		this.create = create;
		this.user = user;
	}

	public String getCreate() {
		Timestamp ts = Timestamp.valueOf(this.create);
		DateFormat f = new SimpleDateFormat("dd/MM/yyyy");
		f.format(ts);
		return f.format(ts);
	}

	public int getId() {
		return id;
	}

	public String getTitle() {
		return title;
	}

	public String getCategory() {
		return category;
	}

	public String getContent() {
		return content;
	}

	public User getUser() {
		return user;
	}

	public static boolean createBlogPost(String title, String category, String content, int user_id,
			InputStream picture) {
		return BlogDao.safeBlog(title, category, content, user_id, picture);
	}
	
	public static List<Blog> getAll(){
		return BlogDao.getAll();
	}

}
