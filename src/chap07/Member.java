package chap07;

public class Member {
	private String id;
	private String pass;
	private String name;
	private int gender;
	private int age;
	private String email;
		
	public String getId() {
		return id;
	}
	public String getPass() {
		return pass;
	}
	public String getName() {
		return name;
	}
	public int getGender() {
		return gender;
		//return (gender.equals("1")? "��":"��");
	}
	public int getAge() {
		return age;
	}
	public String getEmail() {
		return email;
	}
	public String getGender2() {	// ���� int�� ���� ������ String ����,���ڷ� return
		return gender ==1? "����":"����";
	}
	
	
	public void setId(String id) {
		this.id = id;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
}
