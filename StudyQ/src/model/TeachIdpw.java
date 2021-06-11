package model;

import java.io.Serializable;

public class TeachIdpw implements Serializable {
	private String t_id; //ID
	private String t_pw; //PW

	public TeachIdpw (String t_id, String t_pw) {
		this.t_id = t_id;
		this.t_pw = t_pw;
	}

	public TeachIdpw() {
		this.t_id = "";
		this.t_pw = "";
	}

	public String getTeachId() {
		return t_id;
	}

	public void setStuId(String t_id) {
		this.t_id = t_id;
	}

	public String getTeachPw() {
		return t_pw;
	}

	public void setTeachPw(String t_pw) {
		this.t_pw = t_pw;
	}
}
