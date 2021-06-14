package model;

import java.io.Serializable;

public class Session implements Serializable {
	private int session_id;
	private String s_name;
	private String subject;
	private String question;
	private String file;
	private int state;
	private int session_m_category;

	public Session(int session_id, String s_name, String subject, String question, String file, int state, int session_m_category) {
		super();
		this.session_id = session_id;
		this.s_name = s_name;
		this.subject = subject;
		this.question = question;
		this.file = file;
		this.state = state;
		this.session_m_category = session_m_category;
	}

	public Session() {
		super();
		this.session_id = 0;
		this.s_name = "";
		this.subject = "";
		this.question = "";
		this.file = "";
		this.state = 0;
		this.session_m_category = 0;
	}

	public int getSession_id() {
		return session_id;
	}

	public void setSession_id(int session_id) {
		this.session_id = session_id;
	}

	public String getS_name() {
		return s_name;
	}

	public void setS_name(String s_name) {
		this.s_name = s_name;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public int getSession_m_category() {
		return session_m_category;
	}

	public void setSession_m_category(int session_m_category) {
		this.session_m_category = session_m_category;
	}
}