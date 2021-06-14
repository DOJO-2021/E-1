package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Common;
import enums.UserType;
import model.LoginUser;

/**
 * Servlet implementation class TeacherLogin
 */
@WebServlet("/TeacherLogin")
public class TeacherLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// ログインページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/t_login.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// リクエストパラメータを取得する
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("t_id");
		String pw = request.getParameter("t_pw");

		//IDとPWのハッシュ化
//		/Hash idHash = new Hash();
//		Hash pwHash = new Hash();
//
//		String hashId = idHash.getHash(id);
//		String hashPw = pwHash.getHash(pw);



		// ログイン処理を行う
		Common Dao = new Common();
		if (Dao.isLoginOK(UserType.Teacher,id, pw)) {	// ログイン成功

			// セッションスコープにIDを格納する
			HttpSession session = request.getSession();
			session.setAttribute("t_id", new LoginUser(id));

			// メニューサーブレットにリダイレクトする
			response.sendRedirect("/StudyQ/TeacherTop");
		}
		/*
		else {									// ログイン失敗
			// リクエストスコープに、タイトル、メッセージ、戻り先を格納する
			request.setAttribute("result",
			new Result("ログイン失敗！", "IDまたはPWに間違いがあります。", "/StudyQ/TeacherLogin.java"));

			// 結果ページにフォワードする
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/result.jsp");
			dispatcher.forward(request, response);
		}*/
	}
}
