package member.model;

import java.sql.Timestamp;

public class MemberDataBean {
	private int grade;
	private String name;
	private String gender;	
	private String email;
	private String password;
	private int wish;
	private Timestamp reg_date;
	
	public int getWish() {
		return wish;
	}
	public void setWish(int wish) {
		this.wish = wish;
	}	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
		
}
