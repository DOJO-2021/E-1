package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import enums.UserType;

//インポートして連結

public class  Common {
	private final String jdbcPass =  "jdbc:h2:file:C:/pleiades/workspace/E-1/database/StudyQ";
//	 研修生、講師用ログインメソッド
	public boolean isLoginOK(UserType user,String id, String pw) {
		Connection conn = null;
		boolean loginResult = false;
		String studentTable = "select count(*) from student_id where s_id = ? and s_pw = ?";
		String teacherTable = "select count(*) from teacher_id where t_id = ? and t_pw = ?";
		String sql;
		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection(jdbcPass, "sa", "");

			// SELECT文を準備する
			if(user == UserType.Student) {
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
	public void isStudentRegistOK(String l_name,String f_name) {
		Connection conn = null;
	 	boolean registResult;
		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection(jdbcPass, "sa", "");
			// Insert文を準備する
//			String insertStudentIdSql = "insert into student_id values(null,?,?)";
//			String insertStudentSql = "insert into student values(null,?,?,?)";
//			PreparedStatement pStmtInsId = conn.prepareStatement(insertStudentIdSql);
//			PreparedStatement pStmtIns = conn.prepareStatement(insertStudentSql);

//			if() {}else {}
//			if() {}else {}
//
//			if() {}else {}
//			if() {}else {}
//			if() {}else {}



//
//			pStmtInsId.setString(1, insertStudentSql);
//			if (pStmtIns.executeUpdate() == 1) {
//				registResult = true;
//			}
			System.out.println("研修生の登録が完了しました！");
		}catch (SQLException e) {
			e.printStackTrace();
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

	}
//	研修生セッション登録用メソッド
	public void SessionRegist() {
		Connection conn = null;
		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection(jdbcPass, "sa", "");
			// SELECT文を準備する

			System.out.println("セッション登録が完了しました！");

		}catch (SQLException e) {
			e.printStackTrace();
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

	}

//	セッションリスト全表示
	public void SessionListFindAll() {
		Connection conn = null;
		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection(jdbcPass, "sa", "");
			// SELECT文を準備する

			System.out.println("セッションリストが全て表示されています！");

		} catch (SQLException e) {
			e.printStackTrace();
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

	}

//	FAQリスト全表示
	public void FaqListFindAll() {
		Connection conn = null;
		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection(jdbcPass, "sa", "");
			// SELECT文を準備する

			System.out.println("FAQのリストがすべて表示されています！");

		} catch (SQLException e) {
			e.printStackTrace();
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

	}

//	FAQ登録
	public void FaqRegist() {
		Connection conn = null;
		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection(jdbcPass, "sa", "");
			// SELECT文を準備する

			System.out.println("FAQ登録が完了しました！");

		} catch (SQLException e) {
			e.printStackTrace();
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}


	}
//	FAQ更新
	public void FaqUpdate() {
		Connection conn = null;
		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection(jdbcPass, "sa", "");
			// SELECT文を準備する

			System.out.println("FAQを更新しました！");

		} catch (SQLException e) {
			e.printStackTrace();
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}


	}
//	FAQ削除
	public void FaqDelete() {
		Connection conn = null;
		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection(jdbcPass, "sa", "");
			// SELECT文を準備する
			System.out.println("FAQを削除しました！");
		}catch (SQLException e) {
			e.printStackTrace();
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}


	}

//	FAQカテゴリ検索
	public void FaqSearch() {
		Connection conn = null;
		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection(jdbcPass, "sa", "");
			// SELECT文を準備する

			System.out.println("これはFAQの検索結果です！");

		} catch (SQLException e) {
			e.printStackTrace();
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}


	}

//	FAQヒットカウント
	public void FaqCount() {
		Connection conn = null;
		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection(jdbcPass, "sa", "");
			// SELECT文を準備する

			System.out.println("何件ヒットしました！");

		} catch (SQLException e) {
			e.printStackTrace();
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}


	}

//	待ち人数
	public void SessionCount() {
		Connection conn = null;
		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection(jdbcPass, "sa", "");
			// SELECT文を準備する

			System.out.println("只今の待ち人数は○○人です！");

		} catch (SQLException e) {
			e.printStackTrace();
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}


	}
}
