package model;

import java.io.Serializable;

public class TeachIdpw implements Serializable {
	private int t_num;
	private String t_id;
	private String t_pw;

	public TeachIdpw (int t_num, String t_id, String t_pw) {
		this.t_num = t_num;
		this.t_id = t_id;
		this.t_pw = t_pw;
	}

	public TeachIdpw() {
		this.t_num = 0;
		this.t_id = "";
		this.t_pw = "";
	}

	public int getT_num() {
		return t_num;
	}

	public void setT_num(int t_num) {
		this.t_num = t_num;
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
