package model;

import java.io.Serializable;

public class Faq implements Serializable {
	private int faq_id;
	private String faq_title;
	private String faq_ans;


	public Faq(int faq_id, String faq_title, String faq_ans) {
		super();
		this.faq_id = faq_id;
		this.faq_title = faq_title;
		this.faq_ans = faq_ans;

	}

	public Faq() {
		super();
		this.faq_id = 0;
		this.faq_title = "";
		this.faq_ans = "";

	}

	public int getFaq_id() {
		return faq_id;
	}

	public void setFaq_id(int faq_id) {
		this.faq_id = faq_id;
	}

	public String getFaq_title() {
		return faq_title;
	}

	public void setFaq_title(String faq_title) {
		this.faq_title = faq_title;
	}

	public String getFaq_ans() {
		return faq_ans;
	}

	public void setFaq_ans(String faq_ans) {
		this.faq_ans = faq_ans;
	}


}
