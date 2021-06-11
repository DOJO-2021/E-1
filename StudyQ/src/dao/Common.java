package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

//インポートして連結

public class  Common {
	 public void  select(List<Object> deta){

	 }
//	 研修生、講師用ログインメソッド
	public boolean isLoginOK(int jadge,String id, String pw) {
		Connection conn = null;
		boolean loginResult = false;
		String studentTable = "select count(*) from student_id where s_id = ? and s_pw = ?";
		String teacherTable = "select count(*) from teacher_id where t_id = ? and t_pw = ?";
		String sql;
		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/E-1/database/StudyQ", "sa", "");

			// SELECT文を準備する
			if(jadge == 1) {
				sql = studentTable;
			}else {
				sql = teacherTable;
			}
			PreparedStatement pStmt = conn.prepareStatement(sql);
			pStmt.setString(1, id);
			pStmt.setString(2, pw);

			// SELECT文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// ユーザーIDとパスワードが一致するユーザーがいたかどうかをチェックする
			rs.next();
			if (rs.getInt("count(*)") == 1) {
				loginResult = true;
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			loginResult = false;
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
			loginResult = false;
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
					loginResult = false;
				}
			}
		}
		// 結果を返す
		return loginResult;
	}
//	 研修生登録メソッド
	public void isStudentRegistOK() {
		Connection conn = null;
	 	boolean registResult;
		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/E-1/database/StudyQ", "sa", "");
			// Insert文を準備する
			String dammy =  "insert into study_id values(null,teraco,123456)";
			PreparedStatement pStmtIns = conn.prepareStatement(dammy);
			if (pStmtIns.executeUpdate() == 1) {
				registResult = true;
			}

		} catch (Exception e) {
			// TODO: handle exception

		}

	}
//	研修生セッション登録用メソッド
	public void SessionRegist() {
		Connection conn = null;
		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/E-1/database/StudyQ", "sa", "");
			// SELECT文を準備する



		} catch (Exception e) {
			// TODO: handle exception
		}

	}

//	セッションリスト全表示
	public void SessionListFindAll() {
		Connection conn = null;
		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/E-1/database/StudyQ", "sa", "");
			// SELECT文を準備する



		} catch (Exception e) {
			// TODO: handle exception
		}

	}

//	FAQリスト全表示
	public void FaqListFindAll() {
		Connection conn = null;
		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/E-1/database/StudyQ", "sa", "");
			// SELECT文を準備する



		} catch (Exception e) {
			// TODO: handle exception
		}

	}

//	FAQ登録
	public void FaqRegist() {
		Connection conn = null;
		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/E-1/database/StudyQ", "sa", "");
			// SELECT文を準備する



		} catch (Exception e) {
			// TODO: handle exception
		}

	}
//	FAQ更新
	public void FaqUpdate() {
		Connection conn = null;
		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/E-1/database/StudyQ", "sa", "");
			// SELECT文を準備する



		} catch (Exception e) {
			// TODO: handle exception
		}

	}
//	FAQ削除
	public void FaqDelete() {
		Connection conn = null;
		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/E-1/database/StudyQ", "sa", "");
			// SELECT文を準備する



		} catch (Exception e) {
			// TODO: handle exception
		}

	}

//	FAQカテゴリ検索
	public void FaqSearch() {
		Connection conn = null;
		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/E-1/database/StudyQ", "sa", "");
			// SELECT文を準備する



		} catch (Exception e) {
			// TODO: handle exception
		}

	}

//	FAQヒットカウント
	public void FaqCount() {
		Connection conn = null;
		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/E-1/database/StudyQ", "sa", "");
			// SELECT文を準備する



		} catch (Exception e) {
			// TODO: handle exception
		}

	}

//	待ち人数
	public void SessionCount() {
		Connection conn = null;
		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/E-1/database/StudyQ", "sa", "");
			// SELECT文を準備する



		} catch (Exception e) {
			// TODO: handle exception
		}

	}
}
