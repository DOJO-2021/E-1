package test;

import java.util.ArrayList;
import java.util.List;

import dao.CommonDao;
import model.Faq;

public class CountChangeTest {

	public static void main(String[] args) {
		// TODO 自動生成されたメソッド・スタブ
		countChangeTest();
	}
	public static void countChangeTest() {
		CommonDao cDao = new CommonDao();
		List<ArrayList<Faq>> test = new ArrayList<>();
		test = cDao.FaqTabChange();

		try {
		for(ArrayList<Faq> value:test) {
			for(Faq faq:value) {
				System.out.println(faq.getFaq_id());
				System.out.println(faq.getFaq_title());
				System.out.println(faq.getFaq_ans());
			}
			System.out.println("---------");
			}
			System.out.print("テスト成功！！");
			}catch(Exception e) {
				System.out.print("テスト失敗！");
			}
		}
	}

