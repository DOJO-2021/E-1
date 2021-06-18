package test;

import dao.CommonDao;
import model.SessionBeans;

public class SessionRegistTest {
	 public static void main(String[] args) {
		 SessionRegisttest();
	}
	 public static void  SessionRegisttest() {
		 CommonDao commonLog = new CommonDao();
		 if(commonLog.SessionRegist(new SessionBeans(1,"山田","テストについて","とても難しい","007",3))) {
			 System.out.println("テスト成功");
		 }else {
			 System.out.println("テスト失敗");
		 }
	 }
}
