package test;

import java.util.ArrayList;
import java.util.List;

import dao.CommonDao;
import model.Faq;

public class FaqCategorySearchTest {

	public static void main(String[] args) {
		// TODO 自動生成されたメソッド・スタブ
		FaqCategorySearchtest();
	}

	public static void FaqCategorySearchtest() {
		List<Faq> searchList = new ArrayList<>();
		CommonDao commonLog = new CommonDao();
		try {
			String search = "E";
		searchList = commonLog.FaqSearch(search);
		for(int i = 0;i<searchList.size();i++) {
			System.out.println(searchList.get(i).getFaq_title());
			System.out.println(searchList.get(i).getFaq_ans());
		}
		}
		catch(Exception e) {
			System.out.println("テストが失敗しました");
		}
	}

}
