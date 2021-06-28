package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import enums.UserType;
import model.Faq;
import model.SessionBeans;
import model.StuIdpw;

//インポートして連結

public class CommonDao {
	private final String jdbcPass = "jdbc:h2:file:C:/pleiades/workspace/database/StudyQ";

	//	 研修生、講師用ログインメソッド
	public boolean isLoginOK(UserType user, String id, String pw) {
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
			if (user == UserType.Student) {
				sql = studentTable;
			} else {
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
		} catch (SQLException e) {
			e.printStackTrace();
			loginResult = false;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			loginResult = false;
		} finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
					loginResult = false;
				}
			}
		}
		// 結果を返す
		return loginResult;
	}

	//	ログイン時名前を取得するメソッド
	public String loginGetName( String id, String pw) {
		Connection conn = null;
		String l_name = null;
		String f_name = null;
		String s_name = null;

		String studentTable = "select * from student_id where s_id = ? and s_pw = ?";

		String sql;
		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection(jdbcPass, "sa", "");

			// SELECT文を準備する

				sql = studentTable;
			PreparedStatement pStmt = conn.prepareStatement(sql);
			pStmt.setString(1, id);
			pStmt.setString(2, pw);

			// SELECT文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表から姓と名を取得する。
			while (rs.next()) {
				l_name = rs.getString("S_L_NAME");
			 	f_name = rs.getString("S_F_NAME");
//				姓と名をつなげて一つの変数に格納する
			 	s_name = l_name + f_name;
			}


		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}

			}

		}
		// 結果を返す
		return s_name;
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

			if (student.getS_id() != null && !student.getS_id().equals("")) {
				pStmtIns.setString(1, student.getS_id());
			} else {
				pStmtIns.setString(1, null);
			}
			if (student.getS_pw() != null && !student.getS_pw().equals("")) {
				pStmtIns.setString(2, student.getS_pw());
			} else {
				pStmtIns.setString(1, null);
			}

			if (student.getS_l_name() != null && !student.getS_l_name().equals("")) {
				pStmtIns.setString(3, student.getS_l_name());
			} else {
				pStmtIns.setString(3, student.getS_l_name());
			}
			if (student.getS_f_name() != null && !student.getS_f_name().equals("")) {
				pStmtIns.setString(4, student.getS_f_name());
			} else {
				pStmtIns.setString(4, student.getS_f_name());
			}

			if (pStmtIns.executeUpdate() == 1) {
				registResult = true;
			}
			System.out.println("研修生の登録が完了しました！");
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return registResult;
	}

	//	研修生セッション登録用メソッド
	public boolean SessionRegist(SessionBeans session) {
		Connection conn = null;
		boolean result = false;
		int maxId = 0;
		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection(jdbcPass, "sa", "");


			// SELECT文を準備する

						String selectAllSql = "SELECT MAX(SESSION_ID) AS MAXID  FROM SESSION";
						PreparedStatement pStmtSelect = conn.prepareStatement(selectAllSql);

						// SQL文を実行し、結果表を取得する
						ResultSet rs = pStmtSelect.executeQuery();
						while (rs.next()) {

								maxId=	rs.getInt("MAXID")+1;

						}



			String sql = "INSERT INTO Session VALUES(?,?,?,?,?,?)";
			PreparedStatement pStmtIns = conn.prepareStatement(sql);

			  pStmtIns.setInt(1, maxId);

			if (session.getS_name() != null && !session.getS_name().equals("")) {
				pStmtIns.setString(2, session.getS_name());
			} else {
				pStmtIns.setString(2, null);
			}
			if (session.getSubject() != null && !session.getSubject().equals("")) {
				pStmtIns.setString(3, session.getSubject());
			} else {
				pStmtIns.setString(3, null);
			}
			if (session.getQuestion() != null && !session.getQuestion().equals("")) {
				pStmtIns.setString(4, session.getQuestion());
			} else {
				pStmtIns.setString(4, null);
			}

			if (session.getFile() != null && !session.getFile().equals("")) {
				pStmtIns.setString(5, session.getFile());
			} else {
				pStmtIns.setString(5, null);
			}

			if (session.getSession_m_category() <= 9) {
				pStmtIns.setInt(6, session.getSession_m_category());
			} else {
				System.out.println("想定外の値が入力されました！");
			}

			// SQL文を実行する
			if (pStmtIns.executeUpdate() == 1) {
				result = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return result;
	}

	//	セッションリスト全表示
	public List<SessionBeans> SessionListFindAll() {
		Connection conn = null;
		List<SessionBeans> sessionList = new ArrayList<SessionBeans>();
		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection(jdbcPass, "sa", "");
			// SELECT文を準備する

			String selectAllSql = "SELECT * FROM SESSION";
			PreparedStatement pStmtSelect = conn.prepareStatement(selectAllSql);

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmtSelect.executeQuery();
			while (rs.next()) {
				SessionBeans sessionAll = new SessionBeans(
						rs.getInt("session_id"),
						rs.getString("s_name"),
						rs.getString("subject"),
						rs.getString("question"),
						rs.getString("file"),
						rs.getInt("session_m_category"));
				sessionList.add(sessionAll);
			}

		} catch (SQLException e) {
			e.printStackTrace();
			sessionList = null;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			sessionList = null;
		} finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
					sessionList = null;
				}
			}
		}
		return sessionList;

	}

//	ファイル名取得用メソッド（研修生セッション）

	public String GetFileName() {
		Connection conn = null;
		int fileNo= 0;
		String fileName = "";
		DecimalFormat df = new DecimalFormat("0000");
		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection(jdbcPass, "sa", "");
			// SELECT文を準備する

			String selectAllSql = "SELECT COUNT(*) AS CNT FROM SESSION";
			PreparedStatement pStmtSelect = conn.prepareStatement(selectAllSql);

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmtSelect.executeQuery();
			while (rs.next()) {

					fileNo = rs.getInt("CNT")+1;
			}

			fileName = df.format(fileNo);

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return fileName;

	}

	//	FAQリスト全表示
	public List<Faq> FaqListFindAll() {
		Connection conn = null;
		List<Faq> faqList = new ArrayList<Faq>();
		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection(jdbcPass, "sa", "");
			// SELECT文を準備する

			String selectAllSql = "SELECT * FROM FAQ";
			PreparedStatement pStmtSelect = conn.prepareStatement(selectAllSql);
			ResultSet rs = pStmtSelect.executeQuery();

			while (rs.next()) {
				Faq faq = new Faq(
						rs.getInt("faq_id"),
						rs.getString("faq_title"),
						rs.getString("faq_ans"));

				faqList.add(faq);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return faqList;
	}

	//	FAQ登録
	public boolean FaqRegist(Faq faq) {
		Connection conn = null;
		boolean result = false;
		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection(jdbcPass, "sa", "");
			// INSERT文を準備する

			String sql = "INSERT INTO Faq VALUES(null,?,?)";
			PreparedStatement pStmtIns = conn.prepareStatement(sql);

			if (faq.getFaq_title() != null && !faq.getFaq_title().equals("")) {
				pStmtIns.setString(1, faq.getFaq_title());
			} else {
				pStmtIns.setString(1, null);
			}
			if (faq.getFaq_ans() != null && !faq.getFaq_ans().equals("")) {
				pStmtIns.setString(2, faq.getFaq_ans());
			} else {
				pStmtIns.setString(2, null);
			}

			// SQL文を実行する
			if (pStmtIns.executeUpdate() == 1) {
				result = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return result;

	}

	//	FAQ更新
	public boolean FaqUpdate(Faq faq) {
		Connection conn = null;
		boolean result = false;
		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection(jdbcPass, "sa", "");
			// UPDATE文を準備する

			// SQL文を準備する
			String sql = "UPDATE FAQ SET FAQ_TITLE = ?,FAQ_ANS=? where faq_id = ?";
			PreparedStatement pStmtUp = conn.prepareStatement(sql);

			if (faq.getFaq_title() != null) {
				pStmtUp.setString(1, faq.getFaq_title());
			} else {
				pStmtUp.setString(1, null);
			}
			if (faq.getFaq_ans() != null) {
				pStmtUp.setString(2, faq.getFaq_ans());
			} else {
				pStmtUp.setString(2, null);
			}

			pStmtUp.setInt(3, faq.getFaq_id());

			if (pStmtUp.executeUpdate() == 1) {
				result = true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		// 結果を返す
		return result;

	}

	//	FAQ削除
	public boolean FaqDelete(int id) {
		Connection conn = null;
		boolean result = false;
		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection(jdbcPass, "sa", "");
			// SELECT文を準備する

			String sql = "DELETE FROM FAQ WHERE FAQ_ID=?";
			PreparedStatement pStmtDelete = conn.prepareStatement(sql);
			pStmtDelete.setInt(1, id);

			if (pStmtDelete.executeUpdate() == 1) {
				result = true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return result;

	}

	//	FAQカテゴリ検索
	public List<Faq> FaqSearch(String searchWord) {
		Connection conn = null;
		List<Faq> faqList = new ArrayList<>();
		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection(jdbcPass, "sa", "");
			// SELECT文を準備する

			if (searchWord.matches("\s+")||searchWord==null) {
				try {
					// JDBCドライバを読み込む
					Class.forName("org.h2.Driver");

					// データベースに接続する
					conn = DriverManager.getConnection(jdbcPass, "sa", "");
					// SELECT文を準備する

					String selectAllSql = "SELECT * FROM FAQ";
					PreparedStatement pStmtSelect = conn.prepareStatement(selectAllSql);
					ResultSet rs = pStmtSelect.executeQuery();

					while (rs.next()) {
						Faq faq = new Faq(
								rs.getInt("faq_id"),
								rs.getString("faq_title"),
								rs.getString("faq_ans"));

						faqList.add(faq);
					}
					return faqList;
				} catch (SQLException e) {
					e.printStackTrace();
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
				}finally {
					// データベースを切断
					if (conn != null) {
						try {
							conn.close();
						} catch (SQLException e) {
							e.printStackTrace();
						}
					}
					}
			}else {
				String searchreplace = searchWord.replaceAll("　", " ");
				String[] words = searchreplace.split("\\s+");

				List<String> column = new ArrayList<>();

				column.add(" FAQ_TITLE ");
				column.add(" FAQ_ANS ");

				String select = "SELECT * FROM FAQ WHERE";
				String like = "(" + column.get(0) + "LIKE ? OR " + column.get(1) + " LIKE ? )";

				for (int i = 0; i < words.length; i++) {
					select += like;
					if(i!=words.length-1) {
						select += " AND ";
					}
				}
				PreparedStatement pStmt = conn.prepareStatement(select);

					int i = 1;
					int temp = 0;

					for(i=1;i<=words.length;i++) {
						int j = i +temp;
						pStmt.setString(j,"%" + words[i-1] + "%");
						pStmt.setString(j+1,"%" + words[i-1] + "%");
						temp++;
					}



				ResultSet rs = pStmt.executeQuery();
				while (rs.next()) {
					Faq faq = new Faq(
							rs.getInt("faq_id"),
							rs.getString("faq_title"),
							rs.getString("faq_ans"));

					faqList.add(faq);

				}

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

		return faqList;
	}

	//	FAQヒットカウント
	public int FaqCount(String searchWord) {

		Connection conn = null;
		int count=0;
		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection(jdbcPass, "sa", "");
			// SELECT文を準備する

			if (searchWord.matches("\s+")||searchWord==null) {
				try {
					// JDBCドライバを読み込む
					Class.forName("org.h2.Driver");

					// データベースに接続する
					conn = DriverManager.getConnection(jdbcPass, "sa", "");
					// SELECT文を準備する

					String selectAllSql = "SELECT (*) AS CNT FROM FAQ";
					PreparedStatement pStmtSelect = conn.prepareStatement(selectAllSql);
					ResultSet rs = pStmtSelect.executeQuery();

					while (rs.next()) {
							count =	rs.getInt("CNT");
					}
					return count;
				} catch (SQLException e) {
					e.printStackTrace();
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
				}finally {
					// データベースを切断
					if (conn != null) {
						try {
							conn.close();
						} catch (SQLException e) {
							e.printStackTrace();
						}
					}
					}
			}else {
				String searchreplace = searchWord.replaceAll("　", " ");
				String[] words = searchreplace.split("\\s+");

				List<String> column = new ArrayList<>();

				column.add(" FAQ_TITLE ");
				column.add(" FAQ_ANS ");

				String select = "SELECT COUNT(*) AS CNT FROM FAQ WHERE";
				String like ="(" + column.get(0) + "LIKE ? OR " + column.get(1) + " LIKE ? )";

				for (int i = 0; i < words.length; i++) {
					select += like;
					if(i!=words.length-1) {
						select += " AND ";
					}
				}
				PreparedStatement pStmt = conn.prepareStatement(select);

					int i = 1;
					int temp = 0;

					for(i=1;i<=words.length;i++) {
						int j = i +temp;
						pStmt.setString(j,"%" + words[i-1] + "%");
						pStmt.setString(j+1,"%" + words[i-1] + "%");
						temp++;
					}



				ResultSet rs = pStmt.executeQuery();
				while (rs.next()) {
					count = rs.getInt("CNT");
				}

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

		return count;
	}

	//  FAQページ単位リスト取得
	public List<ArrayList<Faq>> FaqTabChange() {
		Connection conn = null;
		int count = 0;

		List<ArrayList<Faq>> faqPageAllList = new ArrayList<>();
		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection(jdbcPass, "sa", "");

			//			全体のレコードを取得

			String countSql = "SELECT COUNT(*) AS cnt FROM FAQ";

			PreparedStatement pStmtCount = conn.prepareStatement(countSql);

			ResultSet rs = pStmtCount.executeQuery();

			while (rs.next()) {
				count = rs.getInt("cnt");
			}

			//			レコード数÷表示件数（5ページ分）で割る
			int countChange = count / 5;

			//			もし、残りのページが5ページ未満だったら、ループで回す回数を1回追加する。（すべて取得するため）
			if (count % 5 != 0) {
				countChange++;
			}

			//			多重ループの中で５件ごとのレコードをリストに格納する。
			for (int i = 1; i <= countChange; i++) {
				ArrayList<Faq> faqPageList = new ArrayList<Faq>();
				String sql = "SELECT * FROM FAQ LIMIT ?,5";
				PreparedStatement pStmtChange = conn.prepareStatement(sql);

				int changeNum = 1 + (5 * (i - 1));
				changeNum--;

				pStmtChange.setInt(1, changeNum);

				ResultSet rsChange = pStmtChange.executeQuery();

				while (rsChange.next()) {
					Faq faq = new Faq(
							rsChange.getInt("faq_id"),
							rsChange.getString("faq_title"),
							rsChange.getString("faq_ans"));

					faqPageList.add(faq);
				}
				faqPageAllList.add(faqPageList);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return faqPageAllList;
	}
}

