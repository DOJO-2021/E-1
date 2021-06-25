package test;

import java.util.ArrayList;
import java.util.List;

import dao.CommonDao;
import model.Faq;

public class FaqFindAllTest {
	public static void main(String[] args) {
		testIsFindAllOk();
	}
	public static void testIsFindAllOk() {
		List<Faq> faqtest = new ArrayList<>();
		CommonDao commonLog = new CommonDao();
		try {
			faqtest = commonLog.FaqListFindAll();
			for(int i = 0;i<faqtest.size();i++) {
				System.out.println(faqtest.get(i).getFaq_title());
				System.out.println(faqtest.get(i).getFaq_ans());
			}
		}
		catch (Exception e) {
			// TODO: handle exception
		}
	}
}
