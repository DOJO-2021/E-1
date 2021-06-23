package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CommonDao;
import enums.UserType;
import model.LoginUser;
import util.Hash;

/**
 * Servlet implementation class StudentLogin
 */
@WebServlet("/StudentLogin")
public class StudentLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// ログインページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/s_login.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// リクエストパラメータを取得する
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("s_id");
		String pw = request.getParameter("s_pw");

		String sName="";

		//IDとPWのハッシュ化
		Hash idHash = new Hash();
		Hash pwHash = new Hash();

		String hashId = idHash.getHash(id);
		String hashPw = pwHash.getHash(pw);



		// ログイン処理を行う
		CommonDao Dao = new CommonDao();
		if (Dao.isLoginOK(UserType.Student, hashId, hashPw)) {	// ログイン成功

			 sName = Dao.loginGetName(hashId, hashPw);
			 System.out.println(sName);
			// セッションスコープにIDを格納する
			HttpSession session = request.getSession();
			session.setAttribute("s_id", new LoginUser(hashId));
			session.setAttribute("s_name",sName);
			// 研修生用のTOPページサーブレットにリダイレクト
			response.sendRedirect("/StudyQ/StudentTop");
		}else {
			System.out.println("失敗！");
		}
		/*
		else {									// ログイン失敗
			// リクエストスコープに、タイトル、メッセージ、戻り先を格納する
			request.setAttribute("result",
			new Result("ログイン失敗！", "IDまたはPWに間違いがあります。", "/StudyQ/StudentLogin.java"));

			// 結果ページにフォワードする
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/result.jsp");
			dispatcher.forward(request, response);
		}*/
	}
}
