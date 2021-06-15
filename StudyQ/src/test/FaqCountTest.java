package test;

import dao.CommonDao;

public class FaqCountTest {
	public static void main(String[] args) {
		testIsCountOK01();
	}
	public static void testIsCountOK01() {
		CommonDao commonLog = new CommonDao();
		try {
		int count = commonLog.FaqCount("");
			System.out.println("ヒットした件数は"+count+"です。");
		}
		catch(Exception e) {
			System.out.println("テストが失敗しました");
		}
	}

}
