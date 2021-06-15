package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import enums.UserType;
import model.StuIdpw;

//インポートして連結

public class  CommonDao {
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
	public boolean isStudentRegistOK(StuIdpw student) {
		Connection conn = null;
	 	boolean registResult = false;
		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection(jdbcPass, "sa", "");
			// Insert文を準備する
			String insertStudentSql = "insert into student_id values(null,?,?,?,?)";
			PreparedStatement pStmtIns = conn.prepareStatement(insertStudentSql);

			if(student.getS_id()!= null&& !student.getS_id().equals("")) {
				pStmtIns.setString(1, student.getS_id());
			}else {
				pStmtIns.setString(1, null);
			}
			if(student.getS_pw()!= null&& !student.getS_pw().equals("")) {
				pStmtIns.setString(2, student.getS_pw());
			}else {
				pStmtIns.setString(1, null);
			}

			if(student.getS_l_name()!=null&&!student.getS_l_name().equals("")) {
				pStmtIns.setString(3, student.getS_l_name());
			}else {
				pStmtIns.setString(3, student.getS_l_name());
			}
			if(student.getS_f_name()!=null&&!student.getS_f_name().equals("")) {
				pStmtIns.setString(4, student.getS_f_name());
			}else {
				pStmtIns.setString(4, student.getS_f_name());
			}

			if (pStmtIns.executeUpdate() == 1) {
				registResult = true;
			}
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
		return registResult;
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
	public int FaqCount(String searchWord) {
		Connection conn = null;
		int count=0;
		List<String> column = new ArrayList<>();
		List<Integer> countlist = new ArrayList<>();
		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection(jdbcPass, "sa", "");
			// SELECT文を準備する

			column.add(" FAQ_TITLE ");
			column.add(" FAQ_ANS ");

			String countSql01 = "SELECT COUNT(*) AS cnt FROM FAQ WHERE";
			String countSql02= "LIKE ? OR";
			String countSql03 = "LIKE ?";

				String countSql = countSql01 + column.get(0) + countSql02 + column.get(1) +  countSql03;
				PreparedStatement pStmtCount = conn.prepareStatement(countSql);

					//SQL分を完成させる
				if(searchWord != null&&!searchWord.equals("")) {
					pStmtCount.setString(1,"%" + searchWord + "%");
					pStmtCount.setString(2,"%" + searchWord + "%");
				}else {
					pStmtCount.setString(1,"%");
					pStmtCount.setString(2,"%");
				}


				ResultSet rs = pStmtCount.executeQuery();
				while(rs.next()) {
					count = rs.getInt("cnt");
				}


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

		//結果を返す
		return count;

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


// 対応状態変更
	public void Reschange() {
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
	}


