package model;

import java.io.Serializable;

public class StuIdpw implements Serializable {
	private String s_id; //ID
	private String s_pw; //PW

	public StuIdpw (String s_id, String s_pw) {
		this.s_id = s_id;
		this.s_pw = s_pw;
	}

	public StuIdpw() {
		this.s_id = "";
		this.s_pw = "";
	}

	public String getStuId() {
		return s_id;
	}

	public void setStuId(String s_id) {
		this.s_id = s_id;
	}

	public String getStuPw() {
		return s_pw;
	}

	public void setStuPw(String s_pw) {
		this.s_pw = s_pw;
	}
}

