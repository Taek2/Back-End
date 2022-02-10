package model.profile;

import org.springframework.web.multipart.MultipartFile;

public class ProfileVO {
	private String id;
	private String pw;
	private String name;
	private String image;
	private String email;
	private String phone;
	private String message;
	private MultipartFile fileUpload;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public MultipartFile getFileUpload() {
		return fileUpload;
	}
	public void setFileUpload(MultipartFile fileUpload) {
		this.fileUpload = fileUpload;
	}
	@Override
	public String toString() {
		return "ProfileVO [id=" + id + ", pw=" + pw + ", name=" + name + ", image=" + image + ", email=" + email
				+ ", phone=" + phone + ", message=" + message + "]";
	}
	
	
}

