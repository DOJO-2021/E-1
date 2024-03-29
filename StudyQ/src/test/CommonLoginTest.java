package test;

import dao.CommonDao;
import enums.UserType;

public class CommonLoginTest {

	public static void main(String[] args) {
		// TODO 自動生成されたメソッド・スタブ
		testIsLoginOK1();	// ユーザーが見つかる場合のテスト
		testIsLoginOK2();// ユーザーが見つからない場合のテスト
	}
	// ユーザーが見つかる場合のテスト
	public static void testIsLoginOK1() {
		CommonDao commonLog = new CommonDao();
		if (commonLog.isLoginOK(UserType.Student,"dojo", "password")) {
			System.out.println("testIsLoginOK1：テストが成功しました");
		}
		else {
			System.out.println("testIsLoginOK1：テストが失敗しました");
		}
	}

	// ユーザーが見つからない場合のテスト
	public static void testIsLoginOK2() {
		CommonDao dao = new CommonDao();
		if (!dao.isLoginOK(UserType.Teacher,"DOJO", "pass")) {
			System.out.println("testIsLoginOK2：テストが成功しました");
		}
		else {
			System.out.println("testIsLoginOK2：テストが失敗しました");
		}
	}
}
