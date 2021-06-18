package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import enums.UserType;
import model.Faq;
import model.SessionBeans;
import model.StuIdpw;

//インポートして連結

public class  CommonDao {
	private final String jdbcPass =  "jdbc:h2:file:C:/pleiades/workspace/database/StudyQ";
//	 研修生、講師用ログインメソッド（完）
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
//	 研修生登録メソッド(完)
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
//	研修生セッション登録用メソッド(完)
	public boolean SessionRegist(SessionBeans session) {
		Connection conn = null;
		boolean result = false;
		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection(jdbcPass, "sa", "");

			String sql = "INSERT INTO Session VALUES(null,?,?,?,?,?)";
			PreparedStatement pStmtIns = conn.prepareStatement(sql);

			if (session.getS_name() != null&&!session.getS_name().equals("")) {
				pStmtIns.setString(1, session.getS_name());
			}else {pStmtIns.setString(1, null);}
			if (session.getSubject() != null &&!session.getSubject().equals("")) {
				pStmtIns.setString(2,session.getSubject());
			}else {
				pStmtIns.setString(2, null);
			}
			if (session.getQuestion() != null &&!session.getQuestion().equals("")) {
				pStmtIns.setString(3, session.getQuestion());
			}else {
				pStmtIns.setString(3, null);
			}

			if (session.getFile() != null && !session.getFile().equals("")) {
				pStmtIns.setString(4, session.getFile());
			}else {
				pStmtIns.setString(4, null);
			}

			if (session.getSession_m_category()<=9) {
				pStmtIns.setInt(5, session.getSession_m_category());
			}else{
				System.out.println("想定外の値が入力されました！");
			}




			// SQL文を実行する
			if (pStmtIns.executeUpdate() == 1) {
				result = true;
			}
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
		return result;
	}

//	セッションリスト全表示（完）
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
			while(rs.next()) {
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
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
			sessionList = null;
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
					sessionList = null;
				}
			}
		}
		return sessionList;

	}

//	FAQリスト全表示 （完）
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

			while(rs.next()) {
				Faq faq = new Faq(
						rs.getInt("faq_id"),
						rs.getString("faq_title"),
						rs.getString("faq_ans"),
						rs.getInt("faq_m_category")
						);
				faqList.add(faq);
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
		return faqList;
	}

//	FAQ登録(完)
	public boolean FaqRegist(Faq faq) {
		Connection conn = null;
		boolean result = false;
		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection(jdbcPass, "sa", "");
			// INSERT文を準備する

			String sql = "INSERT INTO Faq VALUES(null,?,?,?)";
			PreparedStatement pStmtIns = conn.prepareStatement(sql);

			if (faq.getFaq_title() != null&&!faq.getFaq_title().equals("")) {
				pStmtIns.setString(1, faq.getFaq_title());
			}else {pStmtIns.setString(1, null);}
			if (faq.getFaq_ans() != null &&!faq.getFaq_ans().equals("")) {
				pStmtIns.setString(2,faq.getFaq_ans());
			}else {
				pStmtIns.setString(2, null);
			}
			if (faq.getFaq_m_category()<=9) {
				pStmtIns.setInt(3, faq.getFaq_m_category());
			}else {
				System.out.println("この数字は登録されていません");
			}

			// SQL文を実行する
			if (pStmtIns.executeUpdate() == 1) {
				result = true;
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
		return result;

	}
//	FAQ更新(未確認)
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
			String sql = "UPDATE FAQ SET FAQ_TITLE = ?,FAQ_ANS=? where id = ?";
			PreparedStatement pStmtUp = conn.prepareStatement(sql);

			if(faq.getFaq_title() != null) {
				pStmtUp.setString(1, faq.getFaq_title());
			}else {
				pStmtUp.setString(1, null);
			}
			if(faq.getFaq_ans() != null) {
				pStmtUp.setString(2, faq.getFaq_ans());
			}else {
				pStmtUp.setString(2, null);
			}

			pStmtUp.setInt(3, faq.getFaq_id());

			if(pStmtUp.executeUpdate() == 1) {
				result = true;
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
		// 結果を返す
		return result;

	}
//	FAQ削除（未確認）
	public boolean FaqDelete(int id) {
		Connection conn = null;
		boolean result =false;
		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection(jdbcPass, "sa", "");
			// SELECT文を準備する

			String sql = "DELETE FROM FAQ WHERE ID=?";
			PreparedStatement pStmtDelete = conn.prepareStatement(sql);
			pStmtDelete.setInt(1, id);

			if (pStmtDelete.executeUpdate() == 1) {
				result = true;
			}

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


			String[] words = searchWord.split("\s+");
//			もし、複数の検索ワードが含まれていた場合
			if(words.length>1) {
				List<String> qWen = new ArrayList<String>();
				final String q = "?";

//				検索ワードの数分？をリストに追加
			for(int i = 0;i < words.length;i++) {
				qWen.add(q);
			}
//			リストに格納された？をカンマで区切り、一つの文字列にする。
			String wordsResult = String.join(",",qWen);
			String countSql01 = "SELECT *  FROM FAQ WHERE";


			String sql = countSql01 + "( FAQ_TITLE, FAQ_ANS) IN (" + wordsResult +")";
			PreparedStatement pStmtCount = conn.prepareStatement(sql);
//			SQL文を完成させる

			if(searchWord != null&&!searchWord.equals("")) {
				int c = 1;
				for(String word:words) {
					pStmtCount.setString(c, word);
					c++;
				}
				pStmtCount.setString(1,"%" + wordsResult + "%");
			}else {
				pStmtCount.setString(1,"%");
			}
			ResultSet rs = pStmtCount.executeQuery();
			while(rs.next()) {
				Faq faq = new Faq(
						rs.getInt("faq_id"),
						rs.getString("faq_title"),
						rs.getString("faq_ans"),
						rs.getInt("faq_m_category")
						);
				faqList.add(faq);
			}
//			検索ワードが一つの場合
			}else {
				List<String> column = new ArrayList<>();

				column.add(" FAQ_TITLE ");
				column.add(" FAQ_ANS ");

				String countSql01 = "SELECT * FROM FAQ WHERE";
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
						Faq faq = new Faq(
								rs.getInt("faq_id"),
								rs.getString("faq_title"),
								rs.getString("faq_ans"),
								rs.getInt("faq_m_category")
								);
						faqList.add(faq);
					}
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

		return faqList;
	}

//	FAQヒットカウント（完）
	public int FaqCount(String searchWord) {
		Connection conn = null;
		int count=0;
//		List<String> column = new ArrayList<>();

//		List<Integer> countlist = new ArrayList<>();
		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection(jdbcPass, "sa", "");
			// SELECT文を準備する

//			column.add(" FAQ_TITLE ");
//			column.add(" FAQ_ANS ");
//
//			String countSql01 = "SELECT COUNT(*) AS cnt FROM FAQ WHERE";
//			String countSql02= "LIKE ? OR";
//			String countSql03 = "LIKE ?";
//
//				String countSql = countSql01 + column.get(0) + countSql02 + column.get(1) +  countSql03;
//				PreparedStatement pStmtCount = conn.prepareStatement(countSql);
//
//					//SQL分を完成させる
//				if(searchWord != null&&!searchWord.equals("")) {
//					pStmtCount.setString(1,"%" + searchWord + "%");
//					pStmtCount.setString(2,"%" + searchWord + "%");
//				}else {
//					pStmtCount.setString(1,"%");
//					pStmtCount.setString(2,"%");
//				}
//
//
//				ResultSet rs = pStmtCount.executeQuery();
//				while(rs.next()) {
//					count = rs.getInt("cnt");
//				}

			String[] words = searchWord.split("\s+");
			String wordsResult = String.join(",",words);
			String countSql01 = "SELECT COUNT(*) AS cnt FROM FAQ WHERE";

			String sql = countSql01 + "( FAQ_TITLE, FAQ_ANS) IN" + "( ?"+ ")";
			PreparedStatement pStmtCount = conn.prepareStatement(sql);

			if(wordsResult != null&&!wordsResult.equals("")) {
				pStmtCount.setString(1,"%" + wordsResult + "%");
			}else {
				pStmtCount.setString(1,"%");
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

}


