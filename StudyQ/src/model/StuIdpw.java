package model;

import java.io.Serializable;

public class StuIdpw implements Serializable {
	private int s_num;
	private String s_id;
	private String s_pw;
	private String s_l_name;
	private String s_f_name;

	public StuIdpw(int s_num, String s_id, String s_pw, String s_l_name, String s_f_name) {
		super();
		this.s_num = s_num;
		this.s_id = s_id;
		this.s_pw = s_pw;
		this.s_l_name = s_l_name;
		this.s_f_name = s_f_name;
	}

	public StuIdpw() {
		super();
		this.s_num = 0;
		this.s_id = "";
		this.s_pw = "";
		this.s_l_name = "";
		this.s_f_name = "";
	}

	public int getS_num() {
		return s_num;
	}

	public void setS_num(int s_num) {
		this.s_num = s_num;
	}

	public String getS_id() {
		return s_id;
	}

	public void setS_id(String s_id) {
		this.s_id = s_id;
	}

	public String getS_pw() {
		return s_pw;
	}

	public void setS_pw(String s_pw) {
		this.s_pw = s_pw;
	}

	public String getS_l_name() {
		return s_l_name;
	}

	public void setS_l_name(String s_l_name) {
		this.s_l_name = s_l_name;
	}

	public String getS_f_name() {
		return s_f_name;
	}

	public void setS_f_name(String s_f_name) {
		this.s_f_name = s_f_name;
	}
}

